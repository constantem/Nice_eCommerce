package tw.nicesport.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.PunchCardSystem;
import tw.nicesport.model.PunchCardSystemRepository;
import tw.nicesport.service.PunchCardSystemService;


@Controller
public class PunchCardSystemController {

	@Autowired
	private PunchCardSystemService punchCardSystemService;
	
	@Autowired
	private PunchCardSystemRepository punchCardDao;  

	@GetMapping("/staff/PunchCardSystemByEmployeeId")
	public String punchCardSystem(@RequestParam("employeeid") Integer employeeid, Model model) {
		model.addAttribute("employeeid",employeeid);
		return "employee/PunchCardSystem";
	}
	
	
	@PostMapping("/savePunchCard")
	@ResponseBody
	public ModelAndView savePunchCard(ModelAndView mav,@Valid @ModelAttribute(name = "PunchCardSystem") PunchCardSystem punchCcard,
	BindingResult br) {
		
		PunchCardSystem newPunchCard = new PunchCardSystem();
		
//		if(newPunchCard.getPunchstatus().equals("in")) {
//			newPunchCard.setPunchin(null);
//		}else if(newPunchCard.getPunchstatus().equals("out")) {
//			newPunchCard.setPunchout(null);
//		}
		String employeeid = punchCcard.getEmployeeid().toString();
		String punchstatus = punchCcard.getPunchstatus(); 
		punchCardDao.delPunchCard(punchstatus, employeeid);
		
		punchCardSystemService.insertPunchCardSystem(punchCcard);
			mav.getModel().put("PunchCardSystem", newPunchCard);
				
		mav.setViewName("employee/PunchCardSystem");
		//System.out.println(newPunchCard);
		return mav;
	}
	
	@GetMapping("/findPunchRecord")
	@ResponseBody
	public List<PunchCardSystem> findPunchRecord(
			@RequestParam(name="year") String year ,
			@RequestParam(name="month") String month,
			@RequestParam(name="employeeid") String employeeid
			){
		return punchCardDao.findCard(year, month,employeeid);
		
	}
	
	@GetMapping("/confirmPunch")
	@ResponseBody
	public List<PunchCardSystem> confirmPunch(
			@RequestParam(name="year") String year ,
			@RequestParam(name="month") String month,
			@RequestParam(name="day") String day,
			@RequestParam(name="employeeid") String employeeid
			){
		return punchCardDao.confirmPunch(year, month,day,employeeid);
		
	}
	
}