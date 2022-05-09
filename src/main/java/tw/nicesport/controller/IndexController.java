package tw.nicesport.controller;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Discount;
import tw.nicesport.service.DiscountService;


@Controller // 本 controller 專做本組首頁跳轉
public class IndexController {

	@Autowired
	private DiscountService discountService;
	
	// 跳轉前台首頁用
	@RequestMapping("/")
	public String showIndex(
			Model model, 
			Authentication authentication,
			HttpServletRequest request) throws ServletException {
		
		// 首頁優惠券輪播
		List<Discount> discounts = discountService.findAllMessages();
		model.addAttribute("discounts", discounts);
		
		/////////////// 首頁強制後台角色登出 /////////////////
		if(authentication!=null) { // 沒登入時, authentication 為 null
        	Set<String> roles = authentication.getAuthorities().stream()
              	     .map(r -> r.getAuthority()).collect(Collectors.toSet());

            if(roles.contains("ROLE_EMPLOYEE")) { // 後台角色登入中, 包含 admin(也有 "ROLE_EMPLOYEE")
            	request.logout(); // 登出後台角色, 以利前台再登入
//            	new SecurityContextLogoutHandler().logout(request, null, null); // 法二
            }
    	}
		
		return "index";
	}
	
	// 跳轉前台首頁用
	@RequestMapping("/backstage")
	public String showBackstageHomePage(
			Authentication authentication,
			HttpServletRequest request) throws ServletException {
		
		// 後台首頁強制前台角色登出
		if(authentication!=null) { // 沒登入時, authentication 為 null
        	Set<String> roles = authentication.getAuthorities().stream()
              	     .map(r -> r.getAuthority()).collect(Collectors.toSet());

            if(roles.contains("ROLE_USER")) { // 前台角色登入中
            	request.logout(); // 登出前台角色, 以利後台再登入
//            	new SecurityContextLogoutHandler().logout(request, null, null); // 法二
            }
    	}
		
		return "index-backstage";
	}

}
