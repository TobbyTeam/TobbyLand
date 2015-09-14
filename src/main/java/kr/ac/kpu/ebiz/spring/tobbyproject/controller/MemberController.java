package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.command.Member;
import kr.ac.kpu.ebiz.spring.tobbyproject.encryptor.AES128Cipher;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.MemberRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.TendencyRepository;
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
	TendencyRepository tendencyRepository;

	@Autowired
	MemberRepository memberRepository;

	@Autowired
	MemberService memberService;

	@Autowired
	AES128Cipher aes128Cipher;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/regExpln", method = RequestMethod.GET)
	public String regExplanation() {

		return "/member/regExpln";
	}

	@RequestMapping(value = "/regForm", method = RequestMethod.GET)
	public ModelAndView regForm() {

		ModelAndView mav = new ModelAndView("/member/register");

		mav.addObject("tendencys", tendencyRepository.selectAll());

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

	@RequestMapping(value = "/regOk", method = RequestMethod.GET)
	public ModelAndView regOk() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("etc/success");

		mav.addObject("message1", "메일이 발송되었습니다.");
		mav.addObject("message2", "KPU 웹메일로 가입인증 메일이 발송되었습니다.<br />메일을 확인하시고 메일인증 후 로그인 하시기 바랍니다.");
		mav.addObject("message3", "회원가입을 진행한 브라우저로 KPU 웹메일 로그인 후 진행 하시기 바랍니다.");

		return mav;

	}

	@RequestMapping(value = "/certification", method = RequestMethod.GET)
	public ModelAndView enabled(@RequestParam("enSt") String enSt, @ModelAttribute("member") Member member, SessionStatus sessionStatus) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {

		ModelAndView mav = new ModelAndView();

		Map member1 = PropertyUtils.describe(member);

		/*0=에러 1=성공 2=잘못된 접근*/

		switch(memberService.certificationService(enSt, member1)) {
			case 1:
				mav.setViewName("etc/success");
				mav.addObject("message1", "메일인증에 성공하셨습니다.");
				mav.addObject("message2", "3초후에 로그인 페이지로 이동합니다.");
				mav.addObject("refresh", "true");
				sessionStatus.setComplete();
			break;
			case 2:
				mav.setViewName("redirect:/invalidAccess");
			break;
			case 0:
				mav.setViewName("redirect:/500");
			break;
			default:
				mav.setViewName("redirect:/500");
		}

		return mav;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view() {

		ModelAndView mav = new ModelAndView("/member/view");

		memberService.viewService(mav);
		mav.addObject("tendencys", tendencyRepository.selectAll());

		return mav;
	}

	@RequestMapping(value = "/pwConfirm", method = RequestMethod.GET)
	public String pwConfirm() {

		return "member/pwConfirm";
	}

	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public @ResponseBody boolean pwCheck(@RequestParam ("password")String password) {

		return memberService.pwCheckService(password);
	}

	@RequestMapping(value = "/modView", method = RequestMethod.GET)
	public ModelAndView modView() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/modify");

		memberService.modViewService(mav);
		mav.addObject("tendencys", tendencyRepository.selectAll());

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

	@RequestMapping(value = "/pwMod", method = RequestMethod.POST)
	public @ResponseBody boolean pwModify(@RequestParam ("password")String password) {

		return memberService.pwModService(password);
	}

	@RequestMapping(value = "/pwModMail", method = RequestMethod.GET)
	public ModelAndView pwModify(@RequestParam ("enSt")String enSt, @RequestParam ("key")String password) {

		ModelAndView mav = new ModelAndView();

		/*0=에러 1=성공 2=잘못된 접근*/

		switch(memberService.pwModService(enSt, password)) {
			case 1:
				mav.setViewName("etc/success");
				mav.addObject("message1", "비밀번호가 정상적으로 변경되었습니다.");
				mav.addObject("message2", "꼭 로그인 후 새로운 비밀번호로 수정하시기 바랍니다.");
				mav.addObject("refresh", "true");
			break;
			case 2:
				mav.setViewName("redirect:/invalidAccess");
			break;
			case 0:
				mav.setViewName("redirect:/500");
			break;
			default:
				mav.setViewName("redirect:/500");
		}

		return mav;
	}

	@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
	public @ResponseBody boolean lock() {

		return memberService.lockService();
	}

	@RequestMapping(value = "/searchForm", method = RequestMethod.GET)
	public String searchForm() {

		return "member/search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody int search(@RequestParam ("email") String email) {

		/*0=에러 1=성공 2=횟수초과 */

		return memberService.searchService(email);
	}

	@RequestMapping(value = "/searchOk", method = RequestMethod.GET)
	public ModelAndView searchOk() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("etc/success");
		mav.addObject("message1", "메일이 발송되었습니다.");
		mav.addObject("message2", "KPU 웹메일로 임시 비밀번호를 포함한 회원정보가 발급되었습니다.");

		return mav;

	}

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public ModelAndView event() {

		ModelAndView mav = new ModelAndView("/member/eventList");

		mav.addObject("members", memberRepository.selectMemberEvent());

		return mav;
	}

}