package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {

	@Autowired
	EvaluationRepository evaluationRepository;

	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam String lecture_id) {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectLecture_id(lecture_id));
		return mav;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list2() {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int evaluation_id) {
		Map evaluation = evaluationRepository.select(evaluation_id);
		ModelAndView mav = new ModelAndView("/evaluation/modify");
		mav.addObject("evaluation", evaluation);
		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam ("evaluation_id") int evaluation_id, @RequestParam("method") String method, @RequestParam("task") String task,
							   @RequestParam("exam") String exam, @RequestParam("comment") String comment, @RequestParam("score") int score) {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		HashMap evaluation = new HashMap();
		evaluation.put("evaluation_id", evaluation_id);
		evaluation.put("method", method);
		evaluation.put("task", task);
		evaluation.put("exam", exam);
		evaluation.put("comment", comment);
		evaluation.put("score", score);
		evaluationRepository.update(evaluation);
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public ModelAndView likes(@RequestParam("evaluation_id")int evaluation_id)
	{	evaluationRepository.updateLike(evaluation_id);
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/dislike", method = RequestMethod.GET)
	public ModelAndView dislike(@RequestParam("evaluation_id")int evaluation_id)
	{	evaluationRepository.updateDislike(evaluation_id);
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report(@RequestParam("evaluation_id")int evaluation_id)
	{	evaluationRepository.updateReport(evaluation_id);
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}
}