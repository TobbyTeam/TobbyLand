package kr.ac.kpu.ebiz.spring.tobbyproject.repository;

import java.util.List;
import java.util.Map;

public interface BoardRepository {

	/*select*/

	int selectBoardCount(int department_id);

	List<Map> selectBoardAll(Map boardSub);

	int selectBoardMaxRnum(int department_id);

	Map selectBoard(int board_id);

	List<Map> selectBoardReplyAll(int board_id);

	int selectBoardMember_id(int board_id);

	int selectBoardSubCount(Map boardSub);

	int selectBoardSubType(Map boardSub);

	int selectBoardSearchCount(Map board);

	List<Map> selectBoardSearch(Map board);

	List<Map> selectSiteNoticeAll();

	List<Map> selectKpuNoticeAll();

	List<Map> selectLatestAll();

	List<Map> selectHotAll();



	/*insert*/

	boolean insertBoard(Map board);

	boolean insertBoardSub(Map boardSub);


	/*update*/

	boolean updateBoardHit(int board_id);

	boolean updateBoard(Map boardSub);

	boolean updateBoardLike(int board_id);

	boolean updateBoardDislike(int board_id);

	boolean updateBoardReport(int board_id);

	boolean updateBoardIsDelete(int board_id);



	/*delete*/

	boolean delete(int board_id);

}
