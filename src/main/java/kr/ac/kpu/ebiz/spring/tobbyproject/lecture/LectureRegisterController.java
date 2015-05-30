package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import kr.ac.kpu.ebiz.spring.tobbyproject.member.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

/**
 * Created by hellraris on 2015-05-31.
 */
@Controller
@RequestMapping("/lecture_reg")
public class LectureRegisterController {

    @Autowired
    LectureRepository lectureRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView insert(@RequestParam ("lecture_name")String lecture_name, @RequestParam ("dept")String dept ,
                               @RequestParam("prof")String prof)
    {
        ModelAndView mav = new ModelAndView("lecture");
        HashMap lecture = new HashMap();
        lecture.put("lecture_name",lecture_name);
        lecture.put("dept",dept);
        lecture.put("prof",prof);
        mav.addObject("lecturesReg", lectureRepository.insert(lecture));
        mav.addObject("lectures", lectureRepository.selectAll());
        return mav;
    }

}