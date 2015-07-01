package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import kr.ac.kpu.ebiz.spring.tobbyproject.mail.MailMail;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;



public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    MailMail mailMail;

    public void regService(Map map) {

    }

    public void enabledService(Map map) {

    }

    public void viewService(Map map) {

    }

    public void modViewService(Map map) {

    }

    public void modService(Map map) {

    }

    public void deleteEnabledService(Map map) {

    }
}
