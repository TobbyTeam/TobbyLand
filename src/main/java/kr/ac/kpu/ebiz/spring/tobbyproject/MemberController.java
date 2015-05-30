package kr.ac.kpu.ebiz.spring.tobbyproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/reg")
public class MemberController {

	@Autowired
	MemberRepository memberRepository;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView world() {
		ModelAndView mav = new ModelAndView("/insert");
		mav.addObject("members", memberRepository.selectAll());
		return mav;
	}

}
