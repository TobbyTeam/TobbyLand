package kr.ac.kpu.ebiz.spring.tobbyproject.admin;

import kr.ac.kpu.ebiz.spring.tobbyproject.lecture.LectureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	LectureRepository lectureRepository;

	@RequestMapping(value = "/lecture/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/admin/lectureList");
		mav.addObject("lectures", lectureRepository.selectAdmin());
		return mav;
	}

	@RequestMapping(value = "/lecture/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView("/lecture/modify");
		Map lecture = lectureRepository.select(lecture_id);
		mav.addObject("lecture", lecture);

		return mav;

	}

	@RequestMapping(value = "/lecture/isDelete", method = RequestMethod.GET)
	public ModelAndView isDelete(@RequestParam("lecture_id") int lecture_id)	{

		ModelAndView mav = new ModelAndView("/admin/lectureList");
		lectureRepository.isDelete(lecture_id);

		mav.addObject("lectures", lectureRepository.selectAdmin());

		return mav;
	}

	@RequestMapping(value = "/lecture/isUndelete", method = RequestMethod.GET)
	public ModelAndView isUndelete(@RequestParam("lecture_id") int lecture_id)	{

		ModelAndView mav = new ModelAndView("/admin/lectureList");
		lectureRepository.isUndelete(lecture_id);

		mav.addObject("lectures", lectureRepository.selectAdmin());

		return mav;
	}

	@RequestMapping(value = "/lecture/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("lecture_id") int lecture_id)	{

		ModelAndView mav = new ModelAndView("/admin/lectureList");
		lectureRepository.delete(lecture_id);

		mav.addObject("lectures", lectureRepository.selectAdmin());

		return mav;
	}

}
