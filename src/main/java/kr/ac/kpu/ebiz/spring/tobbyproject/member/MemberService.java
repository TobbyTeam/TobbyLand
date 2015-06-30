package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import java.util.Map;

/**
 * Created by happy on 2015-06-30.
 */
public interface MemberService {

    void regService(Map map);

    void enabledService(Map map);

    void viewService(Map map);

    void modViewService(Map map);

    void modService(Map map);

    void deleteEnabledService(Map map);

}
