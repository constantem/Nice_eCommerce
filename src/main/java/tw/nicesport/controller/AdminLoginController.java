package tw.nicesport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.nicesport.dto.UsernameAndPasswordWrapper;
import tw.nicesport.model.Employee;
import tw.nicesport.service.LoginService;

@Controller
public class AdminLoginController {

	@Autowired
	private LoginService loginService;
	
	//// 超級管理員登入 ////
    
	@GetMapping("/adminLogin") // GET /login/employee
	public String showAdminLoginForm(Model model) {
		model.addAttribute("usernameAndPasswordWrapper", new UsernameAndPasswordWrapper());
		return "login/admin-login-form";
	}
	
	// 超級管理員一鍵輸入
	@RequestMapping("/adminLoginAutoInput")
	@ResponseBody
	public Employee employeeLoginAutoInputFirst() {
		return loginService.findAdmin();
	}
	
}
