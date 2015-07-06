package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    MailMail mailMail;

    public void regService(Map member, ModelAndView mav) {

        String member_id = (String) member.get("member_id");
        String email = (String) member.get("email");

        int count = memberRepository.selectCount(member_id);

        if(count !=0) {
            mav.addObject("member", member);
            mav.addObject("error", "등록된 아이디 입니다.");
            mav.setViewName("/member/register");
        } else {
            memberRepository.insert(member);
            memberRepository.insert_role(member_id);
            mav.addObject("member_id", member_id);

/*            mailMail.sendMail(
                    "kpytobbyland@google.com", email,
                    "TOBBYLAND 인증 메일입니다.",
                    member_id+"님 회원가입을 축하드립니다. \n\n" +
                            "http://localhost:8080/member/enabled?member_id="+member_id);*/

/*            MemberThread thread = new MemberThread(member_id);
            thread.start();*/

        }
    }

    public void enabledService(String member_id, ModelAndView mav) {

        int enabled = memberRepository.selectEn(member_id);

        if(enabled ==0){
            memberRepository.enabled(member_id);
            mav.addObject("message", "인증 되셨습니다.");
        } else {
            mav.addObject("message", "이미 인증이 된 회원입니다.");
        }
    }

    public Map viewService() {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        Map member = memberRepository.select(member_id);

        return  member;
    }

    public void modViewService(String password, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String member_pw = memberRepository.selectPw(member_id);

        if(member_pw.equals(password)){
            Map member = memberRepository.select(member_id);
            mav.addObject("member", member);
        } else {
            mav.setViewName("/member/password");
            mav.addObject("error", "비밀번호가 틀립니다");
        }

    }

    public void modService(Map member, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        member.put("member_id",member_id);

        memberRepository.update(member);

        mav.addObject("member", memberRepository.select(member_id));

    }

    public void deleteEnabledService() {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        SecurityContextHolder.clearContext();

        memberRepository.deleteEnabled(member_id);

    }
}
