package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import java.util.List;
import java.util.Map;

public interface EvaluationRepository {

	Map select(Integer evaluationId);

	List<Map> selectAll();

	List<Map> selectLecture_id(Integer lectureId);

	boolean delete(int evaluationId);

	boolean insert(Map evaluation);

	boolean update(Map evaluation);

	boolean updateLike(int lectureId);

	boolean updateDislike(int lectureId);

	boolean updateReport(int lectureId);
}

