package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import com.googlecode.ehcache.annotations.Cacheable;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class TendencyRepositoryImpl extends SqlSessionDaoSupport implements TendencyRepository {

	public Map select(int tendency_id) {
		return getSqlSession().selectOne("TendencyRepository.select", tendency_id);
	}

	@Cacheable(cacheName = "tendencyCache")
	public List<Map> selectAll() {
		return getSqlSession().selectList("TendencyRepository.selectAll");
	}

	public boolean delete(int tendency_id) {
		return getSqlSession().delete("TendencyRepository.delete", tendency_id) > 0;
	}

}
