package tw.nicesport.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.dto.CoachsAndRoomsContainer;
import tw.nicesport.model.CartBean;
import tw.nicesport.model.CartProductBean;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Course;
import tw.nicesport.model.Member;
import tw.nicesport.model.OrderDetailBean;
import tw.nicesport.model.OrdersBean;
import tw.nicesport.model.ProductBean;
import tw.nicesport.model.Room;
import tw.nicesport.service.CartProductService;
import tw.nicesport.service.MemberDiscountDetailService;
import tw.nicesport.service.MemberService;
import tw.nicesport.service.OrderService;
import tw.nicesport.service.OrderdDetailService;

//管分頁的連線的物件
@Controller
public class OrderController {
	
	@Autowired
	private OrderService OrderService;
	@Autowired
	private OrderdDetailService OrderdDetailService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CartProductService cartProductService;
	@Autowired
	private MemberDiscountDetailService memberDiscountDetailService;
	
	@GetMapping("/order")
	public String welcomIndex() {
		return "order/index";
	}
	//宣告進入路徑
	//@RequestParam 去取得值 沒有的話預設"1"
	@GetMapping("/staff/orders/viewAllOrders")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		//import springframework 的Page 分頁物件  
		//OrderService內的.findByPage()方法
		Page<OrdersBean> page = OrderService.findByPage(pageNumber);
		for(int i=1;i<5;i++) {
			System.out.println(i);
		}
		//ModelAndView準備傳到前端
		mav.getModel().put("page", page);
		
		mav.setViewName("/order/selectAllOrder");
		
		return mav;
	}

	// 新增訂單
		@RequestMapping("/insertOrder")
		public String insertOrder(
				@RequestParam("memberid") Integer memberid,
				@RequestParam("lastname") String lastname,
				@RequestParam("firstname") String firstname, 
				@RequestParam("email") String email,
				@RequestParam("shipPostalCode") String shipPostalCode, //
				@RequestParam("address") String address, //配送地址				
				@RequestParam("shippingFee") Integer shippingFee,  //運費
				@RequestParam("discountAmount")Integer discountAmount, //最終折價金額
				@RequestParam(name="memberDiscountDetailId",required=false)Integer memberDiscountDetailId    //折價卷明細的ID
				) {
			
			
			//準備工作
			//取得現在時間
			Date date = new Date();
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String nowDate = sdFormat.format(date);
//			=========================================================新增Order區  開始=========================================================			
			// 創建訂單明細 準備insert資料
			OrdersBean ordersBean = new OrdersBean();
			//insert購物車資料
			//找memberID
			Member member = memberService.findById(memberid);
			// insert會員ID
			ordersBean.setMemberBean(member);
			// insert郵遞區號
			ordersBean.setShipPostalCode(shipPostalCode);
			// insert下單日期
			ordersBean.setOrderDate(nowDate);
			// insert購買日期
			ordersBean.setOrderDate(nowDate);
			// insert運費
			ordersBean.setShippingFee(shippingFee);
			// insert收貨人資料
			ordersBean.setShipName(lastname+firstname);
			// insert收貨人地址
			ordersBean.setShipAddress(address);
			// insert訂單狀態
			ordersBean.setOrderStatus(111);
			//insert總價
//			ordersBean.setTotalPrice(totalPrice);
			// insert創建日期
			ordersBean.setCreatedAt(nowDate);
			// insert更改日期
			ordersBean.setModifiedAt(nowDate);
			// 去存起來
			OrdersBean ordersBeanRequest = OrderService.insert(ordersBean);
//			=========================================================新增Order區  結束=========================================================
			//取得此筆新增訂單的ID
			Integer orderId = ordersBean.getOrderId();
			//取得此筆購物車的明細
//			=========================================================新增OrderDetail區  開始=========================================================
//			// 創建訂單明細 準備insert資料
//			OrderDetailBean orderDetailBean = new OrderDetailBean();
			
			//找到購物車明細
			CartBean cart = member.getCart();
			List<CartProductBean> cartProductList = cart.getCartProductBeanList();
//			
			//準備變數接明細的值與運算
			int totalPrice = 0;
						
			//跑for迴圈把所有資料存下來
			for(int i=0; i < cartProductList.size();i++) {
				//cartProductList.get(i)代表 在List中的第幾列資料
				// 創建訂單明細 準備insert資料
				OrderDetailBean orderDetailBean = new OrderDetailBean();
				// insert訂單ID
				orderDetailBean.setOrdersBean(ordersBean);
				// insert產品ID
				orderDetailBean.setProductBean(cartProductList.get(i).getProductBean());
				// insert數量
				orderDetailBean.setQuantity(cartProductList.get(i).getQuantity());
				// insert實際價格
				orderDetailBean.setRealPrice(Integer.parseInt(cartProductList.get(i).getProductBean().getPrice()));
				// insert創建日期
				orderDetailBean.setCreatedAt(nowDate);
				// insert更改日期
				orderDetailBean.setModifiedAt(nowDate);
//				新增"訂單總價"到"訂單Table"  算總價
				totalPrice += Integer.parseInt(cartProductList.get(i).getProductBean().getPrice())*(cartProductList.get(i).getQuantity());
//				totalPrice = totalPrice + shippingFee;
//				ordersBeanRequest.setTotalPrice(totalPrice);
				//存起來~~~~~~
				OrderdDetailService.insert(orderDetailBean);
//				OrderService.insert(ordersBeanRequest);
			}
//			總價加上運費
			System.out.println(discountAmount);
			totalPrice = totalPrice + shippingFee - discountAmount;
			ordersBeanRequest.setDiscountAmount(discountAmount);
			ordersBeanRequest.setTotalPrice(totalPrice);
			OrderService.insert(ordersBeanRequest);
//			=========================================================新增OrderDetail區  結束=========================================================
//			=========================================================清除購物車明細  開始=========================================================
			for (CartProductBean cartProductBean : cartProductList) {
				// 取得整張table的CartId (因javaBean內宣告對應為CartBean)
				CartBean cartBean = cartProductBean.getCartBean();
				// 用CartId去比對CartId相同的刪掉
				if (cartBean.getCartId().equals(cartBean.getCartId())) {
					// 用CartId刪掉此筆資料
					cartProductService.deleteByBean(cartProductBean);
				}
			
			}
//			=========================================================清除購物車明細  結束=========================================================
//			=========================================================清除優惠卷  開始=========================================================
			if(memberDiscountDetailId != null) {
				memberDiscountDetailService.deleteById(memberDiscountDetailId);
			}
//			=========================================================清除優惠卷  結束=========================================================
			
		return "redirect:/Cart/Orderconfirmation?orderId="+ orderId + "&discountAmount=" + discountAmount;
		}
	
	//前台訂單確認畫面
		@GetMapping("/Cart/Orderconfirmation")
	public String OrderConfirmation(Model model,@RequestParam(name ="orderId") Integer id,@RequestParam("discountAmount")Integer discountAmount) {
			//用orderId去找此筆訂單
			OrdersBean order = OrderService.findById(id);
			//找出此筆訂單的明細
			List<OrderDetailBean> orderDetails = order.getOrderDetail();
			//打包送到前端
			model.addAttribute("discountAmount", discountAmount);
			model.addAttribute("order", order);
			model.addAttribute("orderDetails", orderDetails);
							
		return "/Cart/confirmation";
	}	
		
//	@RequestBody 前端的欄位name要對應Bean的欄位(ex:orderDate)
	//檢視訂單明細
	@GetMapping("/orders/OrderDetail")
	public String OrderDetail(Model model, @RequestParam(name = "id") Integer id) {
//		用messageService的findById()方法去資料庫找id
		OrdersBean order = OrderService.findById(id);
		List<OrderDetailBean> orderDetails = order.getOrderDetail();
		
		model.addAttribute("order", order);
		model.addAttribute("OrderDetailSet", orderDetails);

		return "/order/viewOrderDetail";
	}
	
	
	//更新配送資料
	@RequestMapping("/orders/UpdateOrderShipInfo")
	public String updateOneOrderShipInfo(
//			@Valid   //驗證用  表示去驗證下面的OrdersBean 現在沒用到
			@ModelAttribute("order") OrdersBean ordersBean,	Model model) {	
		Integer id = ordersBean.getOrderId(); 
		OrdersBean originalOrdersBean = OrderService.findById(id);
		//把要更新的資料一個一個用set方法塞進去更新  ordersBean.getShipName()會拿到前端送過來的資料裡面的ShipName
		//如果沒有set到的話資料都是null  會直接改到資料庫的資料
		originalOrdersBean.setShipName(ordersBean.getShipName());
		originalOrdersBean.setShipPostalCode(ordersBean.getShipPostalCode());
		originalOrdersBean.setShipAddress(ordersBean.getShipAddress());
		OrderService.updateOne(originalOrdersBean);
		model.addAttribute("ordersBean", ordersBean);
//		redirect:是回到某個指定的Controller方法
		return "redirect:/orders/OrderDetail?id=" + id;  
		}
	
	
	
	//後台 更新訂單狀態
	@RequestMapping("/orders/UpdateOrderState")
	public String updateOneOederState(
			@ModelAttribute("order") OrdersBean ordersBean,Model model){
		System.out.println(ordersBean.getOrderStatus());
		Integer id = ordersBean.getOrderId();
		OrdersBean originalOrdersBean = OrderService.findById(id);
		//把要更新的資料一個一個用set方法塞進去更新  ordersBean.getShipName()會拿到前端送過來的資料裡面的ShipName
		//如果沒有set到的話資料都是null  會直接改到資料庫的資料
		originalOrdersBean.setShippingFee(ordersBean.getShippingFee());
		originalOrdersBean.setOrderStatus(ordersBean.getOrderStatus());
		OrderService.updateOne(originalOrdersBean);
		model.addAttribute("ordersBean", ordersBean);
		
		return "redirect:/orders/OrderDetail?id=" + id;
	}
	
	
	
	//前台 我的訂單 功能
	@RequestMapping("/user/myOrdersByMemberId")
	public ModelAndView selectMyOrders(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber,
		@RequestParam("id")Integer memberId)  {
		
		Member member  = memberService.findById(memberId);
		List<OrdersBean> ordersList =  member.getOrdersBeanList();
		List<OrdersBean> ordersListDESC = new ArrayList<OrdersBean>();
		for(int i =0;i<=ordersList.size()-1;i++) {
			ordersListDESC.add(ordersList.get(ordersList.size()-1-i));
		}
//		memberBean.getOrdersBeanList()  
		System.out.println("=================================================================="+ordersList);
		//OrderService內的.findByPage()方法
//		Page<OrdersBean> page = OrderService.findByPage(pageNumber);
		// 某頁的 list
		List<OrdersBean> ordersListDESCOnePage = listOnePage(ordersListDESC, pageNumber-1, 3);
		// 總頁數
		int totalPages = totalPages(ordersListDESC, 3);
		//ModelAndView準備傳到前端
		mav.getModel().put("member",member);
		mav.getModel().put("totalPages", totalPages);
		mav.getModel().put("ordersList", ordersListDESCOnePage);
//		mav.getModel().put("page", page);		
		mav.setViewName("/order/myOrders");
		
		return mav;
	}
	
	// 總頁數(從1開始數)
	private int totalPages(List<OrdersBean> ordersBeanList ,int pageSize) {
		if(ordersBeanList == null) {
			return 0;
		}
		if(ordersBeanList.isEmpty()) {
			return 0;
		}
		Double listSizeDouble = Double.valueOf(ordersBeanList.size());
		if( ( listSizeDouble % pageSize)==0 ) { // 若整除
			return ordersBeanList.size() / pageSize;
		} else { // 若非整除
			return ordersBeanList.size() / pageSize + 1;
		}
	}
	
	// pageNumber 為從0開始數
	private List<OrdersBean> listOnePage(List<OrdersBean> ordersBeanList, int pageNumber, int pageSize) {
		
		if(pageNumber < 0) {
			return null;
		} 
		
		if(pageSize < 1) {
			return null;
		}
		
		if(ordersBeanList==null) {
			return null;
		}
		
		if(ordersBeanList.isEmpty()) {
			return null;
		}
		
		int startIndex = pageSize * pageNumber;
		int endIndex = startIndex + pageSize-1;
		if(endIndex > ordersBeanList.size()-1 ) {
			endIndex = ordersBeanList.size()-1;
		}
		List<OrdersBean> ordersBeanListOnePage = new ArrayList<>();
		for(int i=startIndex; i<= endIndex; i++) {
			ordersBeanListOnePage.add(ordersBeanList.get(i));
		}
		return ordersBeanListOnePage;
	}
	
	
	
	//前台 我的訂單明細 功能
	@RequestMapping("/user/myOrdersDetailByMemberId")
	public String myOrderDetail(Model model, @RequestParam(name = "orderId") Integer orderId,@RequestParam(name = "memberId") Integer memberId) {
//		用messageService的findById()方法去資料庫找id
		OrdersBean order = OrderService.findById(orderId);
		List<OrderDetailBean> orderDetails = order.getOrderDetail();
		model.addAttribute("memberId",memberId);
		model.addAttribute("order", order);
		model.addAttribute("OrderDetailList", orderDetails);

		return "/order/viewMyOrderDetail";
	}

//	//前台 我的訂單明細 申請修改訂單功能
//	@RequestMapping("/orders/UpdateOrderState")
//	public String updateOneOederState(
//			@ModelAttribute("order") OrdersBean ordersBean,Model model){
//		System.out.println(ordersBean.getOrderStatus());
//		Integer id = ordersBean.getOrderId();
//		OrdersBean originalOrdersBean = OrderService.findById(id);
//		//把要更新的資料一個一個用set方法塞進去更新  ordersBean.getShipName()會拿到前端送過來的資料裡面的ShipName
//		//如果沒有set到的話資料都是null  會直接改到資料庫的資料
//		originalOrdersBean.setShippingFee(ordersBean.getShippingFee());
//		originalOrdersBean.setOrderStatus(ordersBean.getOrderStatus());
//		OrderService.updateOne(originalOrdersBean);
//		model.addAttribute("ordersBean", ordersBean);
//		
//		return "redirect:/orders/OrderDetail?id=" + id;
//	}

		
	

	


	
//		if(br.hasErrors()) {
//			model.addAttribute("OrdersBean", OrdersBean);
//			model.addAttribute( "coachs", crContainer.getCoachs() );
//			model.addAttribute( "rooms", crContainer.getRooms() );
////			return "forward:/show/"+id;
//			return "course/show-a-course";
//		}

//		if(status) {
//			model.addAttribute("course", course);
////			return "course/show-a-course";
//			return "redirect:/order/viewOrderDetail?id="+id;
//		}
//
//		return "course/update-failure";
}
