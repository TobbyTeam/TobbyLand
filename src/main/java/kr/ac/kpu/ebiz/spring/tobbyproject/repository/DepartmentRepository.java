package kr.ac.kpu.ebiz.spring.tobbyproject.repository;


import java.util.List;
import java.util.Map;

public interface DepartmentRepository {

	Map select(Integer departmentId);

	List<Map> selectAll();

	boolean delete(int departmentId);
}
