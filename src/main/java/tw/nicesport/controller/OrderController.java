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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.dto.CoachsAndRoomsContainer;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Course;
import tw.nicesport.model.OrderDetailBean;
import tw.nicesport.model.OrdersBean;
import tw.nicesport.model.Room;
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
	
	
	//更新配送資料
	@RequestMapping("/orders/UpdateOrderShipInfo")
	public String updateOneOrderShipInfo(
//			@Valid   //驗證用  表示去驗證下面的OrdersBean
			@ModelAttribute("order") OrdersBean ordersBean,
			Model model) {	
		Integer id = ordersBean.getOrder_id(); 
		OrdersBean originalOrdersBean = OrderService.findById(id);
		//把要更新的資料一個一個用set方法塞進去更新  ordersBean.getShipName()會拿到前端送過來的資料裡面的ShipName
		//如果沒有set到的話資料都是null  會直接改到資料庫的資料
		originalOrdersBean.setShipName(ordersBean.getShipName());
		originalOrdersBean.setShipPostalCode(ordersBean.getShipPostalCode());
		originalOrdersBean.setShipAddress(ordersBean.getShipAddress());
		OrderService.updateOne(originalOrdersBean);
		model.addAttribute("ordersBean", ordersBean);;
//		redirect:是回到某個指定的Controller方法
		return "redirect:/orders/OrderDetail?id=" + id;  
		}
	
	
	
	
	@RequestMapping("/orders/UpdateOrderState")
	public String updateOneOederState(
			@ModelAttribute("order") OrdersBean ordersBean,
			Model model
			){
		Integer id = ordersBean.getOrder_id();
		
		
		return "redirect:/orders/OrderDetail?id=" + id;
	}
	
	
//	@RequestMapping("/orders/UpdateOrderState")
//	public String updateOneCourse(
////			@Valid   //驗證用  表示去驗證下面的OrdersBean
//			@ModelAttribute("order") OrdersBean ordersBean,
//			Model model) {	
//		Integer id = ordersBean.getOrder_id(); 
//		OrdersBean originalOrdersBean = OrderService.findById(id);
//		//把要更新的資料一個一個用set方法塞進去更新  ordersBean.getShipName()會拿到前端送過來的資料裡面的ShipName
//		//如果沒有set到的話資料都是null  會直接改到資料庫的資料
//		originalOrdersBean.setShipName(ordersBean.getShipName());
//		originalOrdersBean.setShipPostalCode(ordersBean.getShipPostalCode());
//		originalOrdersBean.setShipAddress(ordersBean.getShipAddress());
//		OrderService.updateOne(originalOrdersBean);
//		model.addAttribute("ordersBean", ordersBean);;
////		redirect:是回到某個指定的Controller方法
//		return "redirect:/orders/OrderDetail?id=" + id;  
//		}




}

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
