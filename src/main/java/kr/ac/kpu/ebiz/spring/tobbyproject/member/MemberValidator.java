package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Validator;
import org.springframework.validation.Errors;

/**
 * Created by happy on 2015-06-19.
 */
public class MemberValidator implements Validator {

    @Autowired
    MemberRepository memberRepository;

    public boolean supports(Class<?> arg0) {
        return Member.class.isAssignableFrom(arg0);  // 검증할 객체의 클래스 타입 정보
    }

    public void validate(Object obj, Errors errors) {
        System.out.println("validate()");
        Member member = (Member) obj;

/*
        int count = memberRepository.selectCount(member_id);
        System.out.println(count);
*//*

        int count1 = 10;*/

        int count = member.getTest();
        if (count != 0) {
            System.out.println("member_id is duplication");
            errors.rejectValue("member_id", "trouble");
        }

        String member_id = member.getMember_id();
        if (member_id == null || member_id.trim().isEmpty()) {
            System.out.println("member_id is null or empty");
            errors.rejectValue("member_id", "trouble");
        }

        String password = member.getPassword();
        if (password == null || password.trim().isEmpty()) {
            System.out.println("password is null or empty");
            errors.rejectValue("password", "trouble");
        }

        String nickname = member.getNickname();
        if (nickname == null || nickname.trim().isEmpty()) {
            System.out.println("nickname is null or empty");
            errors.rejectValue("nickname", "trouble");
        }

        String email = member.getEmail();
        if (email == null || email.trim().isEmpty()) {
            System.out.println("email is null or empty");
            errors.rejectValue("email", "trouble");
        }

        String method = member.getMethod();
        if (method == null ) {
            System.out.println("method is null or empty");
            errors.rejectValue("method", "trouble");
        }

        String task = member.getTask();
        if (task == null) {
            System.out.println("task is null or empty");
            errors.rejectValue("task", "trouble");
        }

        String exam = member.getExam();
        if (exam == null ) {
            System.out.println("exam is null or empty");
            errors.rejectValue("exam", "trouble");
        }
    }
}