package tw.nicesport.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Discount;
import tw.nicesport.service.DiscountService;

@Controller
public class DiscountController {
	
	@Autowired
	private DiscountService discountService;
	
	@GetMapping("/discount")
	public String welcomIndex() {
		return "discount/index";
	}
	
	@GetMapping("/discount/form")
	public ModelAndView discountForm() {
		ModelAndView mav = new ModelAndView();
		mav.getModel().put("discount", new Discount());
		mav.setViewName("discount/form");
		return mav;
	}
	
	@GetMapping("/discount/add")
	public ModelAndView addDiscount(@Valid @ModelAttribute("discount") Discount discount, 
			  BindingResult br) {
		ModelAndView mav = new ModelAndView();
		discountService.insert(discount);
		mav.setViewName("discount/insertSuccess");
		return mav;
	}
	
	@GetMapping("discount/deleteDiscount")
	public ModelAndView deleteMessage(ModelAndView mav, @RequestParam(name="id") Integer id) {
		discountService.deleteById(id);
		mav.setViewName("redirect:/discount/viewDiscount");
		return mav;
	}
	
	//頁面轉到view
	@GetMapping(path = "/discount/viewDiscount2")
	public String processMainPage() {
		return "/discount/viewDiscount";
	}
	
	@GetMapping("/discount/viewDiscount")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<Discount> page = discountService.findByPage(pageNumber);
		List<Discount> discounts = page.getContent();
		mav.getModel().put("discounts", discounts);
		mav.setViewName("/discount/viewDiscount");
		
		return mav;
	}
	
	@GetMapping("/discount/showEditDiscount")
	public String editDiscount(Model model, @RequestParam(name="id") Integer id) {
		
		Discount dis = discountService.findById(id);
//		System.out.println(dis.getDiscountCategory());
	 	model.addAttribute("discount", dis);
	 	
	 	return "/discount/editDiscount";
	}
	
	@PostMapping("discount/sendEditDiscount")
	public ModelAndView editDiscount(ModelAndView mav, @ModelAttribute(name="discount") 
		Discount dis) {
		
		//System.out.println(dis.getDiscountCategory());
		discountService.update(dis);
		
		mav.setViewName("redirect:/discount/viewDiscount");
		
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