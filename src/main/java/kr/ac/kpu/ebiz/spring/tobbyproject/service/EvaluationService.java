package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by happy on 2015-07-01.
 */
public interface EvaluationService {

    void listService(int lecture_id, ModelAndView mav);

    void listBestService(int lecture_id, ModelAndView mav);

    boolean regChechService(int lecture_id);

    void regFormService(int lecture_id, ModelAndView mav);

    boolean regService(Map evaluation);

    boolean confirmService(int evaluation_id);

    void viewService(int lecture_id, int evaluation_id,  ModelAndView mav);

    boolean modService(Map evaluation);

    int likesService(int evaluation_id);

    int dislikeService(int evaluation_id);

    int reportService(int evaluation_id);

    boolean isDeleteService(int evaluation_id);

    void searchPreferService(Map search, ModelAndView mav);

    void replyService(int evaluation_id, ModelAndView mav);

    boolean replyRegService(Map evaluationSub);

    boolean reConfirmService(int es_id);

    boolean reIsDeleteService(int es_id);
}
