package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberRepository memberRepository;

	@RequestMapping(value = "/reg_form", method = RequestMethod.GET)
	public String reg() {
		return "/member/register";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String insert(@ModelAttribute("Member") Member member, BindingResult result) {

		String page = "/etc/login";

		String member_id = member.getMember_id();

//		System.out.println(member_id+"+"+"멤버아이디 확인");

		int count = memberRepository.selectCount(member_id);

		member.setTest(count);

//		System.out.println(count + "+" +"잘되나 확인하자");

		int count1= member.getTest();

//		System.out.println(count1 + "+" + "모델 셋 확인");

		MemberValidator validator = new MemberValidator();
		validator.validate(member, result);

		if(result.hasErrors()) {

			page = "/member/register";

		} else {

		String password = member.getPassword();
		String nickname = member.getNickname();
		String email = member.getEmail();
		String method = member.getMethod();
		String task = member.getTask();
		String exam = member.getExam();

		HashMap<String, String> member1 = new HashMap<String, String>();
		member1.put("member_id",member_id);
		member1.put("password",password);
		member1.put("nickname", nickname);
		member1.put("email",email);
		member1.put("method",method);
		member1.put("task", task);
		member1.put("exam",exam);

		HashMap<String, String> member_role = new HashMap<String, String>();
		member_role.put("member_id", member_id);
		member_role.put("role", "ROLE_USER");

		memberRepository.insert(member1);

		memberRepository.insert_role(member_role);

		}

		return page;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view() {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		Map member = memberRepository.select(member_id);
		ModelAndView mav = new ModelAndView("/member/view");
		mav.addObject("member", member);
		return mav;
	}

	@RequestMapping(value = "/modView", method = RequestMethod.GET)
	public ModelAndView modView() {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		Map member = memberRepository.select(member_id);
		ModelAndView mav = new ModelAndView("/member/modify");
		mav.addObject("member", member);
		return mav;
	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam ("password")String password ,
							   @RequestParam("nickname")String nickname , @RequestParam("method")String method,
							   @RequestParam ("task")String task, @RequestParam ("exam")String exam) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		HashMap<String, String> memberMod = new HashMap<String, String>();
		memberMod.put("member_id",member_id);
		memberMod.put("password",password);
		memberMod.put("nickname",nickname);
		memberMod.put("method",method);
		memberMod.put("task",task);
		memberMod.put("exam",exam);
		memberRepository.update(memberMod);

		ModelAndView mav = new ModelAndView("/member/view");
		Map member = memberRepository.select(member_id);
		mav.addObject("member", member);

		return mav;
	}

	@RequestMapping(value = "/deleteEnabled", method = RequestMethod.GET)
	public String deleteEnabled()	{

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		SecurityContextHolder.clearContext();

		HashMap<String, String> member = new HashMap<String, String>();
		member.put("member_id",member_id);
		memberRepository.deleteEnabled(member);

		return "etc/login";
	}

}