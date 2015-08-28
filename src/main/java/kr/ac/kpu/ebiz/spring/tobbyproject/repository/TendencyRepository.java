package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface TendencyRepository {

	Map select(int tendency_id);

	List<Map> selectAll();

	boolean delete(int tendency_id);
}
