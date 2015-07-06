package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import java.util.List;
import java.util.Map;

public interface EvaluationRepository {

	Map select(Integer evaluationId);

	int selectCount(Map evaluation);

	String selectMember(Integer lectureId);

	List<Map> selectAll();

	List<Map> selectAdmin();

	List<Map> selectReport();

	List<Map> selectL(Integer lectureId);

	List<Map> selectBest(Integer lectureId);

	List<Map> selectSearchAdmin(Map search);

	List<Map> SearchPrefer(Map search);

	boolean delete(Integer evaluationId);

	boolean isDelete(Integer evaluationId);

	boolean isUndelete(Integer evaluationId);

	boolean insert(Map evaluation);

	boolean update(Map evaluation);

	boolean updateAdmin(Map evaluation);

	boolean updateLike(Integer evaluationId);

	boolean updateDislike(Integer evaluationId);

	boolean updateReport(Integer evaluationId);

	boolean insertSub(Map lecture);

	int selectSubCount(Map lecture);

	int selectSubType(Map lecture);

	List<Map> selectRe(Integer evaluationId);
}

