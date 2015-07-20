package kr.ac.kpu.ebiz.spring.tobbyproject.etc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Question {

    public List<Map> question() {

        Map question1 = new HashMap();
        question1.put("id", 1);
        question1.put("title", "가장 기억에 남는 장소는?");

        Map question2 = new HashMap();
        question2.put("id", 2);
        question2.put("title", "내가 가장 존경하는 인물은?");

        Map question3 = new HashMap();
        question3.put("id", 3);
        question3.put("title", "다른 이메일 주소는?");

        Map question4 = new HashMap();
        question4.put("id", 4);
        question4.put("title", "나의 보물 1호는?");

        Map question5 = new HashMap();
        question5.put("id", 5);
        question5.put("title", "나의 출신 초등학교는?");

        Map question6 = new HashMap();
        question6.put("id", 6);
        question6.put("title", "나의 출신 고향은?");

        Map question7 = new HashMap();
        question7.put("id", 7);
        question7.put("title", "나의 어머니 성함은?");

        Map question8 = new HashMap();
        question8.put("id", 8);
        question8.put("title", "나의 아버지 성함은?");

        Map question9 = new HashMap();
        question9.put("id", 9);
        question9.put("title", "나의 첫사랑 이름은?");

        Map question10 = new HashMap();
        question10.put("id", 10);
        question10.put("title", "가장 친한친구 이름은");

        Map question11 = new HashMap();
        question11.put("id", 11);
        question11.put("title", "가장 좋아하는 색깔은?");

        Map question12 = new HashMap();
        question12.put("id", 12);
        question12.put("title", "가장 좋아하는 운동은?");

        Map question13 = new HashMap();
        question13.put("id", 13);
        question13.put("title", "가장 좋아하는 음식은?");

        List<Map> question = new ArrayList<Map>();
        question.add(question1);
        question.add(question2);
        question.add(question3);
        question.add(question4);
        question.add(question5);
        question.add(question6);
        question.add(question7);
        question.add(question8);
        question.add(question9);
        question.add(question10);
        question.add(question11);
        question.add(question12);
        question.add(question13);

        return question;
    }
}
