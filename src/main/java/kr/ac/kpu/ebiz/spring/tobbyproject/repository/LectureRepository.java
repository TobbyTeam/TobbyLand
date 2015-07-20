package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface LectureRepository {

	/*select*/

	List<Map> selectAll();

	int selectMember_id(int lecture_id);

	Map selectLecture(int lecture_id);

	List<Map> selectSearchLecture(Map search);

	int selectSubCount(Map lectureSub);

	List<Map> selectBoardAll(Map lectureSub);

	String selectBoardMaxRnum(int lecture_id);

	Map selectBoard(int ls_id);

	List<Map> selectBoardReplyAll(int ls_id);

	int selectBoardMember_id(int ls_id);




	/*insert*/

	boolean insertLecture(Map lecture);


	/*update*/

	boolean updateLecture(Map lecture);

	boolean updateLectureLike(int lecture_id);

	boolean updateUnisDelete(int lecture_id);

	boolean updateBoard(Map lectureSub);

	boolean updateSubUnisDelete(int ls_id);


	/*delete*/

	boolean delete(int lectureId);





	Map selectIAN(int lecture_id);

	List<Map> selectAdmin();

	List<Map> selectSearchAdmin(Map search);

	boolean isUndelete(int lectureId);

	boolean insertAdmin(Map lecture);

	boolean insertSub(Map lectureSub);
}

