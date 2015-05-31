package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

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
@RequestMapping("/lecture_likes")
public class LectureLikeController {

    @Autowired
    LectureRepository lectureRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView likes(@RequestParam ("lecture_id")int lecture_id)
    {
        ModelAndView mav = new ModelAndView("lecture");
        mav.addObject("lecturelikes", lectureRepository.updateLike(lecture_id));
        mav.addObject("lectures", lectureRepository.selectAll());
        return mav;
    }

}