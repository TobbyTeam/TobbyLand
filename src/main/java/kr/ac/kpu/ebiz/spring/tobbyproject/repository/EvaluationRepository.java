package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface EvaluationRepository {

	/*select*/

	List<Map> selectEvaluationAll(int lecture_id);

	List<Map> selectEvaluationBest(int lecture_id);

	int selectEvaluationCount(Map evaluation);

	int selectMember_id(int evaluation_id);

	Map selectConfirm(int evaluation_id);

	int selectIsDelete(int evaluation_id);

	Map selectEvaluation(int evaluation_id);

	int selectSubCount(Map evaluationSub);

	int selectSubType(Map evaluationSub);

	Map selectSub(Map evaluationSub);

	List<Map> SearchEvaluationPrefer(Map search);

	List<Map> selectReplyAll(int evaluation_id);

	int selectReplyMember_id(int es_id);




	/*insert*/

	boolean insertEvaluation(Map evaluation);

	boolean insertSub(Map Sub);




	/*update*/

	boolean updateEvaluation(Map evaluation);

	boolean updateEvaluationLike(int evaluation_id);

	boolean updateEvaluationDislike(int evaluation_id);

	boolean updateEvaluationReport(int evaluation_id);

	boolean updateIsDelete(int evaluation_id);



	/*delete*/

	boolean delete(int evaluation_id);






	List<Map> selectAll();

	List<Map> selectAdmin();

	List<Map> selectReport();

	List<Map> selectSearchAdmin(Map search);

	boolean isUndelete(Integer evaluationId);

	boolean updateAdmin(Map evaluation);

}

