package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class MemberRepositoryImpl extends SqlSessionDaoSupport implements MemberRepository {

	/*select*/

	public int selectCountId(String user_id) {
		return getSqlSession().selectOne("MemberRepository.selectCountId", user_id);
	}

	public int selectCountEmail(String email) {
		return getSqlSession().selectOne("MemberRepository.selectCountEmail", email);
	}

	public int selectCountNick(Map member) {
		return getSqlSession().selectOne("MemberRepository.selectCountNick", member);
	}

	public int selectMemberId(String user_id) {
		return getSqlSession().selectOne("MemberRepository.selectMemberId", user_id);
	}

	public int selectEnabled(int member_id) {
		return getSqlSession().selectOne("MemberRepository.selectEnabled", member_id);
	}

	public Map selectMember(int member_id) {
		return getSqlSession().selectOne("MemberRepository.selectMember", member_id);
	}

	public String selectPassword(int member_id) {
		return getSqlSession().selectOne("MemberRepository.selectPassword", member_id);
	}

	public Map selectId(String email) {
		return getSqlSession().selectOne("MemberRepository.selectId", email);
	}

	public int selectCountSearch(Map member) {
		return getSqlSession().selectOne("MemberRepository.selectCountSearch", member);
	}

	public int selectSearch(int member_id) {
		return getSqlSession().selectOne("MemberRepository.selectSearch", member_id);
	}

	public Map selectMemberTendency(int member_id) {
		return getSqlSession().selectOne("MemberRepository.selectMemberTendency", member_id);
	}

	public int selectEvaluationCount(int member_id) {
		return getSqlSession().selectOne("MemberRepository.selectEvaluationCount", member_id);
	}

	public List<Map> selectMemberEvent() {
		return getSqlSession().selectList("MemberRepository.selectMemberEvent");
	}



	/*insert*/

	public boolean insertMember(Map member) {
		return getSqlSession().insert("MemberRepository.insertMember", member) > 0;
	}

	public boolean insertRole(int member_id) {
		return getSqlSession().insert("MemberRepository.insertRole", member_id) > 0;
	}

	public boolean insertSearch(Map member) {
		return getSqlSession().insert("MemberRepository.insertSearch", member) > 0;
	}



	/*update*/

	public boolean updateEnabled(int member_id) {
		return getSqlSession().update("MemberRepository.updateEnabled", member_id) > 0;
	}

	public boolean updateMember(Map member) {
		return getSqlSession().update("MemberRepository.updateMember", member) > 0;
	}

	public boolean updateEvaluation(int member_id) {
		return getSqlSession().update("MemberRepository.updateEvaluation", member_id) > 0;
	}

	public boolean updateEvaluationCount(int member_id) {
		return getSqlSession().update("MemberRepository.updateEvaluationCount", member_id) > 0;
	}

	public boolean updateUnEvaluationCount(int member_id) {
		return getSqlSession().update("MemberRepository.updateUnEvaluationCount", member_id) > 0;
	}

	public boolean updatePassword(Map member) {
		return getSqlSession().update("MemberRepository.updatePassword", member) > 0;
	}

	public boolean updateLocked(int member_id) {
		return getSqlSession().update("MemberRepository.updateLocked", member_id) > 0;
	}

	public boolean updateSearch(int member_id) {
		return getSqlSession().update("MemberRepository.updateSearch", member_id) > 0;
	}

	public boolean updateSearchZero(int member_id) {
		return getSqlSession().update("MemberRepository.updateSearchZero", member_id) > 0;
	}


	/*delete*/

	public boolean delete(int member_id) { return getSqlSession().delete("MemberRepository.delete", member_id) > 0;
	}

}
