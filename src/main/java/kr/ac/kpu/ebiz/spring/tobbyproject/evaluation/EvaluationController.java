package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

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
	public ModelAndView register(@RequestParam("lecture_id") int lecture_id,@RequestParam("method") String method,
							   @RequestParam("task") String task, @RequestParam("exam") String exam,
							   @RequestParam("comment") String comment, @RequestParam("score") int score,
							   @RequestParam("semester") String semester) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		HashMap<String, java.io.Serializable> evaluation = new HashMap<String, java.io.Serializable>();
		evaluation.put("lecture_id", lecture_id);
		evaluation.put("member_id", member_id);
		evaluation.put("method", method);
		evaluation.put("task", task);
		evaluation.put("exam", exam);
		evaluation.put("comment", comment);
		evaluation.put("score", score);
		evaluation.put("semester", semester);

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
	public ModelAndView modify(@RequestParam("evaluation_id") int evaluation_id, @RequestParam("method") String method, @RequestParam("task") String task,
							   @RequestParam("exam") String exam, @RequestParam("comment") String comment, @RequestParam("score") int score,
							   @RequestParam("lecture_id") int lecture_id,@RequestParam("semester") String semester) {

		HashMap<String, java.io.Serializable> evaluation = new HashMap<String, java.io.Serializable>();
		evaluation.put("evaluation_id", evaluation_id);
		evaluation.put("method", method);
		evaluation.put("task", task);
		evaluation.put("exam", exam);
		evaluation.put("comment", comment);
		evaluation.put("score", score);
		evaluation.put("semester", semester);

		ModelAndView mav = new ModelAndView("/evaluation/list");

		evaluationService.modService(lecture_id, evaluation, mav);

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
	public ModelAndView search(@RequestParam ("method")String method, @RequestParam ("task")String task, @RequestParam ("exam")String exam,
							   @RequestParam("lecture_id") int lecture_id) {

		HashMap search = new HashMap();
		search.put("lecture_id",lecture_id);
		search.put("method",method);
		search.put("task",task);
		search.put("exam",exam);

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
	public ModelAndView replyReg(@RequestParam("evaluation_id")int evaluation_id, @RequestParam ("contents")String contents) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		HashMap evaluationSub = new HashMap();
		evaluationSub.put("evaluation_id", evaluation_id);
		evaluationSub.put("member_id", member_id);
		evaluationSub.put("contents", contents);

		ModelAndView mav = new ModelAndView();

		evaluationService.replyRegService(evaluationSub, mav);

		return mav;
	}

}