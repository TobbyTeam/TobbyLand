package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class DepartmentRepositoryImpl extends SqlSessionDaoSupport implements DepartmentRepository {

	public Map select(Integer departmentId) {
		return getSqlSession().selectOne("DepartmentRepository.select", departmentId);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("DepartmentRepository.selectAll");
	}

	public List<Map> selectDeptAll() {
		return getSqlSession().selectList("DepartmentRepository.selectDeptAll");
	}

	public boolean delete(int departmentId) {
		return getSqlSession().delete("DepartmentRepository.delete", departmentId) > 0;
	}

}
