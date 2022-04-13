package tw.nicesport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Discount;
import tw.nicesport.model.WorkMessages;
import tw.nicesport.service.DiscountService;

@Controller
public class DiscountController {
	
	@Autowired
	private DiscountService discountService;
	
	@GetMapping("/")
	public String welcomIndex() {
		return "index";
	}
	
	@GetMapping("/discount/form")
	public ModelAndView discountForm() {
		ModelAndView mav = new ModelAndView();
		mav.getModel().put("discount", new Discount());
		mav.setViewName("discount/form");
		return mav;
	}
	
	@GetMapping("/discount/add")
	public ModelAndView addDiscount(@ModelAttribute("discount") Discount discount) {
		ModelAndView mav = new ModelAndView();
		discountService.insert(discount);
		
		mav.setViewName("discount/insertSuccess");
		return mav;
	}
	
	//pageNumber在service已經-1過，不需要再減
//	@GetMapping("/discount/viewMessages")
//	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//		Page<WorkMessages> page = messageService.findByPage(pageNumber);
//		
//		mav.getModel().put("page", page);
//		//回傳的頁面
//		mav.setViewName("viewMessages");
//		
//		return mav;
//	}
	
//	@GetMapping("/discount/ajax")
//	public String ajaxPage() {
//		return "ajax-messages";
//	}
	

}