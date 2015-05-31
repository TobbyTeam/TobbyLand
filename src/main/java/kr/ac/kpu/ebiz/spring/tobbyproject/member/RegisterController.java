package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

/**
 * Created by hellraris on 2015-05-31.
 */
@Controller
@RequestMapping("/insert")
public class RegisterController {

    @Autowired
    MemberRepository memberRepository;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView insert(@RequestParam ("memberId")String memberId, @RequestParam ("password")String password ,
                               @RequestParam("nickname")String nickname , @RequestParam ("email")String email, @RequestParam("method")String method,
                               @RequestParam ("task")String task, @RequestParam ("exam")String exam)
    {

        ModelAndView mav = new ModelAndView("login");
        HashMap member = new HashMap();
        member.put("memberId",memberId);
        member.put("password",password);
        member.put("nickname",nickname);
        member.put("email",email);
        member.put("method",method);
        member.put("task",task);
        member.put("exam",exam);
        mav.addObject("members", memberRepository.insert(member));
        return mav;
    }

}