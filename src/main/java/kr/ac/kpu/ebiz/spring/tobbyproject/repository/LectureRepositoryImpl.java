package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class LectureRepositoryImpl extends SqlSessionDaoSupport implements LectureRepository {

	/*select*/

	public List<Map> selectAll() {
		return getSqlSession().selectList("LectureRepository.selectAll");
	}

	public List<Map> selectAllNon() {
		return getSqlSession().selectList("LectureRepository.selectAllNon");
	}

	public int selectMember_id(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectMember_id", lecture_id);
	}

	public Map selectConfirm(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectConfirm", lecture_id);
	}

	public Map selectLecture(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectLecture", lecture_id);
	}

	public List<Map> selectLectureSearch(Map search) { return getSqlSession().selectList("LectureRepository.selectLectureSearch", search); }

	public int selectSubCount(Map lectureSub) {
		return getSqlSession().selectOne("LectureRepository.selectSubCount", lectureSub);
	}

	public int selectBoardCount(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoardCount", lecture_id);
	}

	public List<Map> selectBoardAll(Map lectureBoard) {
		return getSqlSession().selectList("LectureRepository.selectBoardAll", lectureBoard);
	}

	public int selectBoardMaxRnum(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoardMaxRnum", lecture_id);
	}

	public Map selectBoard(int lb_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoard", lb_id);
	}


	public List<Map> selectBoardReplyAll(int lb_id) {
		return getSqlSession().selectList("LectureRepository.selectBoardReplyAll", lb_id);
	}

	public int selectBoardMember_id(int lb_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoardMember_id", lb_id);
	}

	public Map selectBoardConfirm(int lb_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoardConfirm", lb_id);
	}

	public Map selectLecture_E(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectLecture_E", lecture_id);
	}

	public int selectBoardSubCount(Map lectureBoardSub) {
		return getSqlSession().selectOne("LectureRepository.selectBoardSubCount", lectureBoardSub);
	}

	public int selectBoardSearchCount(Map lectureBoard) {
		return getSqlSession().selectOne("LectureRepository.selectBoardSearchCount", lectureBoard);
	}

	public List<Map> selectBoardSearch(Map lectureBoard) {
		return getSqlSession().selectList("LectureRepository.selectBoardSearch", lectureBoard);
	}


	/*insert*/

	public boolean insertLecture(Map lecture) {
		return getSqlSession().insert("LectureRepository.insertLecture", lecture) > 0;
	}

	public boolean insertSub(Map lectureSub) {
		return getSqlSession().insert("LectureRepository.insertSub", lectureSub) > 0;
	}

	public boolean insertBoard(Map lectureBoard) {
		return getSqlSession().insert("LectureRepository.insertBoard", lectureBoard) > 0;
	}

	public boolean insertBoardSub(Map lectureBoardSub) {
		return getSqlSession().insert("LectureRepository.insertBoardSub", lectureBoardSub) > 0;
	}



	/*update*/

	public boolean updateLecture(Map lecture) {
		return getSqlSession().update("LectureRepository.updateLecture", lecture) > 0;
	}

	public boolean updateLectureLike(int lecture_id) {
		return getSqlSession().update("LectureRepository.updateLectureLike", lecture_id) > 0;
	}

	public boolean updateIsDelete(int lecture_id) {
		return getSqlSession().update("LectureRepository.updateIsDelete", lecture_id) > 0;
	}

	public boolean updateBoardHit(int lb_id) {
		return getSqlSession().update("LectureRepository.updateBoardHit", lb_id) > 0;
	}

	public boolean updateBoard(Map lectureSub) {
		return getSqlSession().update("LectureRepository.updateBoard", lectureSub) > 0;
	}

	public boolean updateBoardIsDelete(int lb_id) {
		return getSqlSession().update("LectureRepository.updateBoardIsDelete", lb_id) > 0;
	}

	public boolean updateBoardReport(int lb_id) {
		return getSqlSession().update("LectureRepository.updateBoardReport", lb_id) > 0;
	}


	/*delete*/

	public boolean delete(int lectureId) {
		return getSqlSession().delete("LectureRepository.delete", lectureId) > 0;
	}





	public List<Map> selectAdmin() {
		return getSqlSession().selectList("LectureRepository.selectAdmin");
	}

	public List<Map> selectSearchAdmin(Map search) { return getSqlSession().selectList("LectureRepository.selectSearchAdmin", search); }

	public boolean isUndelete(int lectureId) {
		return getSqlSession().update("LectureRepository.isUndelete", lectureId) > 0;
	}

	public boolean insertAdmin(Map lecture) {
		return getSqlSession().insert("LectureRepository.insertAdmin", lecture) > 0;
	}

}