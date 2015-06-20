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
import java.util.List;
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
							   @RequestParam("prof")String prof) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		ModelAndView mav = new ModelAndView("/lecture/list");
		HashMap<String, String> lecture = new HashMap<String, String>();
		lecture.put("member_id", member_id);
		lecture.put("lecture_name", lecture_name);
		lecture.put("dept", dept);
		lecture.put("prof", prof);
		lectureRepository.insert(lecture);
		mav.addObject("lectures", lectureRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int lecture_id) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		String writer = lectureRepository.selectMember(lecture_id);

		if(member_id.equals(writer) == false){
			ModelAndView mav = new ModelAndView("/lecture/list");
			mav.addObject("lectures", lectureRepository.selectAll());
			mav.addObject("error", "본인이 생성하신 강의가 아닙니다.");
			return mav;
		}

		ModelAndView mav = new ModelAndView("/lecture/modify");
		Map lecture = lectureRepository.select(lecture_id);
		mav.addObject("lecture", lecture);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam int lecture_id,@RequestParam ("lecture_name")String lecture_name,
							   @RequestParam ("dept")String dept, @RequestParam("prof")String prof)	{

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		String writer = lectureRepository.selectMember(lecture_id);

		ModelAndView mav = new ModelAndView("/lecture/list");

		if(member_id.equals(writer) == false){
			mav.addObject("lectures", lectureRepository.selectAll());
			mav.addObject("error", "본인이 생성하신 강의가 아닙니다.");
		}

		HashMap<String, java.io.Serializable> lecture = new HashMap<String, java.io.Serializable>();
		lecture.put("lecture_id",lecture_id);
		lecture.put("lecture_name",lecture_name);
		lecture.put("dept",dept);
		lecture.put("prof",prof);
		lectureRepository.update(lecture);
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

		List<Map> result = lectureRepository.selectName(lecture_name);

		mav.addObject("lectures", result);

		if(result.isEmpty() == true){
			mav.addObject("error", "검색 결과가 없습니다.");
		}

		return mav;

	}

	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public ModelAndView likes(@RequestParam("lecture_id")int lecture_id,@RequestParam(value = "error", required = false) String error) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		lecture.put("member_id", member_id);

		int count = lectureRepository.selectSub(lecture);

		ModelAndView mav = new ModelAndView("/lecture/list");

		System.out.println(count);

		if(count != 0) {
			mav.addObject("lectures", lectureRepository.selectAll());
			mav.addObject("error", "이미 클릭하셨습니다.");
		} else {
			lectureRepository.insertSub(lecture);
			lectureRepository.updateLike(lecture_id);
			mav.addObject("lectures", lectureRepository.selectAll());
		}

		return mav;
	}

	@RequestMapping(value = "/isDelete", method = RequestMethod.GET)
	public ModelAndView isDelete(@RequestParam("lecture_id") int lecture_id)	{

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		String writer = lectureRepository.selectMember(lecture_id);

		ModelAndView mav = new ModelAndView("/lecture/list");

		if(member_id.equals(writer) == true){
			lectureRepository.isDelete(lecture_id);
		} else {
			mav.addObject("error", "본인이 작성한 것이 아닙니다.");
		}

		mav.addObject("lectures", lectureRepository.selectAll());

		return mav;
	}

}
