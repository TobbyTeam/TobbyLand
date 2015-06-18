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
import java.util.Map;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {

	@Autowired
	EvaluationRepository evaluationRepository;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam int lecture_id,@RequestParam("lecture_name") String lecture_name) {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		lecture.put("lecture_name", lecture_name);
		mav.addObject("lecture", lecture);
		mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
		return mav;
	}

	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public ModelAndView list2() {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}

	@RequestMapping(value = "/reg_form", method = RequestMethod.GET)
	public ModelAndView reg(@RequestParam int lecture_id) {
		ModelAndView mav = new ModelAndView("/evaluation/register");
		HashMap evaluation = new HashMap();
		evaluation.put("lecture_id", lecture_id);
		mav.addObject("evaluation", evaluation);
		return mav;
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ModelAndView insert(@RequestParam("lecture_id") int lecture_id,@RequestParam("method") String method,
							   @RequestParam("task") String task, @RequestParam("exam") String exam,
							   @RequestParam("comment") String comment, @RequestParam("score") int score) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();


		ModelAndView mav = new ModelAndView("/evaluation/list");
		HashMap<String, java.io.Serializable> evaluation = new HashMap<String, java.io.Serializable>();
		evaluation.put("lecture_id", lecture_id);
		evaluation.put("member_id", member_id);
		evaluation.put("method", method);
		evaluation.put("task", task);
		evaluation.put("exam", exam);
		evaluation.put("comment", comment);
		evaluation.put("score", score);
		evaluationRepository.insert(evaluation);
		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		mav.addObject("lecture", lecture);
		mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
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
	public ModelAndView modify(@RequestParam("evaluation_id") int evaluation_id, @RequestParam("method") String method, @RequestParam("task") String task,
							   @RequestParam("exam") String exam, @RequestParam("comment") String comment, @RequestParam("score") int score,
							   @RequestParam("lecture_id") int lecture_id) {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		HashMap<String, java.io.Serializable> evaluation = new HashMap<String, java.io.Serializable>();
		evaluation.put("evaluation_id", evaluation_id);
		evaluation.put("method", method);
		evaluation.put("task", task);
		evaluation.put("exam", exam);
		evaluation.put("comment", comment);
		evaluation.put("score", score);
		evaluationRepository.update(evaluation);
		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		mav.addObject("lecture", lecture);
		mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
		return mav;
	}

	@RequestMapping(value = "/likes", method = RequestMethod.GET)
	public ModelAndView likes(@RequestParam("evaluation_id")int evaluation_id, @RequestParam("lecture_id") int lecture_id)
	{	evaluationRepository.updateLike(evaluation_id);
		ModelAndView mav = new ModelAndView("/evaluation/list");
		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		mav.addObject("lecture", lecture);
		mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
		return mav;
	}

	@RequestMapping(value = "/dislike", method = RequestMethod.GET)
	public ModelAndView dislike(@RequestParam("evaluation_id")int evaluation_id, @RequestParam("lecture_id") int lecture_id)
	{	evaluationRepository.updateDislike(evaluation_id);

		ModelAndView mav = new ModelAndView("/evaluation/list");
		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		mav.addObject("lecture", lecture);
		mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
		return mav;
	}

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report(@RequestParam("evaluation_id")int evaluation_id, @RequestParam("lecture_id") int lecture_id)
	{	evaluationRepository.updateReport(evaluation_id);
		ModelAndView mav = new ModelAndView("/evaluation/list");
		HashMap lecture = new HashMap();
		lecture.put("lecture_id", lecture_id);
		mav.addObject("lecture", lecture);
		mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
		return mav;
	}
}