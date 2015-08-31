package kr.ac.kpu.ebiz.spring.tobbyproject.controller;


import kr.ac.kpu.ebiz.spring.tobbyproject.repository.BoardRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.DepartmentRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import kr.ac.kpu.ebiz.spring.tobbyproject.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;

	@Autowired
	BoardRepository boardRepository;

	@Autowired
	DepartmentRepository departmentRepository;

	@RequestMapping(value = "/top", method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView top(@RequestParam("department_id") int department_id) {

		ModelAndView mav = new ModelAndView("/board/top");

		mav.addObject("department", boardService.boardTopService(department_id));

		return mav;
	}


	@RequestMapping(value = "/list/{department_id}/", method = RequestMethod.GET)
	public ModelAndView board(@PathVariable int department_id, @RequestParam(value="page", required = false, defaultValue="1") int page,
							  @RequestParam(value="searchType", required = false, defaultValue="") String searchType, @RequestParam(value="searchWord", required = false, defaultValue="") String searchWord) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("department", departmentRepository.select(department_id));

		if(!searchType.isEmpty()){
			Map search = new HashMap();
			search.put("searchType", searchType);
			search.put("searchWord", searchWord);
			search.put("department_id", department_id);
			boardService.searchService(search, page, mav);
			mav.setViewName("/board/searchList");
		} else {
			boardService.listService(department_id, page, mav);
			mav.setViewName("/board/list");
		}

		return mav;
	}

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public ModelAndView regForm(@RequestParam("department_id") int department_id) {

		ModelAndView mav = new ModelAndView("/board/register");

		mav.addObject("department_id", department_id);

		return mav;
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
		 public @ResponseBody boolean reg(@RequestParam Map<String, String> board) {

		return boardService.regService(board);
	}

	@RequestMapping(value = "/view/{department_id}/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardView(@PathVariable int department_id, @RequestParam("board_id") int board_id, @RequestParam(value="page", required = false, defaultValue="1") int page,
								  @RequestParam(value="searchType", required = false, defaultValue="") String searchType,
								  @RequestParam(value="searchWord", required = false, defaultValue="") String searchWord) {

		ModelAndView mav = new ModelAndView();

		if(boardService.viewService(board_id, mav)){

			if(!searchType.isEmpty()){
				Map search = new HashMap();
				search.put("searchType", searchType);
				search.put("searchWord", searchWord);
				search.put("department_id", department_id);
				boardService.searchService(search, page, mav);
				mav.setViewName("/board/searchView");

			} else {
				mav.setViewName("/board/view");
				boardService.listService(department_id, page, mav);
			}

			mav.addObject("replys", boardRepository.selectBoardReplyAll(board_id));

		} else {
			mav.setViewName("/board/error");
			mav.addObject("department_id", department_id);
		}

		return mav;
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody int confirm(@RequestParam("board_id") int board_id) {

		/* 1=성공 2=너꺼아님 3=삭제된거*/

		return boardService.confirmService(board_id);
	}

	@RequestMapping(value = "/modView", method = RequestMethod.GET)
	public ModelAndView modView(@RequestParam("board_id") int board_id) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/modify");

		boardService.modViewService(board_id, mav);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public @ResponseBody boolean mod(@RequestParam Map<String, java.io.Serializable> board) {

		return boardService.modService(board);
	}

	@RequestMapping(value = "/subConfirm", method = RequestMethod.POST)
	public @ResponseBody int subConfirm(@RequestParam("board_id") int board_id) {

		/* 0=성공 1=추천 2=비공감 3=신고*/

		return boardService.subConfirmService(board_id);
	}

	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public @ResponseBody boolean like(@RequestParam("board_id") int board_id) {

		return boardService.likeService(board_id);
	}

	@RequestMapping(value = "/dislike", method = RequestMethod.POST)
	public @ResponseBody boolean dislike(@RequestParam("board_id") int board_id) {

		return boardService.dislikeService(board_id);
	}

	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public @ResponseBody boolean report(@RequestParam("board_id") int board_id) {

		return boardService.reportService(board_id);
	}

	@RequestMapping(value = "/isDelete", method = RequestMethod.POST)
	public @ResponseBody boolean isDelete(@RequestParam("board_id") int board_id)	{

		return boardService.isDeleteService(board_id);
	}

	@RequestMapping(value = "/replyReg", method = RequestMethod.POST)
	public @ResponseBody boolean replyReg(@RequestParam Map<String, java.io.Serializable> board) {

		return boardService.replyRegService(board);
	}

	@RequestMapping(value = "/replyList", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<Map> replyList(@RequestParam("board_id") int board_id) {

		return boardRepository.selectBoardReplyAll(board_id);
	}

	@RequestMapping(value = "/searchLike", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int searchLike(@RequestParam("board_id") int board_id) {

		return boardRepository.selectBoardLike(board_id);
	}

	@RequestMapping(value = "/searchDislike", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int searchDislike(@RequestParam("board_id") int board_id) {

		return boardRepository.selectBoardDislike(board_id);
	}

	@RequestMapping(value = "/regTest", method = RequestMethod.GET)
	public String boardRegTest(@RequestParam("department_id") int department_id) {

		MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int member_id = user.getMember_id();
		String writer = user.getNickname();

		Map board = new HashMap();
		board.put("department_id", department_id);
		board.put("member_id", member_id);
		board.put("writer", writer);

		for(int i=1; i<301; i++){

			int rnum = i;

			String test = "테스트"+i;

			board.put("rnum", rnum);
			board.put("title", test);
			board.put("contents", test);

			boardRepository.insertBoard(board);

		}

		return "redirect:/board/list/"+department_id+"/";
	}

}
