package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import java.util.List;
import java.util.Map;

public interface EvaluationRepository {

	Map select(Integer evaluationId);

	List<Map> selectAll();

	List<Map> selectLecture_id(String lectureId);

	boolean delete(int evaluationId);

	boolean insert(Map evaluation);

	boolean update(Map evaluation);

	boolean updateLike(int evaluationId);

	boolean updateDislike(int evaluationId);

	boolean updateReport(int evaluationId);
}

