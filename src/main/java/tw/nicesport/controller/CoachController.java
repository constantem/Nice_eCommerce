package tw.nicesport.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.nicesport.model.Coach;
import tw.nicesport.service.CoachService;

@Controller
@RequestMapping("/coach")
public class CoachController {

	@Autowired
	private CoachService coachService;
	
	@RequestMapping("/query/all")
	@ResponseBody
	public List<Coach> queryAllCoach() throws JsonProcessingException {
		List<Coach> coachs = coachService.queryAll();
		return coachs;
	} 
}
