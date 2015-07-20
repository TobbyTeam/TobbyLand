package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;
import java.util.Map;

public class LectureRepositoryImpl extends SqlSessionDaoSupport implements LectureRepository {

	/*select*/

	public List<Map> selectAll() {
		return getSqlSession().selectList("LectureRepository.selectAll");
	}

	public int selectMember_id(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectMember_id", lecture_id);
	}

	public Map selectLecture(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectLecture", lecture_id);
	}

	public List<Map> selectSearchLecture(Map search) { return getSqlSession().selectList("LectureRepository.selectSearchLecture", search); }

	public int selectSubCount(Map lectureSub) {
		return getSqlSession().selectOne("LectureRepository.selectSubCount", lectureSub);
	}

	public List<Map> selectBoardAll(Map lectureSub) {
		return getSqlSession().selectList("LectureRepository.selectBoardAll", lectureSub);
	}

	public String selectBoardMaxRnum(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoardMaxRnum", lecture_id);
	}

	public Map selectBoard(int ls_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoard", ls_id);
	}


	public List<Map> selectBoardReplyAll(int ls_id) {
		return getSqlSession().selectList("LectureRepository.selectBoardReplyAll", ls_id);
	}

	public int selectBoardMember_id(int ls_id) {
		return getSqlSession().selectOne("LectureRepository.selectBoardMember_id", ls_id);
	}

	public Map selectLecture_E(int lecture_id) {
		return getSqlSession().selectOne("LectureRepository.selectLecture_E", lecture_id);
	}



	/*insert*/

	public boolean insertLecture(Map lecture) {
		return getSqlSession().insert("LectureRepository.insertLecture", lecture) > 0;
	}


	/*update*/

	public boolean updateLecture(Map lecture) {
		return getSqlSession().update("LectureRepository.updateLecture", lecture) > 0;
	}

	public boolean updateLectureLike(int lecture_id) {
		return getSqlSession().update("LectureRepository.updateLectureLike", lecture_id) > 0;
	}

	public boolean updateUnisDelete(int lecture_id) {
		return getSqlSession().update("LectureRepository.updateUnisDelete", lecture_id) > 0;
	}

	public boolean updateBoard(Map lectureSub) {
		return getSqlSession().update("LectureRepository.updateBoard", lectureSub) > 0;
	}

	public boolean updateSubUnisDelete(int ls_id) {
		return getSqlSession().update("LectureRepository.updateSubUnisDelete", ls_id) > 0;
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

	public boolean insertSub(Map lectureSub) {
		return getSqlSession().insert("LectureRepository.insertSub", lectureSub) > 0;
	}
}