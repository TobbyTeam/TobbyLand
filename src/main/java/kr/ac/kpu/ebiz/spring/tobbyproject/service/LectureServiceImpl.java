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

        int kind = 1;

        Map lectureSub = new HashMap();
        lectureSub.put("lecture_id", lecture_id);
        lectureSub.put("member_id", member_id);
        lectureSub.put("kind", kind);

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

    public void bodListService(int lecture_id, ModelAndView mav) {

        int kind = 2;

        Map lectureSub = new HashMap();
        lectureSub.put("lecture_id", lecture_id);
        lectureSub.put("kind", kind);

        mav.addObject("boards", lectureRepository.boardAll(lectureSub));
        mav.addObject("lecture_id", lecture_id);

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

}
