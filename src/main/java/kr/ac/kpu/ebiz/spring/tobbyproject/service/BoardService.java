package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by happy on 2015-07-01.
 */
public interface BoardService {

    Map boardTopService(int department_id);

    void listService(int department_id, int page, ModelAndView mav);

    boolean regService(Map board);

    boolean viewService(int board_id, ModelAndView mav);

    int confirmService(int board_id);

    void modViewService(int board_id, ModelAndView mav);

    boolean modService(Map board);

    int subConfirmService(int board_id);

    boolean likeService(int board_id);

    boolean dislikeService(int board_id);

    boolean reportService(int board_id);

    boolean isDeleteService(int department_id);

    boolean replyRegService(Map board);

    void searchService(Map search, int page, ModelAndView mav);

    List<Map> topService();

    List<Map> siteService();

    List<Map> kpuService();

    List<Map> latestService();

    List<Map> hotService();


}
