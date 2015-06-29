package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import java.util.List;
import java.util.Map;

public interface MemberRepository {

	Map select(String memberId);

	int selectCount(String memberId);

	List<Map> selectAll();

	boolean delete(int memberId);

	boolean deleteEnabled(Map member);

	boolean insert(Map member);

	boolean insert_role(String memberId);

	boolean update(Map member);
}

