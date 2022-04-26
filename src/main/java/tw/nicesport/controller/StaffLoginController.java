package tw.nicesport.controller;

import java.security.Principal;
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
    	Set<String> roles = authentication.getAuthorities().stream()
       	     .map(r -> r.getAuthority()).collect(Collectors.toSet());
        return roles;
    }
    
	// 後端我(員工)的資料: 中間站
	@RequestMapping("/staff/myProfile")
	public String showMyProfile(Principal principal, Model model) throws Exception {
		String username = principal.getName();
		Employee employee = loginService.findEmployeeByUsername(Integer.parseInt(username));
		return "forward:/user/myProfileByEmployeeId?id="+employee.getEmployee_id();
	}
}
