package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import ch.qos.logback.core.pattern.color.BlackCompositeConverter;
import tw.nicesport.model.CartBean;
import tw.nicesport.model.CartProductBean;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Discount;
import tw.nicesport.model.Member;
import tw.nicesport.model.MemberDiscountDetailBean;
import tw.nicesport.model.OrdersBean;
import tw.nicesport.model.ProductBean;
import tw.nicesport.service.CartProductService;
import tw.nicesport.service.CartService;
import tw.nicesport.service.CoachService;
import tw.nicesport.service.DiscountService;
import tw.nicesport.service.MemberService;
import tw.nicesport.service.ProductService;
import tw.nicesport.util.DiscountUtils;

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

	@Autowired
	private DiscountService discountService;

	// 查找資料
	@RequestMapping("/selectCart")
	@ResponseBody
	public List<CartProductBean> selectCart(@RequestParam("memberid") Integer memberid) {
		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		List<CartProductBean> cartProduct = cart.getCartProductBeanList();

		return cartProduct;

	}

	// 進會員購物車
	@RequestMapping("/user/myCartByMemberId")
	public ModelAndView selectCartForPage(ModelAndView mav, @RequestParam("memberid") Integer memberid) {
		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		List<CartProductBean> cartProductList = cart.getCartProductBeanList();
		// 把List塞進mav中
		mav.getModel().put("member", member);
		mav.getModel().put("cartProductList", cartProductList);
		// 設定跳轉頁面
		mav.setViewName("/Cart/cart"); // 合併以我為準

		return mav;
	}
	//	進checkOut頁面
	@RequestMapping("/checkOut")
	public ModelAndView checkOut(ModelAndView mav, 
			@RequestParam("memberid") Integer memberid ,
			@RequestParam("discountAmount")Integer discountAmount,
			@RequestParam(name="memberDiscountDetailId",required=false)Integer memberDiscountDetailId) {
		Member member = memberService.findById(memberid);
		CartBean cart = member.getCart();
		List<CartProductBean> cartProductList = cart.getCartProductBeanList();
		// 把List塞進mav中
		mav.getModel().put("memberDiscountDetailId", memberDiscountDetailId);
		mav.getModel().put("discountAmount", discountAmount);
		mav.getModel().put("member", member);
		mav.getModel().put("cartProductList", cartProductList);
		// 設定跳轉頁面
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
		for (CartProductBean thisCartProductBean : existingCartProductBeanList) {
			if (thisCartProductBean.getProductBean().getId() == productid) {
				productExists = true;
				cartProductBean = thisCartProductBean;
				break;
			}
		}

		// 如果商品不存在
		if (!productExists) {
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
			cartProductBean.setQuantity(cartProductBean.getQuantity() + quantity);
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
		for (CartProductBean thisCartProductBean : existingCartProductBeanList) {
			if (thisCartProductBean.getProductBean().getId() == productid) {
				productExists = true;
				cartProductBean = thisCartProductBean;
				break;
			}
		}

		// 如果商品不存在
		if (!productExists) {
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
			cartProductBean.setQuantity(cartProductBean.getQuantity() + quantity);
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
		for (CartProductBean thisCartProductBean : existingCartProductBeanList) {
			if (thisCartProductBean.getProductBean().getId() == productid) {
				productExists = true;
				cartProductBean = thisCartProductBean;
				break;
			}
		}

		// 如果商品不存在
		if (!productExists) {
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
			cartProductBean.setQuantity(cartProductBean.getQuantity() + quantity);
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
	public CartProductBean updateIncreaseQuantity(@RequestParam("memberid") Integer memberid,
			@RequestParam("productid") Integer productid, @RequestParam("quantity") Integer quantity) {

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
		cartProductBean.setQuantity(quantity + 1);
		// 去存起來

		cartProductService.updateOne(cartProductBean);

		return cartProductBean;
	}

	// 使用優惠卷
	@RequestMapping("/UseDiscount")
	@ResponseBody
	public Map<String, Integer> Discount(
			@RequestParam("memberid") Integer memberid, 
			@RequestParam("total") Integer Subtotal,
			@RequestParam("DiscountName") String discountName) {

///宣告區  開始///
		
		//宣告一個布林值準備判斷是否擁有優惠卷
		boolean haveDiscount = false;
		//宣告一個新的List準備存取優惠卷內容
		Integer memberDiscountDetailId = null;
		Discount discount = null;
		
///宣告區  結束///
///判斷是否有優惠卷 開始///
		//調用discountService裡的findAllByMemberId方法去找出此會員的所有優惠卷
		Set<MemberDiscountDetailBean> memberDiscountDetailBeanSet = discountService.findAllByMemberId(memberid);
//		System.out.println("===============================================================" + memberdiscountList);
		//利用for迴圈一筆一筆去比對優惠卷名稱
		for (MemberDiscountDetailBean memberDiscountDetailBean : memberDiscountDetailBeanSet) {
//			System.out.println("===============================================================" + memberdiscountList.get(i).getName());
//			System.out.println(discountName);
			//利用前端傳來的discountName比對memberdiscountList中的Name
			if (discountName.equals(memberDiscountDetailBean.getDiscount().getName())) {
				//有的話判斷為真
				haveDiscount = true; 
//				將此筆優惠卷存起來
				discount =  memberDiscountDetailBean.getDiscount();
				memberDiscountDetailId = memberDiscountDetailBean.getId();
				System.out.println("===============================================================" + discount);
				System.out.println("有此優惠卷");
				//跳出迴圈
				break;
			} else {
				//如果沒有優惠卷(未完成)
				System.out.println("沒有此優惠卷");
			}
		}
///判斷是否有優惠卷  結束///
///判斷是否有符合資格  開始///
		
		Map<String, Integer> map = new HashMap<>();
		
		//判斷完是否有優惠卷後 判斷是否符合優惠卷規則如果符合則進行折價後回傳折扣金額
				if(haveDiscount) {
					Boolean isDiscountable = DiscountUtils.isDiscountable(Subtotal, discount.getConditionCategory(), discount.getConditionPrice(),discount.getCurrentQuantity());//符合門檻
					if(isDiscountable) {
						Integer discountamount  = DiscountUtils.resultCalculator(Subtotal, discount.getDiscountCategory(), discount.getDiscountPercent(),discount.getDiscountAmount());//計算折扣金額
						System.out.println("===============================================================" + discountamount);
						map.put("memberDiscountDetailId", memberDiscountDetailId);
						map.put("discountamount", discountamount);
						return map;
					} else {
						System.out.println("不符合資格");
						return null;
					}
				}
///判斷是否有符合資格  結束///
	return null;
	}

// 修改購物車商品數量並儲存
	@RequestMapping("/updateQuantity")
	public String updateCart(@RequestParam("memberId") Integer memberId, @RequestParam("cartProductId") Integer id,
			@RequestParam("quantity") Integer quantity) {

		CartProductBean cartProductBean = cartProductService.findById(id);
		cartProductBean.setQuantity(quantity);
		cartProductService.updateOne(cartProductBean);
		return "redirect:/user/myCartByMemberId?memberid=" + Integer.valueOf(memberId);
	}

}
