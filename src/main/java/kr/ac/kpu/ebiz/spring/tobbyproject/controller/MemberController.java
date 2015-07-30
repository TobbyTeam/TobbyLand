package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.command.Member;
import kr.ac.kpu.ebiz.spring.tobbyproject.encryptor.AES128Cipher;
import kr.ac.kpu.ebiz.spring.tobbyproject.etc.Question;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.MemberRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.service.MemberService;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;


@Controller

@SessionAttributes("member")

@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberRepository memberRepository;

	@Autowired
	MemberService memberService;

	@Autowired
	Question question;

	@Autowired
	AES128Cipher aes128Cipher;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;


	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Member member) {

		System.out.println("아이디 확인" + member.getUser_id());
		System.out.println("닉네임 확인" + member.getNickname());

		return "/etc/main";
	}

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public ModelAndView regForm() {

		ModelAndView mav = new ModelAndView("/member/register");

		mav.addObject("tendencys", memberRepository.selectTendencyAll());
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
	public @ResponseBody boolean register(Member member, Model model) {

		model.addAttribute("member", member);

		return memberService.regService(member);
	}

	@RequestMapping(value = "/enabled", method = RequestMethod.GET)
	public ModelAndView enabled(@RequestParam("enSt") String enSt, @ModelAttribute Member member, SessionStatus sessionStatus) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {

		ModelAndView mav = new ModelAndView("/member/enabled");

		Map member1 = PropertyUtils.describe(member);

		if(memberService.enabledService(enSt, member1)){
			mav.addObject("message", "메일인증에 성공하셨습니다.");
			sessionStatus.setComplete();
		} else {
			mav.addObject("message", "잘못된 접근입니다.");
		}

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