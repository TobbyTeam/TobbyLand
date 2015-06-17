package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import java.util.List;
import java.util.Map;

public interface MemberRepository {

	Map select(Integer memberId);

	List<Map> selectAll();

	boolean delete(int memberId);

	boolean insert(Map member);

	boolean insert_role(Map member);

	boolean update(Map member);
}

