package kr.ac.kpu.ebiz.spring.tobbyproject.member;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class MemberRepositoryImpl extends SqlSessionDaoSupport implements MemberRepository {

	public Map select(String memberId) {
		return getSqlSession().selectOne("MemberRepository.select", memberId);
	}

	public int selectCount(String memberId) {
		return getSqlSession().selectOne("MemberRepository.selectCount", memberId);
	}

	public String selectPw(String memberId) {
		return getSqlSession().selectOne("MemberRepository.selectPw", memberId);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("MemberRepository.selectAll");
	}

	public boolean delete(String memberId) { return getSqlSession().delete("MemberRepository.delete", memberId) > 0;
	}

	public boolean deleteEnabled(String memberId) {
		return getSqlSession().update("MemberRepository.deleteEnabled", memberId) > 0;
	}

	public boolean enabled(String memberId) {
		return getSqlSession().update("MemberRepository.enabled", memberId) > 0;
	}

	public boolean insert(Map member) {
		return getSqlSession().insert("MemberRepository.insert", member) > 0;
	}

	public boolean insert_role(String memberId) {
		return getSqlSession().insert("MemberRepository.insert_role", memberId) > 0;
	}

	public boolean update(Map member) {
		return getSqlSession().update("MemberRepository.update", member) > 0;
	}
}
