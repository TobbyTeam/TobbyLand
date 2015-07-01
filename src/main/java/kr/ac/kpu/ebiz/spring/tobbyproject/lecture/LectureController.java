package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

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
	public ModelAndView register(@RequestParam ("lecture_name")String lecture_name, @RequestParam ("dept")String dept,
							   @RequestParam("prof")String prof) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();


		HashMap<String, String> lecture = new HashMap<String, String>();
		lecture.put("member_id", member_id);
		lecture.put("lecture_name", lecture_name);
		lecture.put("dept", dept);
		lecture.put("prof", prof);

		ModelAndView mav = new ModelAndView("/lecture/list");
		lectureService.regService(lecture, mav);

		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/modify");

		lectureService.viewService(lecture_id, mav);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam int lecture_id,@RequestParam ("lecture_name")String lecture_name,
							   @RequestParam ("dept")String dept, @RequestParam("prof")String prof)	{

		HashMap<String, java.io.Serializable> lecture = new HashMap<String, java.io.Serializable>();
		lecture.put("lecture_id",lecture_id);
		lecture.put("lecture_name",lecture_name);
		lecture.put("dept",dept);
		lecture.put("prof",prof);

		ModelAndView mav = new ModelAndView("/lecture/list");

		lectureService.modService(lecture, mav);

		return mav;
	}

	@RequestMapping(value = "/search_form", method = RequestMethod.GET)
	public String search_form() {
		return "/lecture/search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam ("searchType")String searchType, @RequestParam ("searchWord")String searchWord) {

		HashMap search = new HashMap();
		search.put("searchType",searchType);
		search.put("searchWord",searchWord);

		ModelAndView mav = new ModelAndView("lecture/searchList");

		lectureService.searchService(search, mav);

		return mav;

	}

	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public ModelAndView likes(@RequestParam("lecture_id")int lecture_id) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		lecture.put("member_id", member_id);

		ModelAndView mav = new ModelAndView("/lecture/list");

		lectureService.likesService(lecture, mav);

		return mav;
	}

	@RequestMapping(value = "/isDelete", method = RequestMethod.GET)
	public ModelAndView isDelete(@RequestParam("lecture_id") int lecture_id)	{

		ModelAndView mav = new ModelAndView("/lecture/list");

		lectureService.isDeleteService(lecture_id, mav);

		return mav;
	}

}
