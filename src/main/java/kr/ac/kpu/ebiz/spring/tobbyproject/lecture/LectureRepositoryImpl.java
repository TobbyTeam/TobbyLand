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

	public boolean delete(int lectureId) {
		return getSqlSession().delete("LectureRepository.delete", lectureId) > 0;
	}

	public boolean insert(Map lecture) {
		return getSqlSession().insert("LectureRepository.insert", lecture) > 0;
	}

	public boolean update(Map lecture) {
		return getSqlSession().update("LectureRepository.update", lecture) > 0;
	}
}
