package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.Serializable;
import java.util.Map;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {

	@Autowired
	EvaluationService evaluationService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam("lecture_id") int lecture_id) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.listService(lecture_id, mav);

		return mav;
	}

	@RequestMapping(value = "/listBest", method = RequestMethod.GET)
	public ModelAndView listBest(@RequestParam("lecture_id") int lecture_id) {

		ModelAndView mav = new ModelAndView("/evaluation/listBest");

		evaluationService.listBestService(lecture_id, mav);

		return mav;
	}

	@RequestMapping(value = "/regChech", method = RequestMethod.POST)
	public @ResponseBody boolean regChech(@RequestParam("lecture_id") int lecture_id) {

		return evaluationService.regChechService(lecture_id);
	}

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public ModelAndView regForm(@RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView();

		evaluationService.regFormService(lecture_id, mav);

		return mav;
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public @ResponseBody boolean register(@RequestParam Map<String, Serializable> evaluation) {

		return evaluationService.regService(evaluation);
	}

	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody boolean confirm(@RequestParam int evaluation_id) {

		return evaluationService.confirmService(evaluation_id);
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int evaluation_id, @RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView("/evaluation/modify");

		evaluationService.viewService(lecture_id, evaluation_id, mav);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public @ResponseBody boolean modify(@RequestParam Map<String, Serializable> evaluation) {

		return evaluationService.modService(evaluation);
	}

	@RequestMapping(value = "/likes", method = RequestMethod.POST)
	public @ResponseBody int likes(@RequestParam("evaluation_id")int evaluation_id) {

		return evaluationService.likesService(evaluation_id);
	}

	@RequestMapping(value = "/dislike", method = RequestMethod.POST)
	public @ResponseBody int dislike(@RequestParam("evaluation_id")int evaluation_id) {

		return evaluationService.dislikeService(evaluation_id);
	}

	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public @ResponseBody int report(@RequestParam("evaluation_id")int evaluation_id) {

		return evaluationService.reportService(evaluation_id);
	}

	@RequestMapping(value = "/isDelete", method = RequestMethod.POST)
	public @ResponseBody Boolean isDelete(@RequestParam("evaluation_id")int evaluation_id) {

		return evaluationService.isDeleteService(evaluation_id);
	}

	@RequestMapping(value = "/searchPrefer", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String, Serializable> search) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.searchPreferService(search, mav);

		return mav;

	}


	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public ModelAndView replyList(@RequestParam("evaluation_id") int evaluation_id) {

		ModelAndView mav = new ModelAndView("/evaluation/reply");

		evaluationService.replyService(evaluation_id, mav);

		return mav;
	}

	@RequestMapping(value = "/replyReg", method = RequestMethod.POST)
	public @ResponseBody boolean replyReg(@RequestParam Map<String, Serializable> evaluationSub) {

		return evaluationService.replyRegService(evaluationSub);
	}
}