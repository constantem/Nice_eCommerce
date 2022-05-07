package tw.nicesport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView showIndex(ModelAndView mav)  {
		List<Discount> discounts = discountService.findAll();
		System.out.println("discount========>"+discounts);
		mav.getModel().put("discounts", discounts);
		mav.setViewName("index");
		
		return mav;
	}
	
	// 測試跳轉前台首頁用
//	@RequestMapping("/")
//	public String showFrontstageHomePage() {
//		return "redirect:/resources/frontstage/index.html";
//	}
	
	// 跳轉前台首頁用
	@RequestMapping("/backstage")
	public String showBackstageHomePage() {
		return "index-backstage";
	}
	
//	// jsp:include 要 include 上與左導覽列用
//	@RequestMapping("/layout/navAndAside")
//	public String showNavAndAside() {
//		return "/layout/nav-and-aside";
//	}
	
//	// jsp:include 要 include 上與左導覽列用
//	@RequestMapping("/layout/underConstruction")
//	public String showUnderContruction() {
//		return "layout/underconstruction";
//	}
}
