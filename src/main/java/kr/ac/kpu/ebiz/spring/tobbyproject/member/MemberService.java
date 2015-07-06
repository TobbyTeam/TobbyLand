package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by happy on 2015-06-30.
 */
public interface MemberService {

    void regService(Map member, ModelAndView mav);

    void enabledService(String member_id, ModelAndView mav);

    Map viewService();

    void modViewService(String password, ModelAndView mav);

    void modService(Map member, ModelAndView mav);

    void deleteEnabledService();

}
