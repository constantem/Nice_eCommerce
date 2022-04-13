package tw.nicesport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.nicesport.model.Course;

@Controller
public class JsonTestController {

	@RequestMapping("/jsontest/main")
	public String jsonTestJsp() {
		return "json-test";
	}
	
	@RequestMapping("/jsontest/test1")
	@ResponseBody
	public Course test1() throws JsonProcessingException {
		Course course = new Course();
		course.setCourseName("瑜珈");
//		ObjectMapper mapper = new ObjectMapper();
//		String courseString = mapper.writeValueAsString(course);
//		return courseString;
		return course;
	}
}
