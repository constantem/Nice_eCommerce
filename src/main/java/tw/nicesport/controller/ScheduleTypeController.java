package tw.nicesport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.nicesport.model.ScheduleType;
import tw.nicesport.model.WorkSchedule;
import tw.nicesport.service.ScheduleTypeService;
import tw.nicesport.service.WorkScheduleService;

@Controller
public class ScheduleTypeController {
	
	@Autowired
	private ScheduleTypeService scheduletypeservice;
	

	@GetMapping("/ScheduleType")
	@ResponseBody
	public List<ScheduleType> WorkScheduleAll(){
		
		List<ScheduleType>  scheduletype = scheduletypeservice.findAllSchedule();
		
		return  scheduletype;
	}
	
	
	
	
}
