package tw.nicesport.controller;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

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
			ModelAndView mav,
			RedirectAttributes redirectAttributes,
			@RequestParam(name="hasError",required=false) String hasError,
			HttpServletRequest request) {
		
		if(hasError != null) {
			if(hasError.equals("adminDeny") || hasError.equals("employeeDeny")) {
				redirectAttributes.addAttribute("hasError",hasError);
				return "redirect:/backstage";
			}
		}

    	// 若沒登入
		redirectAttributes.addAttribute("hasError","泛用錯誤");
		return "redirect:/";
	}
}
