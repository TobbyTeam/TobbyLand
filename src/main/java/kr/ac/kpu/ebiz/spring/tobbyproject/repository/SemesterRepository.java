package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface SemesterRepository {

	Map select(int semester_id);

	List<Map> selectAll();

	boolean delete(int semester_id);
}
