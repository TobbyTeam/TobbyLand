package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by happy on 2015-06-30.
 */
public interface MemberService {

    boolean regService(Map member);

    boolean idCheckService(String member_id);

    boolean emailCheckService(String email);

    boolean nickCheckService(String nickname);

    boolean modNickCheckService(String nickname);

    void enabledService(String enSt, ModelAndView mav);

    void viewService(ModelAndView mav);

    void modViewService(ModelAndView mav);

    boolean modService(Map member);

    boolean pwCheckService(String password);

    boolean pwModService(String password);

    void deleteEnabledService();

}
