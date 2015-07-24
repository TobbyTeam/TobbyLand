package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import kr.ac.kpu.ebiz.spring.tobbyproject.repository.DepartmentRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.LectureRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by happy on 2015-07-01.
 */
public class LectureServiceImpl implements LectureService{

    @Autowired
    LectureRepository lectureRepository;

    @Autowired
    DepartmentRepository departmentRepository;


    public void listService(ModelAndView mav) {

        mav.addObject("lectures", lectureRepository.selectAll());

    }

    public void regFormService(ModelAndView mav) {

        mav.addObject("departments", departmentRepository.selectAll());

    }

    public boolean regService(Map lecture) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        lecture.put("member_id", member_id);

        boolean result = false;

        if (lectureRepository.insertLecture(lecture)) {
            result = true;
        }

        return result;
    }

    public boolean confirmService(int lecture_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = lectureRepository.selectMember_id(lecture_id);

        Collection authorities = user.getAuthorities();

        boolean result = false;

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){
            result = true;
        }

        return result;
    }

    public void viewService(int lecture_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = lectureRepository.selectMember_id(lecture_id);

        Collection authorities = user.getAuthorities();

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){

            mav.addObject("lecture", lectureRepository.selectLecture(lecture_id));
            mav.addObject("departments", departmentRepository.selectAll());

        } else {
            mav.setViewName("redirect:/lecture/list");
        }

    }

    public boolean modService(Map lecture) {

        boolean result = false;

        if (lectureRepository.updateLecture(lecture)) {
            result = true;
        }

        return result;
    }

    public void searchService(Map search, ModelAndView mav) {

        String searchWord = (String) search.get("searchWord");

        List<Map> result = lectureRepository.selectLectureSearch(search);
        mav.addObject("lectures", result);

        if(result.isEmpty() == true){
            mav.addObject("error", searchWord+"에 대한 검색 결과가 없습니다.");
        }

    }

    public boolean likesService(int lecture_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();


        Map lectureSub = new HashMap();
        lectureSub.put("lecture_id", lecture_id);
        lectureSub.put("member_id", member_id);

        int count = lectureRepository.selectSubCount(lectureSub);

        boolean result = false;

        if(count == 0) {
            lectureRepository.insertSub(lectureSub);
            lectureRepository.updateLectureLike(lecture_id);
            result = true;
        }

        return result;
    }

    public boolean isDeleteService(int lecture_id) {

        boolean data = false;

        if(lectureRepository.updateUnisDelete(lecture_id)){
            data = true;
        }

        return data;
    }

    public void boardListService(int lecture_id, String seq, ModelAndView mav) {

        int startPage = 0;

        int endPage = 0;

        int page = 0;

        try{
            // 시작페이지 설정 1~5 페이지 일경우 1​​
            startPage = (Integer.parseInt(seq) - 1) / 10 * 10 + 1;

            //ex) 현재 6페이지 일경우 (6-1) /5 * 5 +1 = 1 -> 6 페이지 부터 시작​​
            endPage = startPage + 10 - 1;

            if (seq != null && seq != "") {
                if (!seq.equals("1")) {
                    // 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
                    int temp = (Integer.parseInt(seq) - 1) * 15;
                    page = temp;
                } else if (seq.equals("1")) {
                    // 페이지 번호가 1이면 처음부터 15개​
                    page = 0;
                }
            }

        }catch(Exception e){

            // 이상한 페이지 번호 들어오면 해당 게시판 처음으로 리다이렉트​
            mav.setViewName("redirect:/lecture/boardList/" + lecture_id + "/");

        }

        //  전체 게시물 갯수 뽑아옴 ​

        int rownum = lectureRepository.selectBoardCount(lecture_id);

        //pageNum 변수는 전체 페이지의 수​
        int pageNum = rownum / 15 + 1;

        // 게시물이 딱 15개일 경우 다음페이지가 생기지 않게 -1 해줌​
        if (rownum % 15 == 0) {
            pageNum--;
        }

        if (endPage > pageNum) {
            // 예를 들어 마지막페이지가 12페이지인 경우 endPage가 15페이지 까지 출력되기때문에 12페이지로 바꿔줌​
            endPage = pageNum;
        }

        int current = Integer.parseInt(seq);

        mav.setViewName("/lecture/boardList");

        Map lectureBoard = new HashMap();
        lectureBoard.put("lecture_id", lecture_id);
        lectureBoard.put("page", page);

        List<Map> boards = lectureRepository.selectBoardAll(lectureBoard);

        mav.addObject("lecture_id", lecture_id);
        mav.addObject("boards", boards);
        mav.addObject("pageNum", pageNum);
        mav.addObject("start", startPage);
        mav.addObject("end", endPage);
        mav.addObject("current", current);   // 현재 페이지 번호 모델로 넘김

    }

    public boolean boardRegService(Map lectureBoard) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int lecture_id = Integer.parseInt((String)lectureBoard.get("lecture_id"));

/*        int lecture_id =  Integer.parseInt(lectureSub.get("lecture_id").toString());*/

        int maxRnum = lectureRepository.selectBoardMaxRnum(lecture_id);

        int rnum;

        if(maxRnum == 0){
            rnum = 1;
        } else {
            rnum = maxRnum + 1;
        }

        lectureBoard.put("member_id", member_id);
        lectureBoard.put("rnum", rnum);

        boolean result = false;

        if(lectureRepository.insertBoard(lectureBoard)){
            result =true;
        }

        return result;
    }

    public void boardViewService(int lb_id, ModelAndView mav) {

        lectureRepository.updateBoardHit(lb_id);

        mav.addObject("board", lectureRepository.selectBoard(lb_id));
        mav.addObject("replys", lectureRepository.selectBoardReplyAll(lb_id));

    }

    public boolean boardConfirmService(int lb_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = lectureRepository.selectBoardMember_id(lb_id);

        Collection authorities = user.getAuthorities();

        boolean result = false;

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){
            result = true;
        }

        return result;

    }

    public void boardModViewService(int lb_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = lectureRepository.selectBoardMember_id(lb_id);

        Collection authorities = user.getAuthorities();

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){

            mav.addObject("board", lectureRepository.selectBoard(lb_id));

        } else {

            mav.setViewName("redirect:/lecture/boardView?lb_id="+lb_id);
        }

    }

    public boolean boardModService(Map lectureBoard) {

        boolean result = false;

        if (lectureRepository.updateBoard(lectureBoard)) {
            result = true;
        }

        return result;
    }

    public boolean boardIsDeleteService(int lb_id) {

        boolean data = false;

        if(lectureRepository.updateBoardIsDelete(lb_id)) {
            data = true;
        }

        return data;
    }

    public boolean boardSubConfirmService(int lb_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();


        Map lectureBoardSub = new HashMap();
        lectureBoardSub.put("lb_id", lb_id);
        lectureBoardSub.put("member_id", member_id);

        int count = lectureRepository.selectBoardSubCount(lectureBoardSub);

        boolean result = false;

        if(count == 0) {
            lectureRepository.insertBoardSub(lectureBoardSub);
            lectureRepository.updateBoardReport(lb_id);
            result = true;
        }

        return result;

    }

    public boolean boardReplyRegService(Map lectureBoard) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        lectureBoard.put("member_id", member_id);

        boolean result = false;

        if(lectureRepository.insertBoard(lectureBoard)){
            result =true;
        }

        return result;
    }

    public void boardSearchService(Map search, String seq, ModelAndView mav) {

        int startPage = 0;

        int endPage = 0;

        int page = 0;

        int lecture_id =  Integer.parseInt(search.get("lecture_id").toString());

        try{
            // 시작페이지 설정 1~5 페이지 일경우 1​​
            startPage = (Integer.parseInt(seq) - 1) / 10 * 10 + 1;

            //ex) 현재 6페이지 일경우 (6-1) /5 * 5 +1 = 1 -> 6 페이지 부터 시작​​
            endPage = startPage + 10 - 1;

            if (seq != null && seq != "") {
                if (!seq.equals("1")) {
                    // 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
                    int temp = (Integer.parseInt(seq) - 1) * 15;
                    page = temp;
                } else if (seq.equals("1")) {
                    // 페이지 번호가 1이면 처음부터 15개​
                    page = 0;
                }
            }

        }catch(Exception e){

            // 이상한 페이지 번호 들어오면 해당 게시판 처음으로 리다이렉트​
            mav.setViewName("redirect:/lecture/boardList/" + lecture_id + "/1");

        }

        //  전체 게시물 갯수 뽑아옴 ​

        int rownum = lectureRepository.selectBoardSearchCount(search);

        //pageNum 변수는 전체 페이지의 수​
        int pageNum = rownum / 15 + 1;

        // 게시물이 딱 15개일 경우 다음페이지가 생기지 않게 -1 해줌​
        if (rownum % 15 == 0) {
            pageNum--;
        }

        if (endPage > pageNum) {
            // 예를 들어 마지막페이지가 12페이지인 경우 endPage가 15페이지 까지 출력되기때문에 12페이지로 바꿔줌​
            endPage = pageNum;
        }

        int current = Integer.parseInt(seq);

        mav.setViewName("/lecture/boardSearchList");


        search.put("page", page);

        List<Map> boards = lectureRepository.selectBoardSearch(search);

        mav.addObject("lecture_id", lecture_id);
        mav.addObject("search", search);
        mav.addObject("boards", boards);
        mav.addObject("pageNum", pageNum);
        mav.addObject("start", startPage);
        mav.addObject("end", endPage);
        mav.addObject("current", current);   // 현재 페이지 번호 모델로 넘김

    }

}
