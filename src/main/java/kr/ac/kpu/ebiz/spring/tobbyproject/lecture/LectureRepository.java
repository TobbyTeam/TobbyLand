package kr.ac.kpu.ebiz.spring.tobbyproject.lecture;

import java.util.List;
import java.util.Map;

public interface LectureRepository {

	Map select(Integer lectureId);

	List<Map> selectAll();

	List<Map> selectName(String lectureName);

	List<Map> selectDept(String lectureDept);

	List<Map> selectProf(String lectureProf);

	boolean delete(int lectureId);

	boolean insert(Map lecture);

	boolean update(Map lecture);

	boolean updateLike(int lectureId);
}

