package survey;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/survey")
public class SurveyController {

	@RequestMapping(method = RequestMethod.GET)
	public String form(Model model) {
		List<Question> questions = createQuestions();
		model.addAttribute("questions", questions);
		return "survey/surveyForm";
	}

	private List<Question> createQuestions() {
		Question q1 = new Question("당신의 선호하는 수업방식은?", 
				Arrays.asList("독고다이형", "토론형", "실습형"));
		Question q2 = new Question("당신의 선호하는 과제방식은?", 
				Arrays.asList("텀프로젝트(Term Project)", "텀프로젝트(Team Project)", "개인과제"));
		Question q3 = new Question("당신의 선호하는 시험방식은?", 
				Arrays.asList("서술형", "혼합형", "오픈북"));
		Question q4 = new Question("하고 싶은 말을 적어주세요.");
		return Arrays.asList(q1, q2, q3, q4);
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("ansData") AnsweredData data) {
		return "survey/submitted";
	}

}
