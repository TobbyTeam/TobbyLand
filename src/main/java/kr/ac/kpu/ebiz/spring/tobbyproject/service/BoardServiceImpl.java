package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import com.googlecode.ehcache.annotations.Cacheable;
import kr.ac.kpu.ebiz.spring.tobbyproject.paging.Paging;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.BoardRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.DepartmentRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by happy on 2015-07-01.
 */
public class BoardServiceImpl implements BoardService{

    @Autowired
    BoardRepository boardRepository;

    @Autowired
    DepartmentRepository departmentRepository;

    @Autowired
    Paging paging;

    public Map boardTopService(int department_id){

        return departmentRepository.select(department_id);
    }

    public void listService(int department_id, int page, ModelAndView mav) {

        paging.setPageNo(page);
        paging.setPageSize(15);
        paging.setTotalCount(boardRepository.selectBoardCount(department_id));

        mav.addObject("paging", paging);

        int start = 0;

        if (!(page == 1)) {
            // 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
            int temp = (page - 1) * 15;
            start = temp;
        } else if (page==1) {
            // 페이지 번호가 1이면 처음부터 15개​
            start = 0;
        }

        Map board = new HashMap();
        board.put("department_id", department_id);
        board.put("start", start);

        mav.addObject("boards", boardRepository.selectBoardAll(board));
    }

    public boolean regService(Map board) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();
        String writer = user.getNickname();

        String contents_org = (String) board.get("contents");
        String contents_db = contents_org.replaceAll("\r\n","<br />");
        board.remove("contents");
        board.put("contents", contents_db);

        int department_id = Integer.parseInt((String)board.get("department_id"));

        int maxRnum = boardRepository.selectBoardMaxRnum(department_id);

        int rnum;

        if(maxRnum == 0){
            rnum = 1;
        } else {
            rnum = maxRnum + 1;
        }

        board.put("member_id", member_id);
        board.put("rnum", rnum);


        if(board.get("is_anonymity")==null){
            board.remove("writer");
            board.put("writer", writer);
        }

        boolean result = false;

        if(boardRepository.insertBoard(board)){
            result = true;
        }

        return result;
    }

    public boolean viewService(int board_id, ModelAndView mav) {

        Map board = boardRepository.selectBoard(board_id);

        boolean result = true;

        if(board == null){

            mav.setViewName("redirect:/404");
            result = false;

        }else{

            boardRepository.updateBoardHit(board_id);

            mav.addObject("board", board);
            mav.addObject("replys", boardRepository.selectBoardReplyAll(board_id));
        }

        return result;
    }

    public boolean confirmService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = boardRepository.selectBoardMember_id(board_id);

        Collection authorities = user.getAuthorities();

        boolean result = false;

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){
            result = true;
        }

        return result;

    }

    public void modViewService(int board_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = boardRepository.selectBoardMember_id(board_id);

        Collection authorities = user.getAuthorities();

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){

            Map board = boardRepository.selectBoard(board_id);

            if(board == null){

                mav.setViewName("redirect:/404");

            } else {

                String contents_db = (String) board.get("contents");
                String contents_org = contents_db.replaceAll("<br />", "\r\n");
                board.remove("contents");
                board.put("contents", contents_org);

                mav.addObject("board", board);

            }

        } else {

            mav.setViewName("redirect:/lecture/boardView?board_id="+board_id);
        }

    }

    public boolean modService(Map board) {

        String contents_org = (String) board.get("contents");
        String contents_db = contents_org.replaceAll("\r\n","<br />");
        board.remove("contents");
        board.put("contents", contents_db);

        boolean result = false;

        if (boardRepository.updateBoard(board)) {
            result = true;
        }

        return result;
    }

    public int likeService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap boardSub = new HashMap();
        boardSub.put("board_id", board_id);
        boardSub.put("member_id", member_id);

        int count = boardRepository.selectBoardSubCount(boardSub);

        int result;

        int kind = 1;

        if(count !=0) {
            result = boardRepository.selectBoardSubType(boardSub);
        } else {
            boardSub.put("kind", kind);
            boardRepository.insertBoardSub(boardSub);
            boardRepository.updateBoardLike(board_id);
            result = 0;
        }

        return result;
    }

    public int dislikeService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap boardSub = new HashMap();
        boardSub.put("board_id", board_id);
        boardSub.put("member_id", member_id);

        int count = boardRepository.selectBoardSubCount(boardSub);

        int result;

        int kind = 2;

        if(count !=0) {
            result = boardRepository.selectBoardSubType(boardSub);
        } else {
            boardSub.put("kind", kind);
            boardRepository.insertBoardSub(boardSub);
            boardRepository.updateBoardDislike(board_id);
            result = 0;
        }

        return result;

    }

    public int reportService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap boardSub = new HashMap();
        boardSub.put("board_id", board_id);
        boardSub.put("member_id", member_id);

        int count = boardRepository.selectBoardSubCount(boardSub);

        int result;

        int kind = 3;

        if(count !=0) {
            result = boardRepository.selectBoardSubType(boardSub);
        } else {
            boardSub.put("kind", kind);
            boardRepository.insertBoardSub(boardSub);
            boardRepository.updateBoardReport(board_id);
            result = 0;
        }

        return result;

    }

    public boolean isDeleteService(int board_id) {

        boolean data = false;

        if(boardRepository.updateBoardIsDelete(board_id)) {
            data = true;
        }

        return data;
    }
    
    public boolean replyRegService(Map board) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();
        String writer = user.getNickname();

        board.put("member_id", member_id);
        board.put("writer", writer);

        boolean result = false;

        if(boardRepository.insertBoard(board)){
            result =true;
        }

        return result;
    }

    public void searchService(Map search, int page, ModelAndView mav) {

        int department_id =  Integer.parseInt(search.get("department_id").toString());

        paging.setPageNo(page);
        paging.setPageSize(15);
        paging.setTotalCount(boardRepository.selectBoardSearchCount(search));

        mav.addObject("paging", paging);
        mav.addObject("search", search);

        int start = 0;

        if (!(page == 1)) {
            // 첫페이지가 아닐경우 그 페이지에 맞는 목록 뽑아옴​
            int temp = (page - 1) * 15;
            start = temp;
        } else if (page==1) {
            // 페이지 번호가 1이면 처음부터 15개​
            start = 0;
        }

        search.put("start", start);

        mav.addObject("boards", boardRepository.selectBoardSearch(search));
    }

    @Cacheable(cacheName = "topCache")
    public List<Map> topService(){

        return departmentRepository.selectAll();
    }

    @Cacheable(cacheName = "siteCache")
    public List<Map> siteService() {
        return boardRepository.selectSiteNoticeAll();
    }

    @Cacheable(cacheName = "kpuCache")
    public List<Map> kpuService() {
        return boardRepository.selectKpuNoticeAll();
    }

    @Cacheable(cacheName = "latestCache")
    public List<Map> latestService() {
        return boardRepository.selectLatestAll();
    }

    @Cacheable(cacheName = "hotCache")
    public List<Map> hotService() {
        return boardRepository.selectHotAll();
    }

}
