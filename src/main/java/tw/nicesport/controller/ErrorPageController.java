package tw.nicesport.controller;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ErrorPageController implements ErrorController {

	@RequestMapping("/error")
	public String toIndexWithErrorMessage(
			Authentication authentication,
			ModelAndView mav,
			RedirectAttributes redirectAttributes,
			@RequestParam(name="hasError",required=false) String hasError) {
		
		System.out.println("=======後端 error controller hasError param=======");
		System.out.println(hasError);
		
		if(hasError != null) {
			if(hasError.equals("adminDeny") || hasError.equals("employeeDeny")) {
				redirectAttributes.addAttribute("hasError",hasError);
				return "redirect:/backstage";
			}
		}

//		// 若某角色登入中
//    	if(authentication!=null) {
//    		// DB 紀錄的 roles (但如果是第三方登入的 roles 要加工)
//        	Set<String> roles = authentication.getAuthorities().stream()
//              	     .map(r -> r.getAuthority()).collect(Collectors.toSet());
//           	System.out.println("後端 error controller user roles=======>|"+roles);
//           	
//           	// 加工第三方登入的 roles, 只取出其中的 ROLE_ 開頭的字
//           	Set<String> rolesTemp = new HashSet<>();
//           	if(roles.contains("SCOPE_openid")) {
//           		for(String role : roles) {
//           			if(role.startsWith("ROLE")) {
//           				rolesTemp.add(role);
//           			}
//           			roles = rolesTemp;
//           		}
//           	}
//           	
//           	// 前台登入中, 以前台為準
//           	if( roles.contains("ROLE_USER") ) {
//           		redirectAttributes.addAttribute("hasError","userInBackstage");
//           		return "redirect:/";
//           	} else if( roles.contains("ROLE_EMPLOYEE") ) {
//           		redirectAttributes.addAttribute("hasError","staffInfrontstage");
//           		return "redirect:/backstage";
//           	}
//    	} 
		
    	// 若沒登入
		redirectAttributes.addAttribute("hasError","泛用錯誤");
		return "redirect:/";
	}
}
