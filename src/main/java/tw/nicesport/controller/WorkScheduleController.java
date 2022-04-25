package tw.nicesport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.nicesport.model.WorkSchedule;
import tw.nicesport.service.WorkScheduleService;

@Controller
public class WorkScheduleController {
	
	@Autowired
	private WorkScheduleService workscheduleservice;
	

	@GetMapping("/employee/WorkSchedule")
	public void WorkSchedule() {
	}
	
	
	
	@GetMapping("/WorkSchedule")
	public List<WorkSchedule> WorkScheduleAll(){
		
		List<WorkSchedule> workschedule = workscheduleservice.findAllSchedule();
		
		return workschedule;
	}
	
	
}
