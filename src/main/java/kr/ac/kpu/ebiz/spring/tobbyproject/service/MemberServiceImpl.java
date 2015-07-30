package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import kr.ac.kpu.ebiz.spring.tobbyproject.command.Member;
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

    public boolean idCheckService(String user_id) {

        boolean result = false;
        if(memberRepository.selectCountId(user_id) == 0){
            result = true;
        }

        return result;
    }

    public boolean emailCheckService(String email) {

        boolean result = false;
        if(memberRepository.selectCountEmail(email) == 0){
            result = true;
        }

        return result;
    }

    public boolean nickCheckService(String nickname) {

        Map member = new HashMap();
        member.put("nickname", nickname);

        boolean result = false;
        if(memberRepository.selectCountNick(member) == 0){
            result = true;
        }

        return result;
    }

    public boolean regService(Member member) {

        String user_id = member.getUser_id();

        String from = "kpytobbyland@google.com";
        String to = member.getEmail();
        String subject = "TOBBYLAND 인증 메일입니다.";


        String enSt = "";

        boolean result = true;

        try {
            enSt = aes128Cipher.encode(user_id);
        } catch (Exception e) {
            e.printStackTrace();
            result = false;
        }

        String content = user_id+"님 회원가입을 축하드립니다. 아래 링크를 누르시면 메일인증이 됩니다.<br />" + "<a href=\"http://localhost:8080/member/enabled?enSt="+enSt+"\">메일인증</a>";

        mailMail.sendMail( from, to, subject, content);

        return result;
    }

    public boolean enabledService(String enSt, Map member) {

        boolean result = false;

        String user_id = "";

        try {
            user_id = aes128Cipher.decode(enSt);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String user_id2= (String) member.get("user_id");

        if (user_id.equals(user_id2)) {

            String password = (String) member.get("password");
            member.remove("password");
            member.put("password", passwordEncoder.encode(password));
            memberRepository.insertMember(member);
            memberRepository.insertRole(memberRepository.selectId(user_id));

            result = true;

        }

        return result;
    }

    public void viewService(ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        mav.addObject("member", memberRepository.selectMember(member_id));
        mav.addObject("tendencys", memberRepository.selectTendencyAll());

    }

    public boolean pwCheckService(String password) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        boolean result = false;

        if (passwordEncoder.matches(password, memberRepository.selectPassword(member_id))){
            result = true;
        }

        return result;
    }

    public void modViewService(ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        mav.addObject("member", memberRepository.selectMember(member_id));
        mav.addObject("questions", question.question());
        mav.addObject("tendencys", memberRepository.selectTendencyAll());

    }

    public boolean modNickCheckService(String nickname) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        Map member = new HashMap();
        member.put("nickname", nickname);
        member.put("member_id", member_id);

        boolean result = false;

        if(memberRepository.selectCountNick(member) == 0){
            result = true;
        }

        return result;
    }

    public boolean modService(Map member) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        member.put("member_id",member_id);

        boolean result = false;

        if(memberRepository.updateMember(member)){
            result = true;
        }
        return result;
    }

    public boolean pwModService(String password) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        Map member = new HashMap();
        member.put("member_id", member_id);
        member.put("password", passwordEncoder.encode(password));

        boolean result = false;

        if(memberRepository.updatePassword(member)){
            result = true;
        }

        return result;
    }

    public boolean lockService() {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        boolean result = false;

        if(memberRepository.updateLocked(member_id)){
            result = true;
            SecurityContextHolder.clearContext();
        }

        return result;

    }
}
