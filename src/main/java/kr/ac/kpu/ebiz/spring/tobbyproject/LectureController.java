package kr.ac.kpu.ebiz.spring.tobbyproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lecture")
public class LectureController {

	@Autowired
	LectureRepository lectureRepository;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView world() {
		ModelAndView mav = new ModelAndView("/lecture");
		mav.addObject("lectures", lectureRepository.selectAll());
		return mav;
	}

}
