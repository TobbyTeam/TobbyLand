package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import kr.ac.kpu.ebiz.spring.tobbyproject.paging.Paging;
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

    @Autowired
    Paging paging;


    public void listService(ModelAndView mav) {

        mav.addObject("lectures", lectureRepository.selectAllNon());

    }

    public void regFormService(ModelAndView mav) {

        mav.addObject("departments", departmentRepository.selectAll());

    }

    public boolean regService(Map lecture) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        lecture.put("member_id", member_id);

        return lectureRepository.insertLecture(lecture);
    }

    public int confirmService(int lecture_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int result = 3;

        Map lecture = lectureRepository.selectConfirm(lecture_id);
;
        int writer = Integer.parseInt(lecture.get("member_id").toString());

        boolean is_delete = (Boolean) lecture.get("is_delete");

        if(is_delete){

            return result;

        } else {

            Collection authorities = user.getAuthorities();

            if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){
                result = 1;
            } else {
                result = 2;
            }

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

        return lectureRepository.updateLecture(lecture);
    }

    public void searchService(Map search, ModelAndView mav) {

        String searchWord = (String) search.get("searchWord");

        List<Map> result = lectureRepository.selectLectureSearch(search);
        mav.addObject("lectures", result);
        mav.addObject("message", searchWord+"(으)로 검색한 결과");

        if(result.isEmpty() == true){
            mav.addObject("error", searchWord+"에 대한 검색 결과가 없습니다.");
        }

    }

    public int likesService(int lecture_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();


        Map lectureSub = new HashMap();
        lectureSub.put("lecture_id", lecture_id);
        lectureSub.put("member_id", member_id);

        int count = lectureRepository.selectSubCount(lectureSub);

        int result = 0;

        if(count == 0) {

            if(lectureRepository.updateLectureLike(lecture_id)&&lectureRepository.insertSub(lectureSub)){
                result = 1;
            } else {
                return result;
            }

        } else {
            result = 2;
        }

        return result;
    }

    public boolean isDeleteService(int lecture_id) {

        return lectureRepository.updateIsDelete(lecture_id);
    }

    public void boardListService(int lecture_id, int page, ModelAndView mav) {

        paging.setPageNo(page);
        paging.setPageSize(15);
        paging.setTotalCount(lectureRepository.selectBoardCount(lecture_id));

        mav.addObject("paging", paging);

        int start = 0;

        if (!(page == 1)) {
            // 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
            int temp = (page - 1) * 15;
            start = temp;
        } else if (page==1) {
            // 페이지 번호가 1이면 처음부터 15개​
            start = 0;
        }

        Map lectureBoard = new HashMap();
        lectureBoard.put("start", start);
        lectureBoard.put("lecture_id", lecture_id);

        mav.addObject("lecture_id", lecture_id);
        mav.addObject("boards", lectureRepository.selectBoardAll(lectureBoard));
    }

    public boolean boardRegService(Map lectureBoard) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        String contents_org = (String) lectureBoard.get("contents");
        String contents_db = contents_org.replaceAll("\r\n","<br />");
        lectureBoard.remove("contents");
        lectureBoard.put("contents", contents_db);

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

        return lectureRepository.insertBoard(lectureBoard);
    }

    public boolean boardViewService(int lb_id, ModelAndView mav) {

        boolean result = true;

        if(lectureRepository.updateBoardHit(lb_id)){

            mav.addObject("board", lectureRepository.selectBoard(lb_id));
            mav.addObject("replys", lectureRepository.selectBoardReplyAll(lb_id));

        }else{

            result = false;

        }

        return result;
    }

    public int boardConfirmService(int lb_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        Map lectureBoard = lectureRepository.selectBoardConfirm(lb_id);

        int writer = Integer.parseInt(lectureBoard.get("member_id").toString());

        boolean is_delete = (Boolean) lectureBoard.get("is_delete");

        int result = 3;

        if(is_delete){

            return result;
        } else {

            Collection authorities = user.getAuthorities();

            if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){
                result = 1;
            } else {
                result = 2;
            }
        }

        return result;

    }

    public void boardModViewService(int lb_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = lectureRepository.selectBoardMember_id(lb_id);

        Collection authorities = user.getAuthorities();

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){

            Map board = lectureRepository.selectBoard(lb_id);

            if(board == null){

                mav.setViewName("redirect:/404");

            } else {

                String contents_db = (String) board.get("contents");
                String contents_org = contents_db.replaceAll("<br />", "\r\n");
                board.remove("contents");
                board.put("contents", contents_org);

                mav.addObject("board", board);
            }

        } else {

            mav.setViewName("redirect:/invalidAccess");
        }

    }

    public boolean boardModService(Map lectureBoard) {

        String contents_org = (String) lectureBoard.get("contents");
        String contents_db = contents_org.replaceAll("\r\n","<br />");
        lectureBoard.remove("contents");
        lectureBoard.put("contents", contents_db);

        return lectureRepository.updateBoard(lectureBoard);
    }

    public boolean boardIsDeleteService(int lb_id) {

        return lectureRepository.updateBoardIsDelete(lb_id);
    }

    public int boardSubConfirmService(int lb_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();


        Map lectureBoardSub = new HashMap();
        lectureBoardSub.put("lb_id", lb_id);
        lectureBoardSub.put("member_id", member_id);

        int count = lectureRepository.selectBoardSubCount(lectureBoardSub);

        int result = 0;

        if(count == 0) {

            if(lectureRepository.updateBoardReport(lb_id)&&lectureRepository.insertBoardSub(lectureBoardSub)){
                result = 1;
            } else {
                return result;
            }

        } else {
            result = 2;
        }

        return result;

    }

    public boolean boardReplyRegService(Map lectureBoard) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        lectureBoard.put("member_id", member_id);

        String contents_org = (String) lectureBoard.get("contents");
        String contents_db = contents_org.replaceAll("\r\n","<br />");
        lectureBoard.remove("contents");
        lectureBoard.put("contents", contents_db);

        return lectureRepository.insertBoard(lectureBoard);
    }

    public void boardSearchService(Map search, int page, ModelAndView mav) {

        paging.setPageNo(page);
        paging.setPageSize(15);
        paging.setTotalCount(lectureRepository.selectBoardSearchCount(search));

        mav.addObject("paging", paging);
        mav.addObject("search", search);

        int start = 0;

        if (!(page == 1)) {
            // 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
            int temp = (page - 1) * 15;
            start = temp;
        } else if (page==1) {
            // 페이지 번호가 1이면 처음부터 15개​
            start = 0;
        }

        search.put("start", start);

        mav.addObject("boards", lectureRepository.selectBoardSearch(search));
    }

}
