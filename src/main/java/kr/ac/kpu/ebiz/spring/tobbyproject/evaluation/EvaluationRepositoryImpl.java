package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class EvaluationRepositoryImpl extends SqlSessionDaoSupport implements EvaluationRepository {

	public Map select(Integer evaluationId) {
		return getSqlSession().selectOne("EvaluationRepository.select", evaluationId);
	}

	public int selectCount(Map evaluation) {
		return getSqlSession().selectOne("EvaluationRepository.selectCount", evaluation);
	}

	public String selectMember(Integer evaluationId) {
		return getSqlSession().selectOne("EvaluationRepository.selectMember", evaluationId);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("EvaluationRepository.selectAll");
	}

	public List<Map> selectAdmin()  {
		return getSqlSession().selectList("EvaluationRepository.selectAdmin");
	}

	public List<Map> selectReport()  {
		return getSqlSession().selectList("EvaluationRepository.selectReport");
	}

	public List<Map> selectL(Integer lectureId) {
		return getSqlSession().selectList("EvaluationRepository.selectL", lectureId);
	}

	public List<Map> selectBest(Integer lectureId) {
		return getSqlSession().selectList("EvaluationRepository.selectBest", lectureId);
	}

	public List<Map> selectSearchAdmin(Map search) { return getSqlSession().selectList("EvaluationRepository.selectSearchAdmin", search); }

	public boolean delete(int evaluationId) {
		return getSqlSession().delete("EvaluationRepository.delete", evaluationId) > 0;
	}

	public boolean isDelete(int evaluationId) {
		return getSqlSession().update("EvaluationRepository.isDelete", evaluationId) > 0;
	}

	public boolean isUndelete(int evaluationId) {
		return getSqlSession().update("EvaluationRepository.isUndelete", evaluationId) > 0;
	}

	public boolean insert(Map evaluation) {
		return getSqlSession().insert("EvaluationRepository.insert", evaluation) > 0;
	}

	public boolean update(Map evaluation) {
		return getSqlSession().update("EvaluationRepository.update", evaluation) > 0;
	}

	public boolean updateAdmin(Map evaluation) {
		return getSqlSession().update("EvaluationRepository.updateAdmin", evaluation) > 0;
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


	public boolean insertSub(Map evaluation) {
		return getSqlSession().insert("EvaluationRepository.insertSub", evaluation) > 0;
	}

	public int selectSub(Map evaluation) {
		return getSqlSession().selectOne("EvaluationRepository.selectSub", evaluation);
	}
}
