package tw.nicesport.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.nicesport.dto.UsernameAndPasswordWrapper;
import tw.nicesport.model.Employee;
import tw.nicesport.model.LoginERepository;
import tw.nicesport.model.Member;
import tw.nicesport.service.LoginService;

@Controller
public class StaffLoginController {

	@Autowired
	private LoginService loginService;
	
	//// 員工登入 ////
    
	@GetMapping("/staffLogin") // GET /login/employee
	public String showEmployeeLoginForm(Model model) {
		model.addAttribute("usernameAndPasswordWrapper", new UsernameAndPasswordWrapper());
		return "login/employee-login-form";
	}
	
	@RequestMapping("/staffLoginAutoInputFirst")
	@ResponseBody
	public Employee employeeLoginAutoInput() {
		System.out.println(loginService.findFirstEmployee());
		return loginService.findFirstEmployee();
	}
	
    @RequestMapping("/staff/role")
    @ResponseBody
    public Set<String> currentRole(Authentication authentication) {
    	if(authentication!=null) {
        	Set<String> roles = authentication.getAuthorities().stream()
              	     .map(r -> r.getAuthority()).collect(Collectors.toSet());
           	System.out.println("後端 staff roles=======>|"+roles);
               return roles;
    	} else {
    		System.out.println("後端 staff roles=======>|null");
    		return new HashSet<>();
    	}
    }
    
    @RequestMapping("/staff/fullName")
    @ResponseBody
    public Map<String,String> currentFullName(Principal principal) throws NumberFormatException, Exception {
		String username = principal.getName();
		Employee employee = loginService.findEmployeeByUsername(Integer.parseInt(username));
		String fullName = 
				Objects.requireNonNullElse(employee.getLastName(), "") +
				Objects.requireNonNullElse(employee.getFirstName(), "");
		Map<String,String> profile = new HashMap<>();
		profile.put("fullName", fullName);
		profile.put("imgSrc", employee.getImg());
		return profile;
    }
    
	// 後端我(員工)的資料: 中間站
	@RequestMapping("/staff/myProfile")
	public String showMyProfile(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Employee employee = loginService.findEmployeeByUsername(Integer.parseInt(username));
		return "forward:/staff/myProfileByEmployeeId?employeeid="+employee.getEmployee_id();
	}
	
	// 後端我的打卡: 中間站
	@RequestMapping("/staff/PunchCardSystem")
	public String showPunchCardSystem(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Employee employee = loginService.findEmployeeByUsername(Integer.parseInt(username));
		return "forward:/staff/PunchCardSystemByEmployeeId?employeeid="+employee.getEmployee_id();
	}
}
