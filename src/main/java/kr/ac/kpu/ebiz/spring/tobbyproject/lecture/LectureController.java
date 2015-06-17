package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/lecture")
public class LectureController {

	@Autowired
	LectureRepository lectureRepository;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/lecture/list");
		mav.addObject("lectures", lectureRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/reg_form", method = RequestMethod.GET)
	public String reg() {
		return "/lecture/register";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ModelAndView insert(@RequestParam ("lecture_name")String lecture_name, @RequestParam ("dept")String dept,
							   @RequestParam("prof")String prof)
	{
		ModelAndView mav = new ModelAndView("/lecture/list");
		HashMap<String, String> lecture = new HashMap<String, String>();
		lecture.put("lecture_name", lecture_name);
		lecture.put("dept", dept);
		lecture.put("prof", prof);
		lectureRepository.insert(lecture);
		mav.addObject("lectures", lectureRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int lecture_id) {
		Map lecture = lectureRepository.select(lecture_id);
		ModelAndView mav = new ModelAndView("/lecture/modify");
		mav.addObject("lecture", lecture);
		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam int lecture_id,@RequestParam ("lecture_name")String lecture_name,
							   @RequestParam ("dept")String dept, @RequestParam("prof")String prof)
	{   ModelAndView mav = new ModelAndView("/lecture/list");
		HashMap<String, java.io.Serializable> lecture = new HashMap<String, java.io.Serializable>();
		lecture.put("lecture_id",lecture_id);
		lecture.put("lecture_name",lecture_name);
		lecture.put("dept",dept);
		lecture.put("prof",prof);
		lectureRepository.update(lecture);
		mav.addObject("lectures", lectureRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public ModelAndView likes(@RequestParam("lecture_id")int lecture_id)
	{	lectureRepository.updateLike(lecture_id);
		ModelAndView mav = new ModelAndView("/lecture/list");
		mav.addObject("lectures", lectureRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/search_form", method = RequestMethod.GET)
	public String search_form() {
		return "/lecture/search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam String lecture_name) {
		ModelAndView mav = new ModelAndView("/lecture/search_list");
		mav.addObject("lectures", lectureRepository.selectName(lecture_name));
		return mav;
	}

}
