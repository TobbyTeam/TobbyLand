package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import com.googlecode.ehcache.annotations.Cacheable;
import kr.ac.kpu.ebiz.spring.tobbyproject.paging.Paging;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.BoardRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.DepartmentRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

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

        List<Map> departments = departmentRepository.selectAll();

        int index = department_id-1;

        Map department = departments.get(index);

        return department;
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

        int department_id = Integer.parseInt(board.get("department_id").toString());

        if(department_id == 14 || department_id == 15) {

            Collection authorities = user.getAuthorities();

            if(!authorities.toString().contains("ROLE_ADMIN")) {

                return false;
            }

        }

/*        String contents_org = (String) board.get("contents");
        String contents_db = contents_org.replaceAll("\r\n","<br />");
        board.remove("contents");
        board.put("contents", contents_db);*/


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

        return boardRepository.insertBoard(board);
    }

    public boolean viewService(int board_id, ModelAndView mav) {

        boolean result = true;

        if(boardRepository.updateBoardHit(board_id)){

            mav.addObject("board", boardRepository.selectBoard(board_id));

        }else{

            mav.setViewName("redirect:/404");
            result = false;

        }

        return result;
    }

    public int confirmService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        Map board = boardRepository.selectBoardConfirm(board_id);

        int writer = Integer.parseInt(board.get("member_id").toString());

        boolean is_delete = (Boolean) board.get("is_delete");

        int result = 3;

        if(is_delete){

            return result;
        } else {

            Collection authorities = user.getAuthorities();

            if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){
                result = 1;
            } else {
                result = 2;
            }
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

        return boardRepository.updateBoard(board);
    }

    public int subConfirmService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap boardSub = new HashMap();
        boardSub.put("board_id", board_id);
        boardSub.put("member_id", member_id);

        Map confirm = boardRepository.selectBoardSub(boardSub);

        int result =0;

        if(confirm == null){
            return result;

        } else {

            int type = Integer.parseInt(confirm.get("kind").toString());
            result = type;
        }

        return result;
    }

    public boolean likeService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap boardSub = new HashMap();
        boardSub.put("board_id", board_id);
        boardSub.put("member_id", member_id);
        boardSub.put("kind", 1);

        boolean result = false;

        if(boardRepository.updateBoardLike(board_id)&&boardRepository.insertBoardSub(boardSub)){
            result = true;
        }

        return result;
    }

    public boolean dislikeService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap boardSub = new HashMap();
        boardSub.put("board_id", board_id);
        boardSub.put("member_id", member_id);
        boardSub.put("kind", 2);

        boolean result = false;

        if(boardRepository.updateBoardDislike(board_id)&&boardRepository.insertBoardSub(boardSub)){
            result = true;
        }

        return result;

    }

    public boolean reportService(int board_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap boardSub = new HashMap();
        boardSub.put("board_id", board_id);
        boardSub.put("member_id", member_id);
        boardSub.put("kind", 3);

        boolean result = false;

        if(boardRepository.updateBoardReport(board_id)&&boardRepository.insertBoardSub(boardSub)){
            result = true;
        }

        return result;

    }

    public boolean isDeleteService(int board_id) {

        return boardRepository.updateBoardIsDelete(board_id);
    }
    
    public boolean replyRegService(Map board) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();
        String writer = user.getNickname();

        board.put("member_id", member_id);

        if(board.get("is_anonymity")==null){
            board.remove("writer");
            board.put("writer", writer);
        }

        return boardRepository.insertReply(board);
    }

    public void searchService(Map search, int page, ModelAndView mav) {

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

        List<Map> latests = boardRepository.selectLatestAll();

        int end = latests.size();

        List<Map> list = new ArrayList<Map>();

        for(int i=0 ; i<end ;i++){

            Map latest = latests.get(i);

            String ym = (String) latest.get("ym");
            String now = (String) latest.get("now");

            if(ym.equals(now)){

                String time = (String) latest.get("time");

                latest.put("write_date", time);

            } else {

                latest.put("write_date", ym);

            }

            list.add(latest);

        }

        return list;
    }

    @Cacheable(cacheName = "hotCache")
    public List<Map> hotService() {
        return boardRepository.selectHotAll();
    }

}
