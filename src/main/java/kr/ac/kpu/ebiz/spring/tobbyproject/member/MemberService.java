package kr.ac.kpu.ebiz.spring.tobbyproject.member;

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

    void enabledService(String member_id, ModelAndView mav);

    void viewService(ModelAndView mav);

    void modViewService(String password, ModelAndView mav);

    void modService(Map member, ModelAndView mav);

    void deleteEnabledService();

}
