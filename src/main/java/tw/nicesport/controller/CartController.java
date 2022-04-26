package tw.nicesport.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.nicesport.model.CartBean;
import tw.nicesport.model.CartProductBean;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Member;
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
	
	
	
	//查找資料
	@RequestMapping("/selectCart")
	@ResponseBody
	public List<CartProductBean> selectCart(@RequestParam("memberid") Integer memberid) {
		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		List<CartProductBean> cartProduct = cart.getCartProductBeanList();
				
		return cartProduct;
		
	} 
	
	//新增資料
	@RequestMapping("/insertCart")
	@ResponseBody
	public CartProductBean insertCart(
			@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, 
			@RequestParam("quantity") Integer quantity) {
		
		//利用memberService去找購物車的JavaBean(因為有可能清空購物車後ID不同)(因為是外鍵)
		Member member = memberService.findById(memberid);
		//找到屬於這個會員的購物車
		CartBean cart = member.getCart();
		//找資料庫product的資料
		ProductBean product = productService.findById(productid);
		
		//創建購物車明細  準備insert資料
		CartProductBean cartProductBean = new CartProductBean();
		
		//insert購物車資料
		cartProductBean.setCartBean(cart);
		//insert商品資料
		cartProductBean.setProductBean(product);
		//insert商品數量
		cartProductBean.setQuantity(quantity);
		//去存起來
		
//		cart.getCartProductBeanList().add(cartProductBean);//同步		
//		System.out.println("==============================================" + cartProductBean);
		
		cartProductService.insert(cartProductBean);
		
		return cartProductBean;
	} 
	
	//刪除購物車
	@RequestMapping("/DeleteCart")
	@ResponseBody
	public void DeleteCart(@RequestParam("memberid") Integer memberid,@RequestParam("productid") Integer productid) {
		//用memberService取得memberid
		Member mamber = memberService.findById(memberid);
		//取得mamber中的購物車(Cart)
		CartBean cart =mamber.getCart();
		//取得cart中的CartProductBeanList
		List<CartProductBean> list = cart.getCartProductBeanList();
		//用for迴圈去一行行讀資料
		for(CartProductBean cartProductBean : list) {
			//取得整張table的product_id (因javaBean內宣告對應為ProductBean)
			  ProductBean product = cartProductBean.getProductBean();
			//用ProductBean去比對前端傳來的Product_id
			if(productid.equals(product.getId())) {
				//用Product_id刪掉此筆資料
				cartProductService.deleteByBean(cartProductBean);
			}
			
		}
		
//		productService.deleteById(product);
//		return CartProductBean;
	}
	
	
}
