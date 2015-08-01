package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by happy on 2015-07-01.
 */
public interface BoardService {

    void listService(int department_id, int page, ModelAndView mav);

    boolean regService(Map board);

    void viewService(int board_id, ModelAndView mav);

    boolean confirmService(int board_id);

    void modViewService(int board_id, ModelAndView mav);

    boolean modService(Map board);

    int likeService(int board_id);

    int dislikeService(int board_id);

    int reportService(int board_id);

    boolean isDeleteService(int department_id);

    boolean replyRegService(Map board);

    void searchService(Map search, int page, ModelAndView mav);

    void mainService(ModelAndView mav);

    List<Map> topService();


}
