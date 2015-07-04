package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public ModelAndView regForm(@RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView();

		evaluationService.regFormService(lecture_id, mav);

		return mav;
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ModelAndView register(@RequestParam Map<String, Serializable> evaluation) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.regService(evaluation, mav);

		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int evaluation_id, @RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView("/evaluation/modify");

		evaluationService.viewService(lecture_id, evaluation_id, mav);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String, Serializable> evaluation) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.modService(evaluation, mav);

		return mav;
	}

	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public ModelAndView likes(@RequestParam("evaluation_id")int evaluation_id, @RequestParam("lecture_id") int lecture_id,
							  @RequestParam(value = "error", required = false) String error) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.likesService(lecture_id, evaluation_id, mav);

		return mav;
	}

	@RequestMapping(value = "/dislike", method = RequestMethod.GET)
	public ModelAndView dislike(@RequestParam("evaluation_id")int evaluation_id, @RequestParam("lecture_id") int lecture_id,
							  @RequestParam(value = "error", required = false) String error) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.dislikeService(lecture_id, evaluation_id, mav);

		return mav;
	}

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report(@RequestParam("evaluation_id")int evaluation_id, @RequestParam("lecture_id") int lecture_id,
							  @RequestParam(value = "error", required = false) String error) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.reportService(lecture_id, evaluation_id, mav);

		return mav;
	}

	@RequestMapping(value = "/isDelete", method = RequestMethod.GET)
	public ModelAndView isDelete(@RequestParam("evaluation_id")int evaluation_id, @RequestParam("lecture_id") int lecture_id) {

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.isDeleteService(lecture_id, evaluation_id, mav);

		return mav;
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
	public ModelAndView replyReg(@RequestParam Map<String, Serializable> evaluationSub) {

		ModelAndView mav = new ModelAndView();

		evaluationService.replyRegService(evaluationSub, mav);

		return mav;
	}

}