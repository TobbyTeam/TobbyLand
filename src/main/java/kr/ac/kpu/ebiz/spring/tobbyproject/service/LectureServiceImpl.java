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
        String member_id = user.getUsername();

        lecture.put("member_id", member_id);

        boolean result = false;

        if (lectureRepository.insert(lecture)) {
            result = true;
        }

        return result;
    }

    public boolean confirmService(int lecture_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String writer = lectureRepository.selectMember(lecture_id);

        Collection authorities = user.getAuthorities();

        boolean result = false;

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){
            result = true;
        }

        return result;
    }

    public void viewService(int lecture_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String writer = lectureRepository.selectMember(lecture_id);

        Collection authorities = user.getAuthorities();

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){

            mav.addObject("lecture", lectureRepository.select(lecture_id));
            mav.addObject("departments", departmentRepository.selectAll());

        } else {
            mav.setViewName("redirect:/lecture/list");
        }

    }

    public boolean modService(Map lecture) {

        boolean result = false;

        if (lectureRepository.update(lecture)) {
            result = true;
        }

        return result;
    }

    public void searchService(Map search, ModelAndView mav) {

        List<Map> result = lectureRepository.selectSearch(search);
        mav.addObject("lectures", result);

        if(result.isEmpty() == true){
            mav.addObject("error", "검색 결과가 없습니다.");
        }

    }

    public boolean likesService(int lecture_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();


        Map lectureSub = new HashMap();
        lectureSub.put("lecture_id", lecture_id);
        lectureSub.put("member_id", member_id);

        int count = lectureRepository.selectSub(lectureSub);

        boolean result = false;

        if(count == 0) {
            lectureRepository.insertSub(lectureSub);
            lectureRepository.updateLike(lecture_id);
            result = true;
        }

        return result;
    }

    public boolean isDeleteService(int lecture_id) {

        boolean data = false;

        if(lectureRepository.isDelete(lecture_id)){
            data = true;
        }

        return data;
    }

    public void boardListService(int lecture_id, String seq, ModelAndView mav) {

        mav.addObject("pnum", seq);         // 현재 페이지 번호 모델로 넘김

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
            mav.setViewName("redirect:/lecture/boardList/" + lecture_id + "/1");

        }

        //  전체 게시물 갯수 뽑아옴 ​
        int rownum = lectureRepository.boardCount(lecture_id);

        //pageNum 변수는 전체 페이지의 수​
        int pageNum = rownum / 15 + 1;

        // 게시물이 딱 15개일 경우 다음페이지가 생기지 않게 -1 해줌​
        if (rownum % 15 == 0) {
            pageNum--;
        }

        int finalEndPage = pageNum;

        if (endPage > pageNum) {
            // 예를 들어 마지막페이지가 12페이지인 경우 endPage가 15페이지 까지 출력되기때문에 12페이지로 바꿔줌​
            endPage = pageNum;
        }

        int current = Integer.parseInt(seq);

        mav.setViewName("/lecture/boardList");

        Map lectureSub = new HashMap();
        lectureSub.put("lecture_id", lecture_id);
        lectureSub.put("page", page);
        lectureSub.put("total", rownum);

        List<Map> boards = lectureRepository.boardAll(lectureSub);

        mav.addObject("boards", boards);
        mav.addObject("pageNum", pageNum);
        mav.addObject("start", startPage);
        mav.addObject("end", endPage);
        mav.addObject("finalEnd", finalEndPage);
        mav.addObject("current", current);
        System.out.println(seq+"페이지확인");

    }

    public boolean boardRegService(Map lectureSub) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        int kind = 2;

        lectureSub.put("member_id", member_id);
        lectureSub.put("kind", kind);

        boolean result = false;

        if(lectureRepository.insertSub(lectureSub)){
            result =true;
        }

        return result;
    }

    public void boardViewService(int ls_id, ModelAndView mav) {

        mav.addObject("board", lectureRepository.boardOne(ls_id));
        mav.addObject("replys", lectureRepository.boardReplyAll(ls_id));

    }

    public boolean boardConfirmService(int ls_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String writer = lectureRepository.boardMember(ls_id);

        Collection authorities = user.getAuthorities();

        System.out.println(writer+"확인확인확인인");

        boolean result = false;

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){
            result = true;
        }

        return result;

    }

    public void boardModViewService(int ls_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String writer = lectureRepository.boardMember(ls_id);

        Collection authorities = user.getAuthorities();

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){

            mav.addObject("board", lectureRepository.boardOne(ls_id));

        } else {

            mav.setViewName("redirect:/lecture/boardView?ls_id="+ls_id);
        }

    }

    public boolean boardModService(Map lectureSub) {

        boolean result = false;

        if (lectureRepository.boardMod(lectureSub)) {
            result = true;
        }

        return result;
    }

    public boolean boardIsDeleteService(int ls_id) {

        boolean data = false;

        if(lectureRepository.boardIsDelete(ls_id)) {
            data = true;
        }

        return data;
    }

    public boolean boardReplyRegService(Map lectureSub) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        int kind = 3;

        lectureSub.put("member_id", member_id);
        lectureSub.put("kind", kind);

        boolean result = false;

        if(lectureRepository.insertSub(lectureSub)){
            result =true;
        }

        return result;
    }

}
