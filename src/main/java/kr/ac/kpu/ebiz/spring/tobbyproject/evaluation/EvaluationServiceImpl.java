package kr.ac.kpu.ebiz.spring.tobbyproject.evaluation;

import kr.ac.kpu.ebiz.spring.tobbyproject.lecture.LectureRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.semester.SemesterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * Created by happy on 2015-07-01.
 */
public class EvaluationServiceImpl implements EvaluationService {

    @Autowired
    EvaluationRepository evaluationRepository;

    @Autowired
    LectureRepository lectureRepository;

    @Autowired
    SemesterRepository semesterRepository;

    public void listService(int lecture_id, ModelAndView mav) {

        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));

    }

    public void regFormService(int lecture_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        HashMap check = new HashMap();
        check.put("lecture_id", lecture_id);
        check.put("member_id", member_id);

        int count = evaluationRepository.selectCount(check);

        if(count != 0) {

            mav.setViewName("/evaluation/list");
            mav.addObject("error", "이미 이 강의에 대해 강의평가를 작성하셨습니다.");
            mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
            mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
            mav.addObject("best", evaluationRepository.selectBest(lecture_id));

        } else {

            Calendar cal = Calendar.getInstance();

            int year = cal.get(Calendar.YEAR) - 2000;
            int month = cal.get(Calendar.MONTH);
            int half;
            if(month>7){half = 2;}
            else{half = 1;}

            StringBuilder current = new StringBuilder(String.valueOf(year));
            StringBuilder current2 = new StringBuilder("-");
            StringBuilder current3 = new StringBuilder(String.valueOf(half));
            StringBuilder current4 = new StringBuilder("학기");

            current.append(current2).append(current3).append(current4);

            mav.setViewName("/evaluation/register");

            HashMap evaluation = new HashMap();
            evaluation.put("lecture_id", lecture_id);

            mav.addObject("evaluation", evaluation);
            mav.addObject("semesters", semesterRepository.selectAll());
            mav.addObject("current", current);
        }

    }

    public void regService(Map evaluation, ModelAndView mav) {

        evaluationRepository.insert(evaluation);

        int lecture_id = (Integer)evaluation.get("lecture_id");

        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));

    }

    public void viewService(int lecture_id, int evaluation_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String writer = evaluationRepository.selectMember(evaluation_id);

        Collection authorities = user.getAuthorities();

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){

            mav.setViewName("/evaluation/modify");
            Map evaluation = evaluationRepository.select(evaluation_id);
            mav.addObject("evaluation", evaluation);
            mav.addObject("semesters", semesterRepository.selectAll());

        } else {

            mav.setViewName("/evaluation/list");
            mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
            mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
            mav.addObject("best", evaluationRepository.selectBest(lecture_id));
            mav.addObject("error", "본인이 작성하신 강의평가가 아닙니다.");

        }

    }

    public void modService(int lecture_id, Map evaluation, ModelAndView mav) {

        evaluationRepository.update(evaluation);

        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));

    }

    public void likesService(int lecture_id, int evaluation_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        HashMap evaluationSub = new HashMap();
        evaluationSub.put("evaluation_id", evaluation_id);
        evaluationSub.put("member_id", member_id);

        int count = evaluationRepository.selectSub(evaluationSub);

        if(count != 0) {
            mav.addObject("error", "이미 추천/비공감/신고 중에 하나를 하셨습니다.");
        } else {
            evaluationRepository.insertSub(evaluationSub);
            evaluationRepository.updateLike(evaluation_id);
        }

        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));

    }

    public void dislikeService(int lecture_id, int evaluation_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        HashMap evaluationSub = new HashMap();
        evaluationSub.put("evaluation_id", evaluation_id);
        evaluationSub.put("member_id", member_id);

        int count = evaluationRepository.selectSub(evaluationSub);

        if(count != 0) {
            mav.addObject("error", "이미 추천/비공감/신고 중에 하나를 하셨습니다.");

        } else {
            evaluationRepository.insertSub(evaluationSub);
            evaluationRepository.updateDislike(evaluation_id);
        }

        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));

    }

    public void reportService(int lecture_id, int evaluation_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        HashMap evaluationSub = new HashMap();
        evaluationSub.put("evaluation_id", evaluation_id);
        evaluationSub.put("member_id", member_id);

        int count = evaluationRepository.selectSub(evaluationSub);

        if(count != 0) {
            mav.addObject("error", "이미 추천/비공감/신고 중에 하나를 하셨습니다.");
        } else {
            evaluationRepository.insertSub(evaluationSub);
            evaluationRepository.updateReport(evaluation_id);
        }

        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));

    }

    public void isDeleteService(int lecture_id, int evaluation_id, ModelAndView mav) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String member_id = user.getUsername();

        String writer = evaluationRepository.selectMember(evaluation_id);

        Collection authorities = user.getAuthorities();

        if(member_id.equals(writer) == true || authorities.toString().contains("ROLE_ADMIN")){
            evaluationRepository.isDelete(evaluation_id);
        } else {
            mav.addObject("error", "본인이 작성한 것이 아닙니다.");
        }

        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("evaluations", evaluationRepository.selectL(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));


    }

    public void searchPreferService(Map search, ModelAndView mav) {

        List<Map> result = evaluationRepository.SearchPrefer(search);

        int lecture_id = (Integer)search.get("lecture_id");

        mav.addObject("evaluations", result);
        mav.addObject("lecture", lectureRepository.selectIAN(lecture_id));
        mav.addObject("best", evaluationRepository.selectBest(lecture_id));

        if(result.isEmpty() == true){
            mav.addObject("error", "검색 결과가 없습니다.");
        }


    }

    public void replyService(int evaluation_id, ModelAndView mav) {

        mav.addObject("replys", evaluationRepository.selectRe(evaluation_id));
        mav.addObject("evaluation_id", evaluation_id);

    }

    public void replyRegService(Map evaluationSub, ModelAndView mav) {

        evaluationRepository.insertSub(evaluationSub);

        int evaluation_id = (Integer)evaluationSub.get("evaluation_id");

        StringBuilder page = new StringBuilder("redirect:/evaluation/replyList?evaluation_id=");
        StringBuilder id = new StringBuilder(String.valueOf(evaluation_id));
        page.append(id);

        mav.setViewName(page.toString());

    }
}
