package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
	public @ResponseBody boolean register(@RequestParam Map<String, String> lecture) {

		return lectureService.regService(lecture);
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody boolean confirm(@RequestParam int lecture_id) {

		return lectureService.confirmService(lecture_id);
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("lecture_id") int lecture_id) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/modify");

		lectureService.viewService(lecture_id, mav);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public @ResponseBody boolean modify(@RequestParam Map<String, java.io.Serializable> lecture)	{

		return lectureService.modService(lecture);
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

	@RequestMapping(value = "/boardList/{lecture_id}/{seq}", method = RequestMethod.GET)

	public ModelAndView board2(@PathVariable int lecture_id, @PathVariable String seq) {

		ModelAndView mav = new ModelAndView();

		lectureService.boardListService(lecture_id, seq, mav);

		return mav;
	}

	@RequestMapping(value = "/boardRegForm", method = RequestMethod.GET)
	public ModelAndView boardRegForm(@RequestParam("lecture_id") int lecture_id) {

		ModelAndView mav = new ModelAndView("/lecture/boardRegister");

		mav.addObject("lecture_id", lecture_id);

		return mav;
	}

	@RequestMapping(value = "/boardReg", method = RequestMethod.POST)
		 public @ResponseBody boolean boardReg(@RequestParam Map<String, String> lectureBoard) {

		return lectureService.boardRegService(lectureBoard);
	}

	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public ModelAndView boardView(@RequestParam("lb_id") int lb_id) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/boardView");

		lectureService.boardViewService(lb_id, mav);

		return mav;
	}

	@RequestMapping(value = "/boardConfirm", method = RequestMethod.POST)
	public @ResponseBody boolean boardConfirm(@RequestParam("lb_id") int lb_id) {

		return lectureService.boardConfirmService(lb_id);
	}

	@RequestMapping(value = "/boardModView", method = RequestMethod.GET)
	public ModelAndView boardModView(@RequestParam("lb_id") int lb_id) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/lecture/boardModify");

		lectureService.boardModViewService(lb_id, mav);

		return mav;
	}

	@RequestMapping(value = "/boardMod", method = RequestMethod.POST)
	public @ResponseBody boolean boardMod(@RequestParam Map<String, java.io.Serializable> lectureBoard) {

		return lectureService.boardModService(lectureBoard);
	}

	@RequestMapping(value = "/boardIsDelete", method = RequestMethod.POST)
	public @ResponseBody boolean boardIsDelete(@RequestParam("lb_id") int lb_id)	{

		return lectureService.boardIsDeleteService(lb_id);
	}

	@RequestMapping(value = "/boardSubConfirm", method = RequestMethod.POST)
	public @ResponseBody boolean boardSubConfirm(@RequestParam("lb_id") int lb_id) {

		return lectureService.boardSubConfirmService(lb_id);
	}

	@RequestMapping(value = "/boardReplyReg", method = RequestMethod.POST)
	public @ResponseBody boolean boardReplyReg(@RequestParam Map<String, java.io.Serializable> lectureBoard) {

		return lectureService.boardReplyRegService(lectureBoard);
	}

	@RequestMapping(value = "/paging")
	public String paging(@RequestParam Map<String, java.io.Serializable> param) throws Exception{

		return "/paging";
	}

}
