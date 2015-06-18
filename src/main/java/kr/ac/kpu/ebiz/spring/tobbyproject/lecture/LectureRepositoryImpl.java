package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class LectureRepositoryImpl extends SqlSessionDaoSupport implements LectureRepository {

	public Map select(Integer lectureId) {
		return getSqlSession().selectOne("LectureRepository.select", lectureId);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("LectureRepository.selectAll");
	}

	public List<Map> selectName(String lectureName) { return getSqlSession().selectList("LectureRepository.selectName", lectureName); }

	public List<Map> selectDept(String lectureDept) { return getSqlSession().selectList("LectureRepository.selectDept", lectureDept); }

	public List<Map> selectProf(String lectureProf) { return getSqlSession().selectList("LectureRepository.selectProf", lectureProf); }

	public boolean delete(int lectureId) {
		return getSqlSession().delete("LectureRepository.delete", lectureId) > 0;
	}

	public boolean insert(Map lecture) {
		return getSqlSession().insert("LectureRepository.insert", lecture) > 0;
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

/*	public Map selectSub(Map lecture) {
		return getSqlSession().update("LectureRepository.selectSub", lecture);
	}*/
}
