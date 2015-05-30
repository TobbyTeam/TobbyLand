package kr.ac.kpu.ebiz.spring.hellproject;

import java.util.List;
import java.util.Map;

/**
 * Created by hellraris on 2015-05-30.
 */
public interface MemberRepository {

    Map select(String memberId);

    List<Map> selectAll();

    boolean delete(String memberId);

    boolean insert(Map member);

    boolean update(Map member);
}
