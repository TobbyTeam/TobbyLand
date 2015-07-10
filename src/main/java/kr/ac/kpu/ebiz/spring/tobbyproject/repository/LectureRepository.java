package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface LectureRepository {

	Map select(Integer lectureId);

	Map selectIAN(Integer lectureId);

	String selectMember(Integer lectureId);

	List<Map> selectAll();

	List<Map> selectAdmin();

	List<Map> selectSearch(Map search);

	List<Map> selectSearchAdmin(Map search);

	boolean delete(int lectureId);

	boolean isDelete(int lectureId);

	boolean isUndelete(int lectureId);

	boolean insert(Map lecture);

	boolean insertAdmin(Map lecture);

	boolean update(Map lecture);

	boolean updateLike(int lectureId);

	boolean insertSub(Map lectureSub);

	int selectSub(Map lectureSub);

	List<Map> boardAll(Map lectureSub);

	Map boardOne(int ls_id);

	String boardMember(int ls_id);

	boolean boardMod(Map lectureSub);

	boolean boardIsDelete(int ls_id);
}

