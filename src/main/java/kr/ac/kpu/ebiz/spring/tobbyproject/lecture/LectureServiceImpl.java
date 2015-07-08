package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import kr.ac.kpu.ebiz.spring.tobbyproject.department.DepartmentRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.member.MemberInfo;
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

    public void regService(Map lecture, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        lecture.put("member_id", member_id);

        lectureRepository.insert(lecture);

        mav.addObject("lectures", lectureRepository.selectAll());
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

    public void modService(Map lecture, ModelAndView mav) {

        lectureRepository.update(lecture);

        mav.addObject("lectures", lectureRepository.selectAll());

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

        Map lecture = new HashMap();
        lecture.put("lecture_id", lecture_id);
        lecture.put("member_id", member_id);

        int count = lectureRepository.selectSub(lecture);

        boolean result = false;

        if(count == 0) {
            lectureRepository.insertSub(lecture);
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

}
