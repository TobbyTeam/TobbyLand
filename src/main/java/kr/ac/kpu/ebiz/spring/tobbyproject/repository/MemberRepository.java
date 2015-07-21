package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface MemberRepository {

	/*select*/

	int selectCountId(String user_id);

	int selectCountEmail(String email);

	int selectCountNick(Map member);

	int selectId(String user_id);

	int selectEnabled(int member_id);

	Map selectMember(int member_id);

	String selectPassword(int member_id);

	List<Map> selectTendencyAll();


	/*insert*/

	boolean insertMember(Map member);

	boolean insertRole(int member_id);


	/*update*/

	boolean updateEnabled(int member_id);

	boolean updateMember(Map member);

	boolean updatePassword(Map member);

	boolean updateLocked(int member_id);


	/*delete*/

	boolean delete(int member_id);

}

