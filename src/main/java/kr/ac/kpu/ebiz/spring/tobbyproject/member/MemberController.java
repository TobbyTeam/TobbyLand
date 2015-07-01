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
	public ModelAndView register(@RequestParam ("member_id")String member_id, @RequestParam ("password")String password,
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
	public ModelAndView modify(@RequestParam ("password")String password,
							   @RequestParam("nickname")String nickname, @RequestParam("method")String method,
							   @RequestParam ("task")String task, @RequestParam ("exam")String exam) {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		HashMap<String, String> member = new HashMap<String, String>();
		member.put("member_id",member_id);
		member.put("password",password);
		member.put("nickname",nickname);
		member.put("method",method);
		member.put("task",task);
		member.put("exam",exam);

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