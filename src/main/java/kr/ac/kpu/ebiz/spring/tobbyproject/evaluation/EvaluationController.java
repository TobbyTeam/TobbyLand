package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {

	@Autowired
	EvaluationRepository evaluationRepository;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam int lecture_id) {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectLecture_id(lecture_id));
		return mav;
	}

	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public ModelAndView list2() {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}

}
