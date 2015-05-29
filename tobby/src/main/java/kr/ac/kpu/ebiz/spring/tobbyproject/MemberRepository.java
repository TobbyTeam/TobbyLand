package kr.ac.kpu.ebiz.spring.tobbyproject;

import java.util.List;
import java.util.Map;

public interface MemberRepository {

	Map select(Integer memberId);

	List<Map> selectAll();

	boolean delete(int memberId);
}
