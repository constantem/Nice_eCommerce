package tw.nicesport.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.OrderDetailBean;
import tw.nicesport.model.OrdersBean;
import tw.nicesport.service.OrderService;
import tw.nicesport.service.OrderdDetailService;
//管分頁的連線的物件
@Controller
public class OrderController {
	
	@Autowired
	private OrderService OrderService;
	@Autowired
	private OrderdDetailService OrderdDetailService;
	
	@GetMapping("/order")
	public String welcomIndex() {
		return "order/index";
	}
	//宣告進入路徑
	//@RequestParam 去取得值 沒有的話預設"1"
	
	
	@GetMapping("/orders/viewAllOrders")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		//import springframework 的Page 分頁物件  
		//OrderService內的.findByPage()方法
		Page<OrdersBean> page = OrderService.findByPage(pageNumber);
		
		//ModelAndView準備傳到前端
		mav.getModel().put("page", page);
		mav.setViewName("/order/selectAllOrder");
		
		return mav;
	}

//	//宣告進入路徑
//	//@RequestParam 去取得值 沒有的話預設"1"
//	@ResponseBody
//	@GetMapping("/orders/OrderDetail")
//	public Set<OrderDetailBean> OrderDetail(@RequestParam(name = "id") Integer id) {
////		用messageService的findById()方法去資料庫找id
//		OrdersBean order = OrderService.findById(id);
//		Set<OrderDetailBean> orderDetailSet = order.getOrderDetail();
////		Set<OrderDetailBean> orderDetails = order.getOrderDetail();
////		model.addAttribute("OrderDetailSet", orderDetails);
//		return orderDetailSet;
//	}
//	
	
	
	
	//換頁
	@GetMapping("/orders/OrderDetail")
	public String OrderDetail(Model model, @RequestParam(name = "id") Integer id) {
//		用messageService的findById()方法去資料庫找id
		OrdersBean order = OrderService.findById(id);
		List<OrderDetailBean> orderDetails = order.getOrderDetail();
		
		model.addAttribute("order", order);
		model.addAttribute("OrderDetailSet", orderDetails);

		return "/order/viewOrderDetail";
	}
	
	//更新資料
	@GetMapping("/orders/editOrders")
	public String editOrders(Model model, @RequestParam(name="id") Integer id) {

		OrdersBean orders = OrderService.findById(id);
		model.addAttribute("Orders", orders);
		
		return "editOrders";
	}
	
	@PostMapping("/orders/UpdateOrderShipInfo")
	public ModelAndView editMessage(ModelAndView mav, @Valid @ModelAttribute(name="workMessage") OrdersBean orders, BindingResult br) {
		
		mav.setViewName("editOrders");
		
		if(!br.hasErrors()) {
//			https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
			OrderService.insert(orders);
			mav.setViewName("redirect:/message/viewMessages");
		}
		
		return mav;
		
	}
	
	
//	@getMapping("/orders/edit")
//	public String editOrder(Model model,@ReequestOaram(name= ""))
//		
}
