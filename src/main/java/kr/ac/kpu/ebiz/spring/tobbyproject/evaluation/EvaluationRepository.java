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

	boolean delete(int evaluationId);

	boolean isDelete(int evaluationId);

	boolean isUndelete(int evaluationId);

	boolean insert(Map evaluation);

	boolean update(Map evaluation);

	boolean updateAdmin(Map evaluation);

	boolean updateLike(int evaluationId);

	boolean updateDislike(int evaluationId);

	boolean updateReport(int evaluationId);

	boolean insertSub(Map lecture);

	int selectSub(Map lecture);
}

