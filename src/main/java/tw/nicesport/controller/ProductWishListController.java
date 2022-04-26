package tw.nicesport.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Member;
import tw.nicesport.model.ProductBean;
import tw.nicesport.model.ProductWishListBean;
import tw.nicesport.service.MemberService;
import tw.nicesport.service.ProductService;
import tw.nicesport.service.ProductWishListService;

@Controller
public class ProductWishListController {
	
	@Autowired
	private ProductWishListService pmfService;
	
	@Autowired
	private ProductService pdService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	@GetMapping("/insertProductToWishList")
	public String insertWishList(@RequestParam("productId") Integer productId,
			@RequestParam("memberId") Integer memberId) {
		
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);
		
		ProductWishListBean pdMyFavorBean = new ProductWishListBean();
		ProductBean pdBean = pdService.findById(productId);
		Member mbBean = memberService.findById(memberId);
		
		pdMyFavorBean.setCreatedAt(creDate);
		pdMyFavorBean.setMember(mbBean);
		pdMyFavorBean.setProductBean(pdBean);
			
		pmfService.insert(pdMyFavorBean);
		
		return "redirect:/FrontpageSeperate";
	}
	
	@GetMapping("/insertProductToWishListInSingleProduct")
	public String insertWishListInSingleProduct(@RequestParam("productId") Integer productId,
			@RequestParam("memberId") Integer memberId) {
		
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creDate = sdFormat.format(date);
		
		ProductWishListBean pdMyFavorBean = new ProductWishListBean();
		ProductBean pdBean = pdService.findById(productId);
		Member mbBean = memberService.findById(memberId);
		
		pdMyFavorBean.setCreatedAt(creDate);
		pdMyFavorBean.setMember(mbBean);
		pdMyFavorBean.setProductBean(pdBean);
			
		pmfService.insert(pdMyFavorBean);
		
		return "redirect:/getOneProductShop"+Integer.valueOf(productId);
	}
	

	
	//for ajax
	@GetMapping("/findMyWishList")
	@ResponseBody
	public List<ProductBean> findWishList(@RequestParam("memberId") Integer memberId){
		Member member = memberService.findById(memberId);
		Set<ProductWishListBean> productMyWishListSet = member.getProductMyWishListSet();
		List<ProductBean> productBeanList = new ArrayList<>();
		for(ProductWishListBean productWishListBean : productMyWishListSet) {
			ProductBean productBean = productWishListBean.getProductBean();
			productBeanList.add(productBean);			
		}
		
		return productBeanList;
	}
	
	@GetMapping("/user/myWishListByMemberId")
	public ModelAndView findMyWishList(ModelAndView mav,@RequestParam("id") Integer memberId){
		Member member = memberService.findById(memberId);
		Set<ProductWishListBean> productMyWishListSet = member.getProductMyWishListSet();
		List<ProductBean> productBeanList = new ArrayList<>();
		for(ProductWishListBean productWishListBean : productMyWishListSet) {
			ProductBean productBean = productWishListBean.getProductBean();
			productBeanList.add(productBean);			
		}
		mav.getModel().put("productBeanList", productBeanList);
		mav.setViewName("/product/myWishList");
		
		return mav;
	}
	
	
	
	

}
