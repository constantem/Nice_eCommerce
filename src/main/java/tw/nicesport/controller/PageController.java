package tw.nicesport.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.OrderDetailBean;
import tw.nicesport.model.OrdersBean;
import tw.nicesport.service.WorkOrderService;
//管分頁的連線的物件
@Controller
public class PageController {
	
	@Autowired
	private WorkOrderService OrderService;
	
	@GetMapping("/")
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

	//宣告進入路徑
	//@RequestParam 去取得值 沒有的話預設"1"
	@GetMapping("/orders/OrderDetail")
	public String OrderDetail(Model model, @RequestParam(name = "id") Integer id) {
//		用messageService的findById()方法去資料庫找id
		OrdersBean order = OrderService.findById(id);
		Set<OrderDetailBean> orderDetails = order.getOrderDetail();
		model.addAttribute("OrderDetailSet", orderDetails);

		return "/order/viewOrderDetail";
	}
	
//	@getMapping("/orders/edit")
//	public String editOrder(Model model,@ReequestOaram(name= ""))
//		
}
