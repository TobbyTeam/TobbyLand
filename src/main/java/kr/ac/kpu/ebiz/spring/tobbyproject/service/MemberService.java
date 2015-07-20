package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by happy on 2015-06-30.
 */
public interface MemberService {

    boolean idCheckService(String user_id);

    boolean emailCheckService(String email);

    boolean nickCheckService(String nickname);

    boolean regService(Map member);

    void enabledService(String enSt, ModelAndView mav);

    void viewService(ModelAndView mav);

    boolean pwCheckService(String password);

    void modViewService(ModelAndView mav);

    boolean modNickCheckService(String nickname);

    boolean modService(Map member);

    boolean pwModService(String password);

    boolean unEnabledService();

}
