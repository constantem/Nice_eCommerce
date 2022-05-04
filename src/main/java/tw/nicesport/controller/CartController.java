package tw.nicesport.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.nicesport.model.CartBean;
import tw.nicesport.model.CartProductBean;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Member;
import tw.nicesport.model.OrdersBean;
import tw.nicesport.model.ProductBean;
import tw.nicesport.service.CartProductService;
import tw.nicesport.service.CartService;
import tw.nicesport.service.CoachService;
import tw.nicesport.service.MemberService;
import tw.nicesport.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private CartProductService cartProductService;

	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;

	// 查找資料
	@RequestMapping("/selectCart")
	@ResponseBody
	public List<CartProductBean> selectCart(@RequestParam("memberid") Integer memberid) {
		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		List<CartProductBean> cartProduct = cart.getCartProductBeanList();

		return cartProduct;

	}

	//進會員購物車
	@RequestMapping("/user/myCartByMemberId")
	public ModelAndView selectCartForPage(ModelAndView mav, @RequestParam("memberid") Integer memberid) {
		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		List<CartProductBean> cartProductList = cart.getCartProductBeanList();
		//把List塞進mav中
		mav.getModel().put("member", member);
		mav.getModel().put("cartProductList", cartProductList);
		//設定跳轉頁面		
		mav.setViewName("/Cart/cart"); //合併以我為準

		return mav;
	}
	
	@RequestMapping("/checkOut")
	public ModelAndView checkOut(ModelAndView mav, @RequestParam("memberid") Integer memberid) {
		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		List<CartProductBean> cartProductList = cart.getCartProductBeanList();
		//把List塞進mav中
		mav.getModel().put("member",member);
		mav.getModel().put("cartProductList", cartProductList);
		//設定跳轉頁面
		mav.setViewName("/Cart/checkout");

		return mav;
	}
	
//	從商品頁新增至購物車
	@RequestMapping("/user/addMyCartFromSingleProductByMemberId")
	public String insertCartSingleProduct(@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, @RequestParam("quantity") Integer quantity) {

		// 利用memberService去找購物車的JavaBean(因為有可能清空購物車後ID不同)(因為是外鍵)
		Member member = memberService.findById(memberid);
		// 找到屬於這個會員的購物車
		CartBean cart = member.getCart();
	
		// 現有的購物車明細
		List<CartProductBean> existingCartProductBeanList = cart.getCartProductBeanList();
		
		// 創建購物車明細 準備insert資料
		CartProductBean cartProductBean = new CartProductBean();
		
		// 如果商品已存在, 用現有的明細
		boolean productExists = false;
		for(CartProductBean thisCartProductBean : existingCartProductBeanList) {
			if(thisCartProductBean.getProductBean().getId() == productid) {
				productExists = true;
				cartProductBean = thisCartProductBean;
				break;
			}
		}
		
		// 如果商品不存在
		if(!productExists) { 
			// 找資料庫product的資料
			ProductBean product = productService.findById(productid);
			// insert購物車資料
			cartProductBean.setCartBean(cart);
			// insert商品資料
			cartProductBean.setProductBean(product);
			// insert商品數量
			cartProductBean.setQuantity(quantity);
			// 去存起來
			cartProductService.insert(cartProductBean);
			
		// 如果商品已存在
		} else { 
			cartProductBean.setQuantity(cartProductBean.getQuantity()+quantity);
			cartProductService.updateOne(cartProductBean);
		}
		
		return "redirect:/getOneProductShop" + Integer.valueOf(productid);

	}
	
//	從商城新增至購物車
	@RequestMapping("/user/addMyCartFromShopByMemberId")
	public String insertCartFromShop(@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, @RequestParam("quantity") Integer quantity) {

		// 利用memberService去找購物車的JavaBean(因為有可能清空購物車後ID不同)(因為是外鍵)
		Member member = memberService.findById(memberid);
		// 找到屬於這個會員的購物車
		CartBean cart = member.getCart();
	
		// 現有的購物車明細
		List<CartProductBean> existingCartProductBeanList = cart.getCartProductBeanList();
		
		// 創建購物車明細 準備insert資料
		CartProductBean cartProductBean = new CartProductBean();
		
		// 如果商品已存在, 用現有的明細
		boolean productExists = false;
		for(CartProductBean thisCartProductBean : existingCartProductBeanList) {
			if(thisCartProductBean.getProductBean().getId() == productid) {
				productExists = true;
				cartProductBean = thisCartProductBean;
				break;
			}
		}
		
		// 如果商品不存在
		if(!productExists) { 
			// 找資料庫product的資料
			ProductBean product = productService.findById(productid);
			// insert購物車資料
			cartProductBean.setCartBean(cart);
			// insert商品資料
			cartProductBean.setProductBean(product);
			// insert商品數量
			cartProductBean.setQuantity(quantity);
			// 去存起來
			cartProductService.insert(cartProductBean);
			
		// 如果商品已存在
		} else { 
			cartProductBean.setQuantity(cartProductBean.getQuantity()+quantity);
			cartProductService.updateOne(cartProductBean);
		}

//		return "redirect:/user/myWishListByMemberId?id=" + Integer.valueOf(memberid);
		return "redirect:/FrontpageSeperate";

	}
	
	// 從願望清單新增資料至購物車
	@RequestMapping("/insertCartFromCartWishList")
	public String insertCartFromWishList(@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, @RequestParam("quantity") Integer quantity) {

		// 利用memberService去找購物車的JavaBean(因為有可能清空購物車後ID不同)(因為是外鍵)
		Member member = memberService.findById(memberid);
		// 找到屬於這個會員的購物車
		CartBean cart = member.getCart();
	
		// 現有的購物車明細
		List<CartProductBean> existingCartProductBeanList = cart.getCartProductBeanList();
		
		// 創建購物車明細 準備insert資料
		CartProductBean cartProductBean = new CartProductBean();
		
		// 如果商品已存在, 用現有的明細
		boolean productExists = false;
		for(CartProductBean thisCartProductBean : existingCartProductBeanList) {
			if(thisCartProductBean.getProductBean().getId() == productid) {
				productExists = true;
				cartProductBean = thisCartProductBean;
				break;
			}
		}
		
		// 如果商品不存在
		if(!productExists) { 
			// 找資料庫product的資料
			ProductBean product = productService.findById(productid);
			// insert購物車資料
			cartProductBean.setCartBean(cart);
			// insert商品資料
			cartProductBean.setProductBean(product);
			// insert商品數量
			cartProductBean.setQuantity(quantity);
			// 去存起來
			cartProductService.insert(cartProductBean);
			
		// 如果商品已存在
		} else { 
			cartProductBean.setQuantity(cartProductBean.getQuantity()+quantity);
			cartProductService.updateOne(cartProductBean);
		}

		return "redirect:/user/myWishList";
	}

	// 刪除購物車內同商品的明細
	@RequestMapping("/DeleteCart")
	@ResponseBody
	public void DeleteCart(@RequestParam("memberid") Integer memberid, @RequestParam("productid") Integer productid) {
		// 用memberService取得memberid
		Member mamber = memberService.findById(memberid);
		// 取得mamber中的購物車(Cart)
		CartBean cart = mamber.getCart();
		// 取得cart中的CartProductBeanList
		List<CartProductBean> list = cart.getCartProductBeanList();
		// 用for迴圈去一行行讀資料
		for (CartProductBean cartProductBean : list) {
			// 取得整張table的product_id (因javaBean內宣告對應為ProductBean)
			ProductBean product = cartProductBean.getProductBean();
			// 用ProductBean去比對前端傳來的Product_id
			if (productid.equals(product.getId())) {
				// 用Product_id刪掉此筆資料
				cartProductService.deleteByBean(cartProductBean);
			}

		}
	}

	// 更新購物車數量
	@RequestMapping("/updateIncreaseQuantity")
	@ResponseBody
	public CartProductBean updateIncreaseQuantity(
			@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, 
			@RequestParam("quantity") Integer quantity
			) {

		// 利用memberService去找購物車的JavaBean(因為有可能清空購物車後ID不同)(因為是外鍵)
		Member member = memberService.findById(memberid);
		// 找到屬於這個會員的購物車
		CartBean cart = member.getCart();
		// 找資料庫product的資料
		ProductBean product = productService.findById(productid);

		// 創建購物車明細 準備insert資料
		CartProductBean cartProductBean = new CartProductBean();

		// insert購物車資料
		cartProductBean.setCartBean(cart);
		// insert商品資料
		cartProductBean.setProductBean(product);
		// insert商品數量
		cartProductBean.setQuantity(quantity+1);
		// 去存起來

		cartProductService.updateOne(cartProductBean);

		return cartProductBean;
	}
//	@RequestMapping("/updateQuantity")
//	public ModelAndView updateQuantity(
//			@RequestParam("productid") Integer productid,
//			@RequestParam("memberid") Integer memberid, 
//			@RequestParam("quantity") Integer quantity) {
//		Member member = memberService.findById(memberid);
//		CartBean cart = member.getCart();
//		List<CartProductBean> cartProductList = cart.getCartProductBeanList();
//			return null;
//		productService.deleteById(product);
//		return CartProductBean;
//	}



}
