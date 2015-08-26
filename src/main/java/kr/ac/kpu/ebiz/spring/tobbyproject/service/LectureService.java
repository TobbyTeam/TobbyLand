package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by happy on 2015-07-01.
 */
public interface LectureService {

    void listService(ModelAndView mav);

    void regFormService(ModelAndView mav);

    boolean regService(Map lecture);

    boolean confirmService(int lecture_id);

    void viewService(int lecture_id, ModelAndView mav);

    boolean modService(Map lecture);

    void searchService(Map search, ModelAndView mav);

    boolean likesService(int lecture_id);

    boolean isDeleteService(int lecture_id);

    void boardListService(int lecture_id, int page, ModelAndView mav);

    boolean boardRegService(Map lectureBoard);

    boolean boardViewService(int lb_id, ModelAndView mav);

    boolean boardConfirmService(int lb_id);

    void boardModViewService(int lb_id, ModelAndView mav);

    boolean boardModService(Map lectureBoard);

    boolean boardIsDeleteService(int lecture_id);

    boolean boardSubConfirmService(int lb_id);

    boolean boardReplyRegService(Map lectureBoard);

    void boardSearchService(Map search, int page, ModelAndView mav);

}
