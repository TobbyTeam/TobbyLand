package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface LectureRepository {

	/*select*/

	List<Map> selectAll();

	int selectMember_id(int lecture_id);

	Map selectLecture(int lecture_id);

	List<Map> selectLectureSearch(Map search);

	int selectSubCount(Map lectureSub);

	int selectBoardCount(int lecture_id);

	List<Map> selectBoardAll(Map lectureSub);

	int selectBoardMaxRnum(int lecture_id);

	Map selectBoard(int lb_id);

	List<Map> selectBoardReplyAll(int lb_id);

	int selectBoardMember_id(int lb_id);

	Map selectLecture_E(int lecture_id);

	int selectBoardSubCount(Map lectureBoardSub);

	int selectBoardSearchCount(Map lectureBoard);

	List<Map> selectBoardSearch(Map lectureBoard);



	/*insert*/

	boolean insertLecture(Map lecture);

	boolean insertSub(Map lectureSub);

	boolean insertBoard(Map lectureBoard);

	boolean insertBoardSub(Map lectureBoardSub);


	/*update*/

	boolean updateLecture(Map lecture);

	boolean updateLectureLike(int lecture_id);

	boolean updateUnisDelete(int lecture_id);

	boolean updateBoardHit(int lb_id);

	boolean updateBoard(Map lectureSub);

	boolean updateBoardIsDelete(int lb_id);

	boolean updateBoardReport(int lb_id);


	/*delete*/

	boolean delete(int lectureId);






	List<Map> selectAdmin();

	List<Map> selectSearchAdmin(Map search);

	boolean isUndelete(int lectureId);

	boolean insertAdmin(Map lecture);


}

