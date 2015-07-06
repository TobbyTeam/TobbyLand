package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import kr.ac.kpu.ebiz.spring.tobbyproject.department.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
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

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        lecture.put("member_id", member_id);

        lectureRepository.insert(lecture);

        mav.addObject("lectures", lectureRepository.selectAll());
    }

    public void viewService(int lecture_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String writer = lectureRepository.selectMember(lecture_id);

        Collection authorities = user.getAuthorities();

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){
            Map lecture = lectureRepository.select(lecture_id);
            mav.addObject("lecture", lecture);
            mav.addObject("departments", departmentRepository.selectAll());
        } else {
            mav.setViewName("/lecture/list");
            mav.addObject("lectures", lectureRepository.selectAll());
            mav.addObject("error", "본인이 생성하신 강의가 아닙니다.");
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

    public int likesService(int lecture_id) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        Map lecture = new HashMap();
        lecture.put("lecture_id", lecture_id);
        lecture.put("member_id", member_id);

        int count = lectureRepository.selectSub(lecture);

        int result;

        if(count != 0) {
            result = 0;
        } else {
            lectureRepository.insertSub(lecture);
            lectureRepository.updateLike(lecture_id);
            result = 1;
        }

        return result;
    }

    public void isDeleteService(int lecture_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        Collection authorities = user.getAuthorities();

        String writer = lectureRepository.selectMember(lecture_id);

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){
            lectureRepository.isDelete(lecture_id);
        } else{
            mav.addObject("error", "본인이 작성한 것이 아닙니다.");
        }

        mav.addObject("lectures", lectureRepository.selectAll());
    }

}
