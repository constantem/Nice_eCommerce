package tw.nicesport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller // 本 controller 專做本組首頁跳轉
public class IndexController {

	// 跳轉前台首頁用
	@RequestMapping("/frontstage")
	public String showFrontstageHomePage() {
		return "index";
	}
	
	// 跳轉前台首頁用
	@RequestMapping("/")
	public String showBackstageHomePage() {
		return "index-backstage";
	}
	
//	// jsp:include 要 include 上與左導覽列用
//	@RequestMapping("/layout/navAndAside")
//	public String showNavAndAside() {
//		return "/layout/nav-and-aside";
//	}
	
	// jsp:include 要 include 上與左導覽列用
	@RequestMapping("/layout/underConstruction")
	public String showUnderContruction() {
		return "layout/underconstruction";
	}
}
