package tw.nicesport.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.CartBean;
import tw.nicesport.model.CartProductBean;
import tw.nicesport.model.Member;
import tw.nicesport.model.ProductBean;
import tw.nicesport.model.ProductWishListBean;
import tw.nicesport.model.ProductWishListRepository;
import tw.nicesport.model.StockBean;
import tw.nicesport.service.CartProductService;
import tw.nicesport.service.MemberService;
import tw.nicesport.service.ProductService;
import tw.nicesport.service.ProductWishListService;
import tw.nicesport.service.StockService;

@Controller
public class ProductWishListController {

	@Autowired
	private ProductWishListService pmfService;

	@Autowired
	private ProductService pdService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StockService stService;

	@Autowired
	private CartProductService cartProductService;


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

//	從單一商品頁加入追蹤清單
	@GetMapping("/user/addMyWishListByMemberId")
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

		return "redirect:/getOneProductShop" + Integer.valueOf(productId);
	}

//	從商城頁加入追蹤清單
	@GetMapping("/user/addMyWishListFromShopByMemberId")
	public String insertWishListFromShopProduct(@RequestParam("productId") Integer productId,
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

//	從商城新增至購物車
	@RequestMapping("/user/addMyCartFromShopByMemberId")
	public String insertCartFromShop(@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, @RequestParam("quantity") Integer quantity) {

		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		ProductBean product = pdService.findById(productid);
		CartProductBean cartProductBean = new CartProductBean();

		cartProductBean.setCartBean(cart);
		cartProductBean.setProductBean(product);
		cartProductBean.setQuantity(quantity);

		cartProductService.insert(cartProductBean);

//		return "redirect:/user/myWishListByMemberId?id=" + Integer.valueOf(memberid);
		return "redirect:/FrontpageSeperate";

	}

//	從商品頁新增至購物車
	@RequestMapping("/user/addMyCartFromSingleProductByMemberId")
	public String insertCartSingleProduct(@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, @RequestParam("quantity") Integer quantity) {

		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		ProductBean product = pdService.findById(productid);
		CartProductBean cartProductBean = new CartProductBean();

		cartProductBean.setCartBean(cart);
		cartProductBean.setProductBean(product);
		cartProductBean.setQuantity(quantity);

		cartProductService.insert(cartProductBean);

		return "redirect:/getOneProductShop" + Integer.valueOf(productid);

	}
	
	// 從願望清單新增資料至購物車
	@RequestMapping("/insertCartFromCartWishList")
	public String insertCartFromWishList(@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, @RequestParam("quantity") Integer quantity) {

		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		ProductBean product = pdService.findById(productid);
		CartProductBean cartProductBean = new CartProductBean();

		cartProductBean.setCartBean(cart);
		cartProductBean.setProductBean(product);
		cartProductBean.setQuantity(quantity);

		cartProductService.insert(cartProductBean);

		return "redirect:/user/myWishList";
	}
	
	

	// for ajax
	@GetMapping("/findMyWishList")
	@ResponseBody
	public List<ProductBean> findWishList(@RequestParam("memberId") Integer memberId) {
		Member member = memberService.findById(memberId);
		Set<ProductWishListBean> productMyWishListSet = member.getProductMyWishListSet();
		List<ProductBean> productBeanList = new ArrayList<>();
		for (ProductWishListBean productWishListBean : productMyWishListSet) {
			ProductBean productBean = productWishListBean.getProductBean();
			productBeanList.add(productBean);
		}
		
		return productBeanList;
	}

	@GetMapping("/user/myWishListByMemberId")
	public ModelAndView findMyWishList(ModelAndView mav, @RequestParam("id") Integer memberId) {
		List<StockBean> stock = stService.findAll();
		Member member = memberService.findById(memberId);
		Set<ProductWishListBean> productMyWishListSet = member.getProductMyWishListSet();
		List<ProductBean> productBeanList = new ArrayList<>();
		List<Integer> wishIds = new ArrayList<>();
		for (ProductWishListBean productWishListBean : productMyWishListSet) {
			ProductBean productBean = productWishListBean.getProductBean();
			productBeanList.add(productBean);
			wishIds.add(productWishListBean.getId());
		}
		
		mav.getModel().put("productBeanList", productBeanList);
		mav.getModel().put("wishIds", wishIds);
		mav.getModel().put("member", member);
		mav.getModel().put("stock", stock);
		mav.setViewName("/product/myWishList");

		return mav;
	}
	
	
	
	@GetMapping("/user/myWishListByMemberIdForAjax")
	@ResponseBody
	public boolean findMyWishListForAjax(
			@RequestParam("memberId") Integer memberId,
			@RequestParam("productId") Integer productId) {

		Member member = memberService.findById(memberId);
		Set<ProductWishListBean> productMyWishListSet = member.getProductMyWishListSet();
		for (ProductWishListBean productWishListBean : productMyWishListSet) {
			Integer thisProductId = productWishListBean.getProductBean().getId();
			if(thisProductId == productId) {
				return true;
			}
		}
		return false;
	}



	@GetMapping(value = "deleteOneWish")
	public String deleteWishList(@RequestParam("wishId") Integer wishId) {
		pmfService.deleteWishList(wishId);

		return "redirect:/user/myWishList";
	}

	// for ajax
	@GetMapping(value = "/deleteOneWishAjax")
	@ResponseBody
	public void deleteOneWishList(@RequestParam("wishId") Integer wishId) {
		pmfService.deleteWishList(wishId);
	}

}
