package tw.nicesport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FakeIndexController {

	@RequestMapping("/course")
	public String showHomePage() {
		return "course/home";
	}
}
