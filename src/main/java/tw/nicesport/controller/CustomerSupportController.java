package tw.nicesport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.CustomerBean;
import tw.nicesport.service.CustomerService;

@Controller
public class CustomerSupportController {
	
	@Autowired
	private CustomerService csService;
	
	@GetMapping("/message")
	public String welcomeIndex() {
		return "customerSupport/index";
	}
	
	@GetMapping("/message/selectOne")
	public ModelAndView selectOnePage(ModelAndView m) {
		
		CustomerBean lastMag = csService.getLastest();
		m.getModel().put("lastMag", lastMag);
//		m.addObject("lastMag", lastMag);
		m.setViewName("customerSupport/selectOne");
		return m;
	}
	
	@GetMapping("/message/selectAll")
	public ModelAndView selectAllPage(ModelAndView m1) {
		List<CustomerBean> allCus = csService.findAllCustomer();
		m1.getModel().put("allCus", allCus);
		m1.setViewName("customerSupport/selectAll");
		return m1;
		
	}
	

	
	//導去輸入表單
	@RequestMapping("/message/form")
	public ModelAndView formPage() {
		
		// Model and View, view 規定去哪個 jsp, model 裡放去那個 jsp 帶的資料
		ModelAndView m1 = new ModelAndView(); 
		
		// 空的 java bean, 要塞進 model, 讓 ModelAndView 帶去 jsp
		CustomerBean cs = new CustomerBean();
		
		m1.getModel().put("CustomerBean",cs ); // java bean 塞進 model
		m1.setViewName("customerSupport/form"); // ModelAndView 裡規定去哪個 jsp
		return m1;
	}
	
	//寫入資料庫
//	@RequestMapping(value="/message/insert", method=RequestMethod.GET)
//	@GetMapping("/message/insert")
//	@RequestMapping(value="/message/insert", method=RequestMethod.POST)
//	@PostMapping("/message/insert")
	@RequestMapping("/message/insert")
	public ModelAndView insertPage(@ModelAttribute(name="CustomerBean") CustomerBean cs) {
		
		CustomerBean csb = csService.insert(cs); //insert不需有回傳值
		
		ModelAndView m1 = new ModelAndView();
		CustomerBean csResult = csService.findById(csb.getId());
		m1.getModel().put("csResult",csResult);
		m1.setViewName("customerSupport/selectOne");//重導到controller的方法
		return m1;
	}
	
	//導去修改畫面
	@PostMapping("/message/edit")
	public ModelAndView editPage(ModelAndView m2) {
		m2.setViewName("customerSupport/edit");
		return m2;
	}
	
	@PostMapping("/message/delete")
	public ModelAndView deletePage(ModelAndView m3) {
		m3.setViewName("customerSupport/delete");
		return m3;
	}
	
}
