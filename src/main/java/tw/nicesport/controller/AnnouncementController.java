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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.AnnouncementBean;
import tw.nicesport.service.AnnouncementService;


@Controller
public class AnnouncementController {

	@Autowired
	private AnnouncementService announcementService;
	
	@GetMapping("/announcement/view")
	public String welcomIndex() {
		return "announcement/index";
	}
	
	@GetMapping("/announcement/form")
	public ModelAndView announcementForm() {
		ModelAndView mav = new ModelAndView();
		mav.getModel().put("announcement", new AnnouncementBean());
		mav.setViewName("announcement/form");
		return mav;
	}
	
	@GetMapping("/announcement/add")
	public ModelAndView addAnnouncement(@Valid @ModelAttribute("announcement") AnnouncementBean announcementBean, 
			  BindingResult br) {
		ModelAndView mav = new ModelAndView();
		announcementService.insert(announcementBean);
		mav.setViewName("redirect:/announcement/viewAnnouncement");
		return mav;
	}
	
	@GetMapping("announcement/deleteAnnouncement")
	public ModelAndView deleteAnnouncement(ModelAndView mav, @RequestParam(name="id") Integer id) {
		announcementService.deleteById(id);
		mav.setViewName("redirect:/announcement/viewAnnouncement");
		return mav;
	}
	
	//頁面轉到view
	@GetMapping(path = "/announcement/viewAnnouncement2")
	public String processMainPage() {
		return "/discount/viewAnnouncement";
	}
	
		
//	@GetMapping(value = "/discount/get/{id}")
//	public Discount getCustomerById(@PathVariable Integer id) {
//		Discount responseDis = discountService.findById(id);
//		
//		if(responseDis.isPresent()) {
//			return responseDis.get();
//		}
//		return null;
//	}
	
	@GetMapping("/announcement/viewAnnouncement")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<AnnouncementBean> page = announcementService.findByPage(pageNumber);
		List<AnnouncementBean> announcements = page.getContent();
		mav.getModel().put("page", page);
		mav.getModel().put("announcements", announcements);
		mav.setViewName("/announcement/viewAnnouncement");
		
		return mav;
	}
	
	//pageNumber在service已經-1過，不需要再減
//		@GetMapping("/discount/viewDiscount")
//		public ModelAndView viewDiscountPage(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
//			Page<Discount> page = discountService.findByPage(pageNumber);
//			
//			mav.getModel().put("page", page);
//			//回傳的頁面
//			mav.setViewName("/discount/viewDiscount");
//			
//			return mav;
//		}
	
	
	//跳轉到前台頁面
//		@RequestMapping("/discount/showEvents-front")
//		public String showAllEventsInFront(Model model) {		
//			List<Discount> discounts = discountService.queryAll();
//			model.addAttribute("discounts", discounts);
//			return "discount/showEvents-front";
//		}
	
	//跳轉到前台頁面
//	@RequestMapping("/discount/showADs-front")
//	public String showAllADsInFront(Model model) {		
//		List<Discount> discounts = discountService.queryAll();
//		model.addAttribute("discounts", discounts);
//		return "discount/showADs-front";
//	}
	
	@GetMapping("/announcement/showEditAnnouncement")
	public String editAnnouncement(Model model, @RequestParam(name="id") Integer id) {
		
		AnnouncementBean ann = announcementService.findById(id);
//		System.out.println(dis.getDiscountCategory());
	 	model.addAttribute("announcement", ann);
	 	
	 	return "/announcement/editAnnouncement";
	}
	
	@PostMapping("announcement/sendEditAnnouncement")
	public ModelAndView editAnnouncement(ModelAndView mav, @ModelAttribute(name="announcementBean") 
		AnnouncementBean ann) {
		
		//System.out.println(dis.getDiscountCategory());
		announcementService.update(ann);
		
		mav.setViewName("redirect:/announcement/viewAnnouncement");
		
		return mav;
	}
	

//	@GetMapping("/discount/ajax")
//	public String ajaxPage() {
//		return "ajax-messages";
//	}
	
	
	
	
	
}
