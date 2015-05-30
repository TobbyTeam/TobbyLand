package kr.ac.kpu.ebiz.spring.tobbyproject;

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
    public ModelAndView insert(@RequestParam ("memberId")String memberId, @RequestParam ("passWord")String passWord ,
                               @RequestParam("nickName")String nickName , @RequestParam ("eMail")String eMail, @RequestParam("metHod")String metHod,
                               @RequestParam ("tAsk")String tAsk, @RequestParam ("eXam")String eXam, @RequestParam ("tYpe")String tYpe)
    {

        ModelAndView mav = new ModelAndView();
        HashMap member = new HashMap();
        member.put("memberId",memberId);
        member.put("passWord",passWord);
        member.put("nickName",nickName);
        member.put("eMail",eMail);
        member.put("metHod",metHod);
        member.put("tAsk",tAsk);
        member.put("eXam",eXam);
        member.put("tYpe",tYpe);
        mav.addObject("members", memberRepository.insert(member));
        return mav;
    }

}