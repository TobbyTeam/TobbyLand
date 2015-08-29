package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import kr.ac.kpu.ebiz.spring.tobbyproject.command.Member;
import kr.ac.kpu.ebiz.spring.tobbyproject.encryptor.AES128Cipher;
import kr.ac.kpu.ebiz.spring.tobbyproject.etc.TemporaryPassword;
import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.MemberRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    TemporaryPassword temporaryPassword;

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

        String from = "tobbyland@tobbyland.com";
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

        String content = user_id+"님 회원가입을 축하드립니다. 아래 링크를 누르시면 메일인증이 됩니다.<br /><br />" + "<a href=\"http://tobbyland.com/member/certification?enSt="+enSt+"\">메일인증</a>";

        mailMail.sendMail( from, to, subject, content);

        return result;
    }

    public int certificationService(String enSt, Map member) {

        int result = 0;

        String user_id = "";

        try {
            user_id = aes128Cipher.decode(enSt);
        } catch (Exception e) {
            e.printStackTrace();

            result = 2;
            return result;
        }

        String user_id2= (String) member.get("user_id");

        if (user_id.equals(user_id2)) {

            String password = (String) member.get("password");
            member.remove("password");
            member.put("password", passwordEncoder.encode(password));

            if(memberRepository.insertMember(member)&&memberRepository.insertRole(memberRepository.selectMemberId(user_id))){
                result = 1;
            } else {
                return result;
            }

        } else {
            result = 2;
        }

        return result;
    }

    public void viewService(ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        mav.addObject("member", memberRepository.selectMember(member_id));

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

        String newNickname = (String) member.get("nickname");

        String nickname = user.getNickname();

        if(!nickname.equals(newNickname)){

            user.setNickname(newNickname);

        }

        member.put("member_id",member_id);

        return memberRepository.updateMember(member);
    }

    public boolean pwModService(String password) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        Map member = new HashMap();
        member.put("member_id", member_id);
        member.put("password", passwordEncoder.encode(password));

        return memberRepository.updatePassword(member);
    }

    public int pwModService(String enSt, String password) {

        int result = 0;

        String id = "";

        try {
            id = aes128Cipher.decode(enSt);
        } catch (Exception e) {
            e.printStackTrace();
            result = 2;
            return result;
        }

        int member_id = Integer.parseInt(id);

        if(memberRepository.selectSearch(member_id) !=0) {

            Map member = new HashMap();
            member.put("member_id", member_id);
            member.put("password", password);

            if(memberRepository.updateSearchZero(member_id)&&memberRepository.updatePassword(member)){
                result = 1;
            } else {
                return result;
            }

        } else {
            result = 2;

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

    public int searchService(String email) {

        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

        String ip = req.getHeader("X-FORWARDED-FOR");

        if (ip == null) {
            ip = req.getRemoteAddr();
        }

        Map member = memberRepository.selectId(email);

        String user_id = (String) member.get("user_id");

        member.put("ip", ip);
        member.remove("user_id");

        int result = 0;

        if(memberRepository.selectCountSearch(member) < 5) {

            String member_id = member.get("member_id").toString();

            String newPassword = temporaryPassword.temporaryPassword(10);

            String password = passwordEncoder.encode(newPassword);

            if(memberRepository.updateSearch(Integer.parseInt(member_id))&&memberRepository.insertSearch(member)){

                String enSt = "";

                try {
                    enSt = aes128Cipher.encode(member_id);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                String from = "tobbyland@tobbyland.com";
                String subject = "TOBBYLAND 회원정보 메일";
                String content = "안녕하세요"+user_id+"님 요청하신 회원정보 입니다.<br /> <ul><li>아이디 : "+user_id+"</li>" +
                        "<li>새로운 비밀번호 : "+newPassword+"</li></ul><br />아래 링크를 클릭 하시면 회원님의 비밀번호가 새로운 비밀번호로 변경됩니다.<br />" +
                        "<a href=\"http://tobbyland.com/member/pwModMail?enSt="+enSt+"&key="+password+"\">비밀번호변경</a><br />" +
                        "만약 토비랜드에서 이런 요청을 하신적이 없다면 이 이메일을 무시하셔도 됩니다.<br />" +
                        "링크를 클릭하여 새로운 비밀번호를 설정하기 전까지는 비밀번호가 변경되지 않습니다.";

                mailMail.sendMail( from, email, subject, content);

                result = 1;

            } else {
                return result;
            }

        } else {
            result = 2;
        }

        return result;
    }

}
