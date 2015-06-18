package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;
import org.springframework.security.core.userdetails.User;


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
	public ModelAndView insert(@RequestParam("member_id")String member_id, @RequestParam ("password")String password ,
							   @RequestParam("nickname")String nickname , @RequestParam ("email")String email, @RequestParam("method")String method,
							   @RequestParam ("task")String task, @RequestParam ("exam")String exam) {
		ModelAndView mav = new ModelAndView("/login");
		HashMap<String, String> member = new HashMap<String, String>();
		member.put("member_id",member_id);
		member.put("password",password);
		member.put("nickname",nickname);
		member.put("email",email);
		member.put("method",method);
		member.put("task",task);
		member.put("exam",exam);
		memberRepository.insert(member);

		HashMap member_role = new HashMap();
		member_role.put("member_id", member_id);
		member_role.put("role", "ROLE_USER");
		memberRepository.insert_role(member_role);

		return mav;
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

}