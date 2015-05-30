package kr.ac.kpu.ebiz.spring.tobbyproject;

import kr.ac.kpu.ebiz.spring.tobbyproject.member.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class Main {

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("/login");
		return mav;
	}

}
