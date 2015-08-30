package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.repository.LectureRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import kr.ac.kpu.ebiz.spring.tobbyproject.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/lecture")
public class LectureController {

	@Autowired
	LectureService lectureService;

	@Autowired
	LectureRepository lectureRepository;

	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST })
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
	public @ResponseBody int confirm(@RequestParam int lecture_id) {

		/* 1=성공 2=너꺼아님 3=삭제된거*/

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

	@RequestMapping(value = "/search_form", method = {RequestMethod.GET, RequestMethod.POST })
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
	public @ResponseBody int likes(@RequestParam("lecture_id") int lecture_id) {

		/* 0=에러 1=성공 2=이미한거 */

		return lectureService.likesService(lecture_id);
	}

	@RequestMapping(value = "/isDelete", method = RequestMethod.POST)
	public @ResponseBody boolean isDelete(@RequestParam("lecture_id") int lecture_id)	{

		return lectureService.isDeleteService(lecture_id);
	}

	@RequestMapping(value = "/boardList/{lecture_id}/", method = RequestMethod.GET)
	public ModelAndView boardList(@PathVariable int lecture_id, @RequestParam(value="page", required = false, defaultValue="1") int page,
							  @RequestParam(value="searchType", required = false, defaultValue="") String searchType, @RequestParam(value="searchWord", required = false, defaultValue="") String searchWord) {

		ModelAndView mav = new ModelAndView();

			mav.addObject("lecture_id", lecture_id);

			if(!searchType.isEmpty()){
				Map search = new HashMap();
				search.put("searchType", searchType);
				search.put("searchWord", searchWord);
				search.put("lecture_id", lecture_id);
				lectureService.boardSearchService(search, page, mav);
				mav.setViewName("/lecture/boardSearchList");
			} else {
				lectureService.boardListService(lecture_id, page, mav);
				mav.setViewName("/lecture/boardList");
			}

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

	@RequestMapping(value = "/boardView/{lecture_id}/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardView(@PathVariable int lecture_id, @RequestParam("lb_id") int lb_id, @RequestParam(value="page", required = false, defaultValue="1") int page,
								  @RequestParam(value="searchType", required = false, defaultValue="") String searchType,
								  @RequestParam(value="searchWord", required = false, defaultValue="") String searchWord) {

		ModelAndView mav = new ModelAndView();

		if(lectureService.boardViewService(lb_id, mav)){

			if(!searchType.isEmpty()){
				Map search = new HashMap();
				search.put("searchType", searchType);
				search.put("searchWord", searchWord);
				search.put("lecture_id", lecture_id);
				lectureService.boardSearchService(search, page, mav);
				mav.setViewName("/lecture/boardSearchView");

			} else {
				lectureService.boardListService(lecture_id, page, mav);
				mav.setViewName("/lecture/boardView");

			}
		} else {
			mav.setViewName("/lecture/error");
			mav.addObject("lecture_id", lecture_id);
		}

		return mav;
	}

	@RequestMapping(value = "/boardConfirm", method = RequestMethod.POST)
	public @ResponseBody int boardConfirm(@RequestParam("lb_id") int lb_id) {

		/* 1=성공 2=너꺼아님 3=삭제된거*/

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

		System.out.println(lb_id+"리플 아이디 확인");

		return lectureService.boardIsDeleteService(lb_id);
	}

	@RequestMapping(value = "/boardSubConfirm", method = RequestMethod.POST)
	public @ResponseBody int boardSubConfirm(@RequestParam("lb_id") int lb_id) {

		return lectureService.boardSubConfirmService(lb_id);
	}

	@RequestMapping(value = "/boardReplyReg", method = RequestMethod.POST)
	public @ResponseBody boolean boardReplyReg(@RequestParam Map<String, java.io.Serializable> lectureBoard) {

		return lectureService.boardReplyRegService(lectureBoard);
	}

	@RequestMapping(value = "/boardRegTest", method = RequestMethod.GET)
	public String boardRegTest(@RequestParam("lecture_id") int lecture_id) {

		MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int member_id = user.getMember_id();

		Map lectureBoard = new HashMap();
		lectureBoard.put("lecture_id", lecture_id);
		lectureBoard.put("member_id", member_id);

		for(int i=1; i<301; i++){

			int rnum = i;

			String test = "테스트"+i;

			lectureBoard.put("writer", test);
			lectureBoard.put("rnum", rnum);
			lectureBoard.put("title", test);
			lectureBoard.put("contents", test);

			lectureRepository.insertBoard(lectureBoard);

		}

		return "redirect:/lecture//boardList/"+lecture_id+"/";
	}

}
