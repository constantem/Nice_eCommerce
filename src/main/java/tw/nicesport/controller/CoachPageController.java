package tw.nicesport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CoachPageController {

	@RequestMapping("/coach/listPage")
	public String showAllCoachs(Model model) {
		model.addAttribute("activeLi", "coachList");
		return "course/list-all-coachs-back";
	}
	
	@RequestMapping("/coach/form")
	public String coachForm() {
		return "course/coach-form";
	}
	
	@RequestMapping("/coach/detailPage/{id}")
	public String showACoach(
			@PathVariable("id") Integer id,
			Model model) {
		model.addAttribute("id",id);
		return "course/detail-a-coach-back";
	}
}
