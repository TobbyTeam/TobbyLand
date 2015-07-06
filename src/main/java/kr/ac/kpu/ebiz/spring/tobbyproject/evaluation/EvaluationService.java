package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

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

    void regService(Map evaluation, ModelAndView mav);

    boolean confirmService(int evaluation_id);

    void viewService(int lecture_id, int evaluation_id,  ModelAndView mav);

    void modService(Map evaluation, ModelAndView mav);

    int likesService(int evaluation_id);

    int dislikeService(int evaluation_id);

    int reportService(int evaluation_id);

    boolean isDeleteService(int evaluation_id);

    void searchPreferService(Map search, ModelAndView mav);

    void replyService(int evaluation_id, ModelAndView mav);

    void replyRegService(Map evaluationSub, ModelAndView mav);
}
