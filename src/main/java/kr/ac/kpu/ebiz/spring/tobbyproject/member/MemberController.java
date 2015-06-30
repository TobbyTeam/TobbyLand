package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
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

	@Autowired
	MailMail mailMail;

	@RequestMapping(value = "/reg_form", method = RequestMethod.GET)
	public String reg() {
		return "/member/register";
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ModelAndView insert(@RequestParam ("member_id")String member_id, @RequestParam ("password")String password,
						 @RequestParam ("nickname")String nickname, @RequestParam ("email")String email,
						 @RequestParam ("method")String method, @RequestParam ("task")String task, @RequestParam ("exam")String exam) {

		HashMap<String, String> member = new HashMap<String, String>();
		member.put("member_id",member_id);
		member.put("password",password);
		member.put("nickname", nickname);
		member.put("email",email);
		member.put("method",method);
		member.put("task", task);
		member.put("exam",exam);

		int count = memberRepository.selectCount(member_id);

		ModelAndView mav = new ModelAndView();

		if(count !=0) {
			mav.addObject("member", member);
			mav.addObject("error", "등록된 아이디 입니다.");
			mav.setViewName("/member/register");
			return mav;
		}

		HashMap<String, String> member_role = new HashMap<String, String>();
		member_role.put("member_id", member_id);

		memberRepository.insert(member);

		memberRepository.insert_role(member_id);

		mav.addObject("member_id", member_id);
		mav.setViewName("/etc/login");

		mailMail.sendMail("kpytobbyland@google.com",
				email,
				"TOBBYLAND 인증 메일입니다.",
				member_id+"님 회원가입을 축하드립니다. \n\n" +
						"http://localhost:8080/member/enabled?member_id="+member_id);

		return mav;
	}

	@RequestMapping(value = "/enabled", method = RequestMethod.GET)
	public String enabled(@RequestParam("member_id") String member_id) {

		System.out.println(member_id+"++++++아이디 확인");

/*		HashMap<String, String> member = new HashMap<String, String>();
		member.put("member_id",member_id);*/
		memberRepository.enabled(member_id);

		return "redirect:etc/login";
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

	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String password() {

		return "member/password";
	}

	@RequestMapping(value = "/modView", method = RequestMethod.POST)
	public ModelAndView modView(@RequestParam ("password")String password) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();
		String member_pw = user.getPassword();

		System.out.println(member_pw + "+++++ 세션 패스워드");

		if(member_pw.equals(password)){
			Map member = memberRepository.select(member_id);
			ModelAndView mav = new ModelAndView("/member/modify");
			mav.addObject("member", member);
			return mav;
		}

		ModelAndView mav = new ModelAndView("/member/password");
		mav.addObject("error", "비밀번호가 틀립니다");
		return mav;

	}

	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam ("password")String password,
							   @RequestParam("nickname")String nickname, @RequestParam("method")String method,
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