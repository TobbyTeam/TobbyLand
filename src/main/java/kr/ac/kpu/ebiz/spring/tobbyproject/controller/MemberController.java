package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.etc.Question;
import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.MemberRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.service.MemberService;
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

	@Autowired
	Question question;

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public ModelAndView regForm() {

		ModelAndView mav = new ModelAndView("/member/register");

		mav.addObject("questions", question.question());

		return mav;
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public @ResponseBody boolean member_id(@RequestParam("user_id") String user_id) {

		return memberService.idCheckService(user_id);
	}

	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public @ResponseBody boolean email(@RequestParam("email") String email) {

		return memberService.emailCheckService(email);
	}

	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public @ResponseBody boolean nickCheck(@RequestParam("nickname") String nickname) {

		return memberService.nickCheckService(nickname);
	}

	@RequestMapping(value = "/modNickCheck", method = RequestMethod.POST)
	public @ResponseBody boolean modNickCheck(@RequestParam("nickname") String nickname) {

		return memberService.modNickCheckService(nickname);
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public @ResponseBody boolean register(@RequestParam Map<String, java.io.Serializable> member) {

		return memberService.regService(member);
	}

	@RequestMapping(value = "/enabled", method = RequestMethod.GET)
	public ModelAndView enabled(@RequestParam("enSt") String enSt) {

		ModelAndView mav = new ModelAndView("/member/enabled");

		memberService.enabledService(enSt, mav);

		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view() {

		ModelAndView mav = new ModelAndView("/member/view");

		memberService.viewService(mav);

		return mav;
	}

	@RequestMapping(value = "/pwConfirm", method = RequestMethod.GET)
	public String pwConfirm() {

		return "member/pwConfirm";
	}

	@RequestMapping(value = "/modView", method = RequestMethod.GET)
	public ModelAndView modView() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/modify");

		memberService.modViewService(mav);

		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public @ResponseBody boolean modify(@RequestParam Map<String, String> member) {

		return memberService.modService(member);
	}

	@RequestMapping(value = "/pwChange", method = RequestMethod.GET)
	public String pwChange() {

		return "member/pwChange";
	}

	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public @ResponseBody boolean pwCheck(@RequestParam ("exPassword")String password) {

		return memberService.pwCheckService(password);
	}

	@RequestMapping(value = "/pwMod", method = RequestMethod.POST)
	public @ResponseBody boolean pwModify(@RequestParam ("password")String password) {

		return memberService.pwModService(password);
	}

	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	public @ResponseBody boolean lock() {

		return memberService.lockService();
	}

}