package kr.ac.kpu.ebiz.spring.tobbyproject.service;

import kr.ac.kpu.ebiz.spring.tobbyproject.repository.EvaluationRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.LectureRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.MemberRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.SemesterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

public class EvaluationServiceImpl implements EvaluationService {

    @Autowired
    EvaluationRepository evaluationRepository;

    @Autowired
    LectureRepository lectureRepository;

    @Autowired
    SemesterRepository semesterRepository;

    @Autowired
    MemberRepository memberRepository;

    public void listService(int lecture_id, ModelAndView mav) {

        mav.addObject("evaluations", evaluationRepository.selectEvaluationAll(lecture_id));
        mav.addObject("lecture_id", lecture_id);

    }

    public void listBestService(int lecture_id, ModelAndView mav) {

        mav.addObject("best", evaluationRepository.selectEvaluationBest(lecture_id));

    }

    public void lectureService(int lecture_id, ModelAndView mav) {

        mav.addObject("lecture", lectureRepository.selectLecture_E(lecture_id));

    }

    public boolean regChechService(int lecture_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap evaluation = new HashMap();
        evaluation.put("lecture_id", lecture_id);
        evaluation.put("member_id", member_id);

        int count = evaluationRepository.selectEvaluationCount(evaluation);

        boolean result = false;

        if(count==0){
            result = true;
        }

        return result;
    }

    public void regFormService(int lecture_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap evaluation = new HashMap();
        evaluation.put("lecture_id", lecture_id);
        evaluation.put("member_id", member_id);

        int count = evaluationRepository.selectEvaluationCount(evaluation);

        if(count != 0) {

            mav.setViewName("redirect:/evaluation/list?lecture_id="+lecture_id);

        } else {

            Calendar cal = Calendar.getInstance();

            int year = cal.get(Calendar.YEAR) - 2000;
            int month = cal.get(Calendar.MONTH);
            int half;
            if(month>=6){half = 2;}
            else{half = 1;}

            StringBuilder current = new StringBuilder(String.valueOf(year));
            StringBuilder current2 = new StringBuilder("-");
            StringBuilder current3 = new StringBuilder(String.valueOf(half));
            StringBuilder current4 = new StringBuilder("학기");

            current.append(current2).append(current3).append(current4);

            mav.setViewName("/evaluation/register");

            mav.addObject("lecture_id", lecture_id);
            mav.addObject("semesters", semesterRepository.selectAll());
            mav.addObject("current", current);
        }

    }

    public boolean regService(Map evaluation) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        String comment_org = (String) evaluation.get("comment");
        String comment_db = comment_org.replaceAll("\r\n","<br />");
        evaluation.remove("comment");
        evaluation.put("comment", comment_db);

        evaluation.put("member_id", member_id);
        evaluation.putAll(memberRepository.selectMemberTendency(member_id));

        boolean result = false;

        if(evaluationRepository.insertEvaluation(evaluation)&&memberRepository.updateEvaluationCount(member_id)){
            result = true;
        }

       return result;
    }

    public boolean confirmService(int evaluation_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = evaluationRepository.selectMember_id(evaluation_id);

        Collection authorities = user.getAuthorities();

        boolean result = false;

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){
            result = true;
        }

        return result;
    }

    public void viewService(int lecture_id, int evaluation_id, ModelAndView mav) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        int writer = evaluationRepository.selectMember_id(evaluation_id);

        Collection authorities = user.getAuthorities();

        if(member_id == writer || authorities.toString().contains("ROLE_ADMIN")){

            Map evaluation = evaluationRepository.selectEvaluation(evaluation_id);

            if(evaluation == null){

                mav.setViewName("redirect:/404");

            } else {

                String comment_db = (String) evaluation.get("comment");
                String comment_org = comment_db.replaceAll("<br />", "\r\n");
                evaluation.remove("comment");
                evaluation.put("comment", comment_org);

                mav.setViewName("/evaluation/modify");
                mav.addObject("evaluation", evaluation);
                mav.addObject("semesters", semesterRepository.selectAll());

            }

        } else {

            mav.setViewName("redirect:/evaluation/list?lecture_id=" + lecture_id);

        }

    }

    public boolean modService(Map evaluation) {

        String comment_org = (String) evaluation.get("comment");
        String comment_db = comment_org.replaceAll("\r\n","<br />");
        evaluation.remove("comment");
        evaluation.put("comment", comment_db);

        boolean result = false;

        if(evaluationRepository.updateEvaluation(evaluation)){
            result = true;
        }

        return result;
    }

    public int likesService(int evaluation_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap evaluationSub = new HashMap();
        evaluationSub.put("evaluation_id", evaluation_id);
        evaluationSub.put("member_id", member_id);

        int count = evaluationRepository.selectSubCount(evaluationSub);

        int result;

        int kind = 1;

        if(count !=0) {
            result = evaluationRepository.selectSubType(evaluationSub);
        } else {
            evaluationSub.put("kind", kind);
            evaluationRepository.insertSub(evaluationSub);
            evaluationRepository.updateEvaluationLike(evaluation_id);
            result = 0;
        }

        return result;
    }

    public int dislikeService(int evaluation_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap evaluationSub = new HashMap();
        evaluationSub.put("evaluation_id", evaluation_id);
        evaluationSub.put("member_id", member_id);

        int count = evaluationRepository.selectSubCount(evaluationSub);

        int result;

        int kind = 2;

        if(count !=0) {
            result = evaluationRepository.selectSubType(evaluationSub);
        } else {
            evaluationSub.put("kind", kind);
            evaluationRepository.insertSub(evaluationSub);
            evaluationRepository.updateEvaluationDislike(evaluation_id);
            result = 0;
        }

        return result;

    }

    public int reportService(int evaluation_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        HashMap evaluationSub = new HashMap();
        evaluationSub.put("evaluation_id", evaluation_id);
        evaluationSub.put("member_id", member_id);

        int count = evaluationRepository.selectSubCount(evaluationSub);

        int result;

        int kind = 3;

        if(count !=0) {
            result = evaluationRepository.selectSubType(evaluationSub);
        } else {
            evaluationSub.put("kind", kind);
            evaluationRepository.insertSub(evaluationSub);
            evaluationRepository.updateEvaluationReport(evaluation_id);
            result = 0;
        }

        return result;

    }

    public boolean isDeleteService(int evaluation_id) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        boolean data = false;

        if(evaluationRepository.updateIsDelete(evaluation_id)&&memberRepository.updateUnEvaluationCount(member_id)){
            data = true;
        }

        return data;
    }

    public void searchPreferService(Map search, ModelAndView mav) {

        List<Map> result = evaluationRepository.SearchEvaluationPrefer(search);

        int lecture_id =  Integer.parseInt(search.get("lecture_id").toString());

        mav.addObject("search", search);
        mav.addObject("evaluations", result);
        mav.addObject("lecture", lectureRepository.selectLecture_E(lecture_id));
        mav.addObject("lecture_id", lecture_id);

        if(result.isEmpty() == true) {
            mav.addObject("error", "검색 결과가 없습니다.");
        }

    }

    public void replyService(int evaluation_id, ModelAndView mav) {

        mav.addObject("replys", evaluationRepository.selectReplyAll(evaluation_id));
        mav.addObject("evaluation_id", evaluation_id);

    }

    public boolean replyRegService(Map evaluationSub) {

        MemberInfo user = (MemberInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        int member_id = user.getMember_id();

        evaluationSub.put("member_id", member_id);

        boolean result = false;

        if(evaluationRepository.insertEvaluation(evaluationSub)){

            result = true;
        }

        return result;
    }

}
