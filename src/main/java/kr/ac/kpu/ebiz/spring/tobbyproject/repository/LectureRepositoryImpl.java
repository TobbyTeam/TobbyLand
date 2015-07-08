package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class LectureRepositoryImpl extends SqlSessionDaoSupport implements LectureRepository {

	public Map select(Integer lectureId) {
		return getSqlSession().selectOne("LectureRepository.select", lectureId);
	}

	public Map selectIAN(Integer lectureId) {
		return getSqlSession().selectOne("LectureRepository.selectIAN", lectureId);
	}

	public String selectMember(Integer lectureId) {
		return getSqlSession().selectOne("LectureRepository.selectMember", lectureId);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("LectureRepository.selectAll");
	}

	public List<Map> selectAdmin() {
		return getSqlSession().selectList("LectureRepository.selectAdmin");
	}

	public List<Map> selectSearch(Map search) { return getSqlSession().selectList("LectureRepository.selectSearch", search); }

	public List<Map> selectSearchAdmin(Map search) { return getSqlSession().selectList("LectureRepository.selectSearchAdmin", search); }

	public boolean delete(int lectureId) {
		return getSqlSession().delete("LectureRepository.delete", lectureId) > 0;
	}

	public boolean isDelete(int lectureId) {
		return getSqlSession().update("LectureRepository.isDelete", lectureId) > 0;
	}

	public boolean isUndelete(int lectureId) {
		return getSqlSession().update("LectureRepository.isUndelete", lectureId) > 0;
	}

	public boolean insert(Map lecture) {
		return getSqlSession().insert("LectureRepository.insert", lecture) > 0;
	}

	public boolean insertAdmin(Map lecture) {
		return getSqlSession().insert("LectureRepository.insertAdmin", lecture) > 0;
	}

	public boolean update(Map lecture) {
		return getSqlSession().update("LectureRepository.update", lecture) > 0;
	}

	public boolean updateLike(int lectureId) {
		return getSqlSession().update("LectureRepository.updateLike", lectureId) > 0;
	}

	public boolean insertSub(Map lecture) {
		return getSqlSession().insert("LectureRepository.insertSub", lecture) > 0;
	}

	public int selectSub(Map lecture) {
		return getSqlSession().selectOne("LectureRepository.selectSub", lecture);
	}

}