package kr.ac.kpu.ebiz.spring.tobbyproject;

import java.util.List;
import java.util.Map;

public interface EvaluationRepository {

	Map select(Integer evaluationId);

	List<Map> selectAll();

	boolean delete(int evaluationId);

	boolean insert(Map evaluation);

	boolean update(Map evaluation);
}

