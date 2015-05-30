package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by hellraris on 2015-05-31.
 */
@Controller
@RequestMapping("/lecture_modify")
public class LectureModifyController {

    @Autowired
    LectureRepository lectureRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView modify(@RequestParam String lecture_id,@RequestParam ("lecture_name")String lecture_name,
                               @RequestParam ("dept")String dept, @RequestParam("prof")String prof)
    {   ModelAndView mav = new ModelAndView("lecture");
        HashMap lecture = new HashMap();
        lecture.put("lecture_id",lecture_id);
        lecture.put("lecture_name",lecture_name);
        lecture.put("dept",dept);
        lecture.put("prof",prof);
        mav.addObject("lectureup", lectureRepository.update(lecture));
        mav.addObject("lectures", lectureRepository.selectAll());
        return mav;
    }

}