package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import kr.ac.kpu.ebiz.spring.tobbyproject.command.Member;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by happy on 2015-06-30.
 */
public interface MemberService {

    boolean idCheckService(String user_id);

    boolean emailCheckService(String email);

    boolean nickCheckService(String nickname);

    boolean regService(Member member);

    int certificationService(String enSt, Map member);

    void viewService(ModelAndView mav);

    boolean pwCheckService(String password);

    void modViewService(ModelAndView mav);

    boolean modNickCheckService(String nickname);

    boolean modService(Map member);

    boolean pwModService(String password);

    int pwModService(String enSt, String password);

    boolean lockService();

    int searchService(String email);

}
