package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface MemberRepository {

	Map select(String memberId);

	int selectMember(String user_id);

	int selectEmail(String email);

	int selectNick(String nickname);

	String selectId(String user_id);

	int selectModNick(Map member);

	String selectPw(String memberId);

	int selectEn(String memberId);

	List<Map> selectAll();

	boolean delete(String memberId);

	boolean deleteEnabled(String memberId);

	boolean enabled(String memberId);

	boolean insert(Map member);

	boolean insert_role(String memberId);

	boolean update(Map member);

	boolean updatePw(Map member);
}

