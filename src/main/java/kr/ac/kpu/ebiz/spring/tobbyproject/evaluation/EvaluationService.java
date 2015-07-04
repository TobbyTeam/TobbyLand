package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created by happy on 2015-07-01.
 */
public interface EvaluationService {

    void listService(int lecture_id, ModelAndView mav);

    void regFormService(int lecture_id, ModelAndView mav);

    void regService(Map evaluation, ModelAndView mav);

    void viewService(int lecture_id, int evaluation_id,  ModelAndView mav);

    void modService(Map evaluation, ModelAndView mav);

    void likesService(int lecture_id, int evaluation_id, ModelAndView mav);

    void dislikeService(int lecture_id, int evaluation_id, ModelAndView mav);

    void reportService(int lecture_id, int evaluation_id, ModelAndView mav);

    void isDeleteService(int lecture_id, int evaluation_id, ModelAndView mav);

    void searchPreferService(Map search, ModelAndView mav);

    void replyService(int evaluation_id, ModelAndView mav);

    void replyRegService(Map evaluationSub, ModelAndView mav);
}
