package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {

	@Autowired
	EvaluationRepository evaluationRepository;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView world() {
		ModelAndView mav = new ModelAndView("/evaluation/list");
		mav.addObject("evaluations", evaluationRepository.selectAll());
		return mav;
	}

}