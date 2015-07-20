package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import kr.ac.kpu.ebiz.spring.tobbyproject.encryptor.AES128Cipher;
import kr.ac.kpu.ebiz.spring.tobbyproject.etc.Question;
import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.MemberRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    MailMail mailMail;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    AES128Cipher aes128Cipher;

    @Autowired
    Question question;

    public boolean regService(Map member) {

        String user_id = (String) member.get("user_id");
        String password = (String) member.get("password");
        String email = (String) member.get("email");

        String enSt = "";

        try {
            enSt = aes128Cipher.encode(user_id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        boolean result = false;

        member.remove(password);
        member.put("password", passwordEncoder.encode(password));

        if(memberRepository.insert(member) && memberRepository.insert_role(memberRepository.selectId(user_id))) {
            result = true;
        }

/*        mailMail.sendMail(
                "kpytobbyland@google.com", email,
                "TOBBYLAND 인증 메일입니다.",
                member_id+"님 회원가입을 축하드립니다. \n\n" +
                        "http://localhost:8080/member/enabled?member_id="+enSt);*/

/*            MemberThread thread = new MemberThread(member_id);
            thread.start();*/

        return result;
    }

    public boolean idCheckService(String user_id) {

        boolean result = false;
        if(memberRepository.selectMember(user_id) == 0){
            result = true;
        }

        return result;
    }

    public boolean emailCheckService(String email) {

        boolean result = false;
        if(memberRepository.selectEmail(email) == 0){
            result = true;
        }

        return result;
    }

    public boolean nickCheckService(String nickname) {

        boolean result = false;
        if(memberRepository.selectNick(nickname) == 0){
            result = true;
        }

        return result;
    }

    public boolean modNickCheckService(String nickname) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        Map member = new HashMap();
        member.put("nickname", nickname);
        member.put("member_id", member_id);

        boolean result = false;

        if(memberRepository.selectModNick(member) == 0){
            result = true;
        }

        return result;
    }

    public void enabledService(String enSt, ModelAndView mav) {


        String member_id = "";
        try {
            member_id = aes128Cipher.decode(enSt);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int enabled = memberRepository.selectEn(member_id);

        if(enabled ==0){
            memberRepository.enabled(member_id);
            mav.addObject("message", "인증 되셨습니다.");
        } else {
            mav.addObject("message", "이미 인증이 된 회원입니다.");
        }
    }

    public void viewService(ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        mav.addObject("member", memberRepository.select(member_id));
    }

    public void modViewService(ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

            Map member = memberRepository.select(member_id);
            mav.addObject("member", member);
            mav.addObject("questions", question.question());

    }

    public boolean modService(Map member) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        member.put("member_id",member_id);

        boolean result = false;

        if(memberRepository.update(member)){
            result = true;
        }
        return result;
    }

    public boolean pwCheckService(String password) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        boolean result = false;

        if (passwordEncoder.matches(password, memberRepository.selectPw(member_id))){
            result = true;
        }

        return result;
    }

    public boolean pwModService(String password) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        Map member = new HashMap();
        member.put("member_id", member_id);
        member.put("password", passwordEncoder.encode(password));

        boolean result = false;

        if(memberRepository.updatePw(member)){
            result = true;
        }

        return result;
    }

    public void deleteEnabledService() {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        SecurityContextHolder.clearContext();

        memberRepository.deleteEnabled(member_id);

    }
}
