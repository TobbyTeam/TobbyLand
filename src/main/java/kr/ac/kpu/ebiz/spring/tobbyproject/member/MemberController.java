package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberRepository memberRepository;

	@Autowired
	MailMail mailMail;

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public String regForm() {
		return "/member/register";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ModelAndView register(@RequestParam Map<String, String> member) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/etc/login");

		memberService.regService(member, mav);

		return mav;
	}

	@RequestMapping(value = "/enabled", method = RequestMethod.GET)
	public ModelAndView enabled(@RequestParam("member_id") String member_id) {

		ModelAndView mav = new ModelAndView("/member/enabled");

		memberService.enabledService(member_id, mav);

		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view() {

		ModelAndView mav = new ModelAndView("/member/view");

		memberService.viewService(mav);

		return mav;
	}

	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String password() {

		return "member/password";
	}

	@RequestMapping(value = "/modView", method = RequestMethod.POST)
	public ModelAndView modView(@RequestParam ("password")String password) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/modify");

		memberService.modViewService(password, mav);

		return mav;

	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String, String> member) {

		ModelAndView mav = new ModelAndView("/member/view");

		memberService.modService(member, mav);

		return mav;
	}

	@RequestMapping(value = "/deleteEnabled", method = RequestMethod.GET)
	public String deleteEnabled()	{

		memberService.deleteEnabledService();

		return "etc/login";
	}

}