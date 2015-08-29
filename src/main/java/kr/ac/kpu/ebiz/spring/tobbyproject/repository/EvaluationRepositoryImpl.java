package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class EvaluationRepositoryImpl extends SqlSessionDaoSupport implements EvaluationRepository {


	/*select*/

	public List<Map> selectEvaluationAll(int lecture_id) {
		return getSqlSession().selectList("EvaluationRepository.selectEvaluationAll", lecture_id);
	}

	public List<Map> selectEvaluationBest(int lecture_id) {
		return getSqlSession().selectList("EvaluationRepository.selectEvaluationBest", lecture_id);
	}

	public int selectEvaluationCount(Map evaluation) {
		return getSqlSession().selectOne("EvaluationRepository.selectEvaluationCount", evaluation);
	}

	public int selectMember_id(int evaluation_id) {
		return getSqlSession().selectOne("EvaluationRepository.selectMember_id", evaluation_id);
	}

	public int selectIsDelete(int evaluation_id) {
		return getSqlSession().selectOne("EvaluationRepository.selectIsDelete", evaluation_id);
	}

	public Map selectEvaluation(int evaluation_id) {
		return getSqlSession().selectOne("EvaluationRepository.selectEvaluation", evaluation_id);
	}

	public int selectSubCount(Map evaluationSub) {
		return getSqlSession().selectOne("EvaluationRepository.selectSubCount", evaluationSub);
	}

	public int selectSubType(Map evaluationSub) {
		return getSqlSession().selectOne("EvaluationRepository.selectSubType", evaluationSub);
	}

	public List<Map> SearchEvaluationPrefer(Map search) { return getSqlSession().selectList("EvaluationRepository.SearchEvaluationPrefer", search); }

	public List<Map> selectReplyAll(int evaluation_id) {
		return getSqlSession().selectList("EvaluationRepository.selectReplyAll", evaluation_id);
	}

	public int selectReplyMember_id(int es_id) {
		return getSqlSession().selectOne("EvaluationRepository.selectReplyMember_id", es_id);
	}


	/*insert*/

	public boolean insertEvaluation(Map evaluation) {
		return getSqlSession().insert("EvaluationRepository.insertEvaluation", evaluation) > 0;
	}

	public boolean insertSub(Map Sub) {
		return getSqlSession().insert("EvaluationRepository.insertSub", Sub) > 0;
	}



	/*update*/


	public boolean updateEvaluation(Map evaluation) {
		return getSqlSession().update("EvaluationRepository.updateEvaluation", evaluation) > 0;
	}

	public boolean updateEvaluationLike(int evaluation_id) {
		return getSqlSession().update("EvaluationRepository.updateEvaluationLike", evaluation_id) > 0;
	}

	public boolean updateEvaluationDislike(int evaluation_id) {
		return getSqlSession().update("EvaluationRepository.updateEvaluationDislike", evaluation_id) > 0;
	}

	public boolean updateEvaluationReport(int evaluation_id) {
		return getSqlSession().update("EvaluationRepository.updateEvaluationReport", evaluation_id) > 0;
	}

	public boolean updateIsDelete(int evaluation_id) {
		return getSqlSession().update("EvaluationRepository.updateIsDelete", evaluation_id) > 0;
	}



	/*delete*/

	public boolean delete(int evaluation_id) {
		return getSqlSession().delete("EvaluationRepository.delete", evaluation_id) > 0;
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

	public List<Map> selectSearchAdmin(Map search) { return getSqlSession().selectList("EvaluationRepository.selectSearchAdmin", search); }

	public boolean isUndelete(Integer evaluationId) {
		return getSqlSession().update("EvaluationRepository.isUndelete", evaluationId) > 0;
	}

	public boolean updateAdmin(Map evaluation) {
		return getSqlSession().update("EvaluationRepository.updateAdmin", evaluation) > 0;
	}

}
