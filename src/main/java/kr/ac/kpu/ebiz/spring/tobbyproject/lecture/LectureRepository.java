package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import java.util.List;
import java.util.Map;

public interface LectureRepository {

	Map select(Integer lectureId);

	Map selectIAN(Integer lectureId);

	String selectMember(Integer lectureId);

	List<Map> selectAll();

	List<Map> selectAdmin();

	List<Map> selectSearch(Map search);

	boolean delete(int lectureId);

	boolean isDelete(int lectureId);

	boolean isUndelete(int lectureId);

	boolean insert(Map lecture);

	boolean insertAdmin(Map lecture);

	boolean update(Map lecture);

	boolean updateLike(int lectureId);

	boolean insertSub(Map lecture);

	int selectSub(Map lecture);
}

