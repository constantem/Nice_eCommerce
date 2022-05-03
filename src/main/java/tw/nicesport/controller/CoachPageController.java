package tw.nicesport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CoachPageController {

	@RequestMapping("/coach/listPage")
	public String showAllCoachs() {
		return "course/list-all-coachs-back";
	}
	
	@RequestMapping("/coach/form")
	public String coachForm() {
		return "course/coach-form";
	}
}
