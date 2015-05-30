package kr.ac.kpu.ebiz.spring.tobbyproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("/modify")
public class ModifyController {

	@Autowired
	MemberRepository memberRepository;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView modify(@RequestParam String id) {
		Map member = memberRepository.select(Integer.parseInt(id));
		ModelAndView mav = new ModelAndView("/modify");
		mav.addObject("member", member);
		return mav;
	}

}
