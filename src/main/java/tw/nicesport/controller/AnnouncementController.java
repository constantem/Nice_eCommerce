package tw.nicesport.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.AnnouncementBean;
import tw.nicesport.model.Discount;
import tw.nicesport.service.AnnouncementService;
import tw.nicesport.service.DiscountService;
import tw.nicesport.util.BytesUtils;


@Controller
public class AnnouncementController {

	@Autowired
	private AnnouncementService announcementService;
	
	@Autowired
	private DiscountService discountService;
	
	@GetMapping("/announcement/view")
	public String welcomIndex() {
		return "announcement/index";
	}
	
	@GetMapping("/announcement/addAnnouncement")
	public ModelAndView announcementAddAnnouncement() {
		ModelAndView mav = new ModelAndView();
		List<Discount> discounts = discountService.findAll();
		List<Discount> discountNotUsedList = new ArrayList<>();
		for(Discount discount : discounts) {
			if(discount.getAnnouncementBean() == null) {
				discountNotUsedList.add(discount);
			}
		}
		mav.getModel().put("announcement", new AnnouncementBean());
		mav.getModel().put("discounts", discountNotUsedList);
		mav.setViewName("announcement/addAnnouncement");
		return mav;
	}
	
	@PostMapping("/announcement/add")
	public ModelAndView addAnnouncement(
			ModelAndView mav,
			@Valid @ModelAttribute("announcement") AnnouncementBean announcementBean, 
			BindingResult br,
			@RequestParam("file") MultipartFile file) throws IOException {
		
		// file 轉 bytes
		byte[] bytes = BytesUtils.multipartFileToBytes(file);
		announcementBean.setEventPicture(bytes);
		
		
		// 找出指定優惠券
		Integer discountId = announcementBean.getDiscountId();
		Discount discount = discountService.findById(discountId);
		// 將優惠券綁進活動
		announcementBean.setDiscount(discount);
		// 新增活動(已綁定優惠券)
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

	
	@GetMapping("/announcement/viewAnnouncement")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<AnnouncementBean> page = announcementService.findByPage(pageNumber);
//		List<AnnouncementBean> announcements = page.getContent();
		mav.getModel().put("page", page);
//		mav.getModel().put("announcements", announcements);
		mav.setViewName("/announcement/viewAnnouncement");
		
		return mav;
	}
	
	@GetMapping("/announcement/showEditAnnouncement")
	public String editAnnouncement(Model model, @RequestParam(name="id") Integer id) {
		
		// 單一活動
		AnnouncementBean ann = announcementService.findById(id);
		// 此活動照片的 bytes 要轉 String
		if(ann.getEventPicture() != null) { // 
			ann.setEventPictureBase64(
					Base64.getEncoder().encodeToString( ann.getEventPicture() )
				);
		} 

//		System.out.println(dis.getDiscountCategory());
	 	model.addAttribute("announcement", ann);
	 	
	 	// 此單一活動的優惠券以及其他未被活動綁定的優惠券
		List<Discount> discounts = discountService.findAll();
		List<Discount> discountNotUsedAndCurrentList = new ArrayList<>();
		for(Discount discount : discounts) {
			if(discount.getAnnouncementBean() == null) {
				discountNotUsedAndCurrentList.add(discount);
			}
		}
		discountNotUsedAndCurrentList.add( ann.getDiscount() );
		model.addAttribute("discounts", discountNotUsedAndCurrentList);
	 	
	 	return "/announcement/editAnnouncement";
	}
	
	@PostMapping("announcement/sendEditAnnouncement")
	public ModelAndView editAnnouncement(
			ModelAndView mav, 
			@ModelAttribute(name="announcementBean") AnnouncementBean ann,
			@RequestParam("file") MultipartFile file) throws IOException {
		// file 轉 bytes
		byte[] bytes = BytesUtils.multipartFileToBytes(file);
		ann.setEventPicture(bytes);
		
		// 找對應優惠券java bean
		Integer discountId = ann.getDiscountId();
		Discount discount = discountService.findById(discountId);
		// 修改活動的優惠券
		ann.setDiscount(discount);
		discount.setAnnouncementBean(ann);
		// 修改活動
		announcementService.update(ann);
		
		mav.setViewName("redirect:/announcement/viewAnnouncement");
		
		return mav;
	}
	

//	@GetMapping("/discount/ajax")
//	public String ajaxPage() {
//		return "ajax-messages";
//	}
	
	/////////////////////////////////////////前台活動//////////////////////////////////////////////
	//跳轉到前台活動頁面
	@RequestMapping("/announcement/showEvents-front")
	public String showAllEventsInFront(Model model) {		
		List<AnnouncementBean> announcements = announcementService.findAllAnnouncement();
		// list中每個活動照片的 bytes 要轉 String
		for(AnnouncementBean ann : announcements) {
			if(ann.getEventPicture() != null) { // 
				ann.setEventPictureBase64(
						Base64.getEncoder().encodeToString( ann.getEventPicture() )
				);
			} 
		}

		model.addAttribute("announcements", announcements);
		return "discount/showEvents-front";
	}
	
	//跳轉到前台活動詳情頁面
	@GetMapping("/announcement/showEventsDetails-front")
	public ModelAndView showEvents(ModelAndView mav, @RequestParam(name = "id") Integer id) {
		AnnouncementBean announcement = announcementService.findById(id);
		// 此活動照片的 bytes 要轉 String
		if(announcement.getEventPicture() != null) { 
			announcement.setEventPictureBase64(
					Base64.getEncoder().encodeToString( announcement.getEventPicture() )
				);
		} 
		mav.addObject("announcement",announcement);
		mav.setViewName("discount/showEventsDetails-front");
		return mav;
	} 

}
