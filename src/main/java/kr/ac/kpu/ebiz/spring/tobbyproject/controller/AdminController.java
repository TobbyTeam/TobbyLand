package kr.ac.kpu.ebiz.spring.tobbyproject.controller;

import kr.ac.kpu.ebiz.spring.tobbyproject.repository.EvaluationRepository;
import kr.ac.kpu.ebiz.spring.tobbyproject.repository.LectureRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	LectureRepository lectureRepository;

	@Autowired
	EvaluationRepository evaluationRepository;




	/*강의 관리*/

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "/admin/main";
	}

	@RequestMapping(value = "/lecture/list", method = RequestMethod.GET)
	public ModelAndView lectureList() {
		ModelAndView mav = new ModelAndView("/admin/lectureList");
		mav.addObject("lectures", lectureRepository.selectAdmin());
		return mav;
	}

	@RequestMapping(value = "/lecture/Form", method = RequestMethod.GET)
	public String lectureForm() {
		return "/admin/lectureForm";
	}


	@RequestMapping(value = "/lecture/reg", method = RequestMethod.POST)
	public ModelAndView lectureReg(@RequestParam ("lecture_name")String lecture_name, @RequestParam ("dept")String dept,
								   @RequestParam("prof")String prof) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String member_id = user.getUsername();

		ModelAndView mav = new ModelAndView("/admin/lectureList");
		HashMap<String, String> lecture = new HashMap<String, String>();
		lecture.put("member_id", member_id);
		lecture.put("lecture_name", lecture_name);
		lecture.put("dept", dept);
		lecture.put("prof", prof);
		lectureRepository.insertAdmin(lecture);
		mav.addObject("lectures", lectureRepository.selectAdmin());
		return mav;
	}

	@RequestMapping(value = "/lecture/view", method = RequestMethod.GET)
	public ModelAndView lectureView(@RequestParam int lecture_id) {

		ModelAndView mav = new ModelAndView("/admin/lectureModForm");
/*		Map lecture = lectureRepository.select(lecture_id);
		mav.addObject("lecture", lecture);*/

		return mav;
	}

	@RequestMapping(value = "/lecture/mod", method = RequestMethod.POST)
	public ModelAndView lectureModify(@RequestParam int lecture_id,@RequestParam ("lecture_name")String lecture_name,
							   @RequestParam ("dept")String dept, @RequestParam("prof")String prof)	{

		ModelAndView mav = new ModelAndView("/admin/lectureList");
		HashMap<String, java.io.Serializable> lecture = new HashMap<String, java.io.Serializable>();
		lecture.put("lecture_id",lecture_id);
		lecture.put("lecture_name",lecture_name);
		lecture.put("dept",dept);
		lecture.put("prof",prof);
/*		lectureRepository.update(lecture);*/
		mav.addObject("lectures", lectureRepository.selectAdmin());

		return mav;
	}

	@RequestMapping(value = "/lecture/isDelete", method = RequestMethod.GET)
	public ModelAndView lectureIsDelete(@RequestParam("lecture_id") int lecture_id)	{

		ModelAndView mav = new ModelAndView("/admin/lectureList");
/*		lectureRepository.isDelete(lecture_id);*/

		mav.addObject("lectures", lectureRepository.selectAdmin());

		return mav;
	}

	@RequestMapping(value = "/lecture/isUndelete", method = RequestMethod.GET)
	public ModelAndView lectureIsUndelete(@RequestParam("lecture_id") int lecture_id)	{

		ModelAndView mav = new ModelAndView("/admin/lectureList");
		lectureRepository.isUndelete(lecture_id);

		mav.addObject("lectures", lectureRepository.selectAdmin());

		return mav;
	}

	@RequestMapping(value = "/lecture/delete", method = RequestMethod.GET)
	public ModelAndView lectureDelete(@RequestParam("lecture_id") int lecture_id)	{

		ModelAndView mav = new ModelAndView("/admin/lectureList");
		lectureRepository.delete(lecture_id);

		mav.addObject("lectures", lectureRepository.selectAdmin());

		return mav;
	}

	@RequestMapping(value = "/lecture/Search", method = RequestMethod.GET)
	public ModelAndView lectureSearch(@RequestParam ("searchType")String searchType, @RequestParam ("searchWord")String searchWord) {

		ModelAndView mav = new ModelAndView("/admin/lectureList");

		HashMap search = new HashMap();
		search.put("searchType",searchType);
		search.put("searchWord",searchWord);

		List<Map> result = lectureRepository.selectSearchAdmin(search);

		mav.addObject("lectures", result);

		if(result.isEmpty() == true){
			mav.addObject("error", "검색 결과가 없습니다.");
		}

		return mav;

	}




	/*강의평가 관리*/


	@RequestMapping(value = "/evaluation/list", method = RequestMethod.GET)
	public ModelAndView evaluationList() {

		ModelAndView mav = new ModelAndView("/admin/evaluationList");

		mav.addObject("evaluations", evaluationRepository.selectAdmin());

		return mav;
	}

	@RequestMapping(value = "/evaluation/reportList", method = RequestMethod.GET)
	public ModelAndView evaluationReportList() {

		ModelAndView mav = new ModelAndView("/admin/evaluationList");

		mav.addObject("evaluations", evaluationRepository.selectReport());

		return mav;
	}

	@RequestMapping(value = "/evaluation/view", method = RequestMethod.GET)
	public ModelAndView evaluationView(@RequestParam int evaluation_id) {

		ModelAndView mav = new ModelAndView("/admin/evaluationModForm");
/*		Map evaluation = evaluationRepository.select(evaluation_id);
		mav.addObject("evaluation", evaluation);*/

		return mav;
	}

	@RequestMapping(value = "/evaluation/mod", method = RequestMethod.POST)
	public ModelAndView evaluationModify(@RequestParam("evaluation_id") int evaluation_id, @RequestParam("method") String method,
										 @RequestParam("task") String task, @RequestParam("exam") String exam,
										 @RequestParam("comment") String comment, @RequestParam("score") int score,
										 @RequestParam("report") int report) {

		ModelAndView mav = new ModelAndView("/admin/evaluationList");

		HashMap<String, java.io.Serializable> evaluation = new HashMap<String, java.io.Serializable>();
		evaluation.put("evaluation_id", evaluation_id);
		evaluation.put("method", method);
		evaluation.put("task", task);
		evaluation.put("exam", exam);
		evaluation.put("comment", comment);
		evaluation.put("score", score);
		evaluation.put("report", report);
		evaluationRepository.updateAdmin(evaluation);

		mav.addObject("evaluations", evaluationRepository.selectReport());

		return mav;
	}

	@RequestMapping(value = "/evaluation/isDelete", method = RequestMethod.GET)
	public ModelAndView evaluationisDelete(@RequestParam("evaluation_id")int evaluation_id) {

		ModelAndView mav = new ModelAndView("/admin/evaluationList");

/*		evaluationRepository.isDelete(evaluation_id);*/

		mav.addObject("evaluations", evaluationRepository.selectReport());

		return mav;
	}

	@RequestMapping(value = "/evaluation/isUndelete", method = RequestMethod.GET)
	public ModelAndView evaluationIsUndelete(@RequestParam("evaluation_id") int evaluation_id)	{

		ModelAndView mav = new ModelAndView("/admin/evaluationList");
		evaluationRepository.isUndelete(evaluation_id);

		mav.addObject("evaluations", evaluationRepository.selectReport());

		return mav;
	}

	@RequestMapping(value = "/evaluation/delete", method = RequestMethod.GET)
	public ModelAndView evaluationDelete(@RequestParam("evaluation_id") int evaluation_id)	{

		ModelAndView mav = new ModelAndView("/admin/evaluationList");
		evaluationRepository.delete(evaluation_id);

		mav.addObject("evaluations", evaluationRepository.selectReport());

		return mav;
	}

	@RequestMapping(value = "/evaluation/Search", method = RequestMethod.GET)
	public ModelAndView evaluationSearch(@RequestParam ("searchType")String searchType, @RequestParam ("searchWord")String searchWord) {

		ModelAndView mav = new ModelAndView("/admin/evaluationList");

		HashMap search = new HashMap();
		search.put("searchType",searchType);
		search.put("searchWord",searchWord);

		List<Map> result = evaluationRepository.selectSearchAdmin(search);

		mav.addObject("evaluations", result);

		if(result.isEmpty() == true){
			mav.addObject("error", "검색 결과가 없습니다.");
		}

		return mav;

	}


}
