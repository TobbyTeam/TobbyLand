package kr.ac.kpu.ebiz.spring.tobbyproject.semester;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class SemesterRepositoryImpl extends SqlSessionDaoSupport implements SemesterRepository {

	public Map select(String semester) {
		return getSqlSession().selectOne("SemesterRepository.select", semester);
	}

	public List<Map> selectAll() {
		return getSqlSession().selectList("SemesterRepository.selectAll");
	}

	public boolean delete(String semester) {
		return getSqlSession().delete("SemesterRepository.delete", semester) > 0;
	}

}
