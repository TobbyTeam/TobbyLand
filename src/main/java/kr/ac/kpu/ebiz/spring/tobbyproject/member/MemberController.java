package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public @ResponseBody boolean member_id(@RequestParam("member_id") String member_id) {

		return memberService.idCheckService(member_id);
	}

	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public @ResponseBody boolean email(@RequestParam("email") String email) {

		return memberService.emailCheckService(email);
	}

	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public @ResponseBody boolean nickCheck(@RequestParam("nickname") String nickname) {

		return memberService.nickCheckService(nickname);
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public @ResponseBody boolean register(@RequestParam Map<String, String> member) {

		return memberService.regService(member);
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
	public @ResponseBody boolean modify(@RequestParam Map<String, String> member) {

		return memberService.modService(member);
	}

	@RequestMapping(value = "/deleteEnabled", method = RequestMethod.GET)
	public String deleteEnabled()	{

		memberService.deleteEnabledService();

		return "etc/login";
	}

}