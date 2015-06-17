package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class EvaluationRepositoryImpl extends SqlSessionDaoSupport implements EvaluationRepository {

	public Map select(Integer evaluationId) {
		return getSqlSession().selectOne("EvaluationRepository.select", evaluationId);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("EvaluationRepository.selectAll");
	}

	public List<Map> selectL(Integer lectureId) {
		return getSqlSession().selectList("EvaluationRepository.selectL", lectureId);
	}

	public boolean delete(int evaluationId) {
		return getSqlSession().delete("EvaluationRepository.delete", evaluationId) > 0;
	}

	public boolean insert(Map evaluation) {
		return getSqlSession().insert("EvaluationRepository.insert", evaluation) > 0;
	}

	public boolean update(Map evaluation) {
		return getSqlSession().update("EvaluationRepository.update", evaluation) > 0;
	}

	public boolean updateLike(int evaluationId) {
		return getSqlSession().update("EvaluationRepository.updateLike", evaluationId) > 0;
	}

	public boolean updateDislike(int evaluationId) {
		return getSqlSession().update("EvaluationRepository.updateDislike", evaluationId) > 0;
	}

	public boolean updateReport(int evaluationId) {
		return getSqlSession().update("EvaluationRepository.updateReport", evaluationId) > 0;
	}
}
