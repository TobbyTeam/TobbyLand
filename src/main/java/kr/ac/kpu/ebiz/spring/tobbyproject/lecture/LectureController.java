package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("/lecture")
public class LectureController {

	@Autowired
	LectureService lectureService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/lecture/list");
		lectureService.listService(mav);
		return mav;
	}

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public ModelAndView regForm() {
		ModelAndView mav = new ModelAndView("/lecture/register");
		lectureService.regFormService(mav);
		return mav;
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ModelAndView register(@RequestParam Map<String, String> lecture) {

		ModelAndView mav = new ModelAndView("redirect:/lecture/list");

		lectureService.regService(lecture, mav);

		return mav;
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody boolean confirm(@RequestParam int lecture_id) {

		return lectureService.confirmService(lecture_id);
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/modify");

		lectureService.viewService(lecture_id, mav);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String, java.io.Serializable> lecture)	{

		ModelAndView mav = new ModelAndView("redirect:/lecture/list");

		lectureService.modService(lecture, mav);

		return mav;
	}

	@RequestMapping(value = "/search_form", method = RequestMethod.GET)
	public String search_form() {
		return "/lecture/search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String, String> search) {

		ModelAndView mav = new ModelAndView("lecture/searchList");

		lectureService.searchService(search, mav);

		return mav;

	}

	@RequestMapping(value = "/likes", method = RequestMethod.POST)
	public @ResponseBody boolean likes(@RequestParam("lecture_id") int lecture_id) {

		return lectureService.likesService(lecture_id);
	}

	@RequestMapping(value = "/isDelete", method = RequestMethod.POST)
	public @ResponseBody boolean isDelete(@RequestParam("lecture_id") int lecture_id)	{

		return lectureService.isDeleteService(lecture_id);
	}

}
