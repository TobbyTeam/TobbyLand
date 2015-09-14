package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface MemberRepository {

	/*select*/

	int selectCountId(String user_id);

	int selectCountEmail(String email);

	int selectCountNick(Map member);

	int selectMemberId(String user_id);

	int selectEnabled(int member_id);

	Map selectMember(int member_id);

	String selectPassword(int member_id);

	Map selectId(String email);

	int selectCountSearch(Map member);

	int selectSearch(int member_id);

	Map selectMemberTendency(int member_id);

	int selectEvaluationCount(int member_id);

	List<Map> selectMemberEvent();


	/*insert*/

	boolean insertMember(Map member);

	boolean insertRole(int member_id);

	boolean insertSearch(Map member);


	/*update*/

	boolean updateEnabled(int member_id);

	boolean updateMember(Map member);

	boolean updateEvaluation(int member_id);

	boolean updateEvaluationCount(int member_id);

	boolean updateUnEvaluationCount(int member_id);

	boolean updatePassword(Map member);

	boolean updateLocked(int member_id);

	boolean updateSearch(int member_id);

	boolean updateSearchZero(int member_id);



	/*delete*/

	boolean delete(int member_id);

}

