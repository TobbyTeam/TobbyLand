package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/lecture_list")
public class LectureListController {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView reg() {
		ModelAndView mav = new ModelAndView("/lecture_reg");
		return mav;
	}

}
