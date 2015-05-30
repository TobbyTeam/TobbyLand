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
@RequestMapping("/lecture_view")
public class LectureViewController {

    @Autowired
    LectureRepository lectureRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView view(@RequestParam String lecture_id) {
        Map lecture = lectureRepository.select(Integer.parseInt(lecture_id));
        ModelAndView mav = new ModelAndView("lecture_mod");
        mav.addObject("lecture", lecture);
        return mav;
    }

}