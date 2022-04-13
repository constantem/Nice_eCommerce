package tw.nicesport.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.nicesport.model.Employee;
import tw.nicesport.model.Member;
import tw.nicesport.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	//// 會員登入 ////
	
	@RequestMapping("/member")
	public String showMemberLoginForm(Model model) {
		model.addAttribute("member", new Member());
		return "login/member-login-form";
	}
	
	@RequestMapping("/member/check")
	public String checkMemberLogin(
			HttpServletRequest request,
			@Valid @ModelAttribute("member") Member member,
			BindingResult bindingResult,
			Model model
		) {
		
		if(bindingResult.hasErrors()) {
			return "login/member-login-form";
		}
		
		boolean memberExists = loginService.checkMemberLogin(member);
		
		if(memberExists) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("loginOK", member.getUsername());
			return "login/member-login-success";
		} else {
			model.addAttribute("error", Map.of("notexist", "查無此帳號"));
			return "login/member-login-form";
		}
	}
	
	//// 員工登入 ////
	
	@RequestMapping("/employee")
	public String showEmployeeLoginForm(Model model) {
		model.addAttribute("employee", new Employee());
		return "login/employee-login-form";
	}
	
	@RequestMapping("/employee/check")
	public String checkEmployeeLogin(
			HttpServletRequest request,
			@Valid @ModelAttribute("employee") Employee employee,
			BindingResult bindingResult,
			Model model
		) {
		
		if(bindingResult.hasErrors()) {
			return "login/employee-login-form";
		}
		
		boolean employeeExists = loginService.checkEmployeeLogin(employee);
		
		if(employeeExists) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("loginOK", employee.getEmployeeId());
			return "login/employee-login-success";
		} else {
			model.addAttribute("error", Map.of("notexist", "查無此帳號"));
			return "login/employee-login-form";
		}
	}
}
