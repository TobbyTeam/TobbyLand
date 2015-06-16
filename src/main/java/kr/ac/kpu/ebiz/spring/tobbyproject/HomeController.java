package kr.ac.kpu.ebiz.spring.tobbyproject;

import kr.ac.kpu.ebiz.spring.tobbyproject.member.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Locale;

@Controller
@RequestMapping("")
public class HomeController {

	@RequestMapping(method = RequestMethod.GET)
	public String home() {
		return "/member/loginForm";
	}

}