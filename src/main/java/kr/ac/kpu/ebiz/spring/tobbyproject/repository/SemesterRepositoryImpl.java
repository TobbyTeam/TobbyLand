package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class SemesterRepositoryImpl extends SqlSessionDaoSupport implements SemesterRepository {

	public Map select(int semester_id) {
		return getSqlSession().selectOne("SemesterRepository.select", semester_id);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("SemesterRepository.selectAll");
	}

	public boolean delete(int semester_id) {
		return getSqlSession().delete("SemesterRepository.delete", semester_id) > 0;
	}

}
