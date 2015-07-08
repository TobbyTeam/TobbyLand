package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface SemesterRepository {

	Map select(String semester);

	List<Map> selectAll();

	boolean delete(String semester);
}
