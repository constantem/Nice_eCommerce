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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/staff/announcement/addAnnouncement")
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
		
		// file ??? bytes
		byte[] bytes = BytesUtils.multipartFileToBytes(file);
		announcementBean.setEventPicture(bytes);
		
		
		// ?????????????????????
		Integer discountId = announcementBean.getDiscountId();
		Discount discount = discountService.findById(discountId);
		// ????????????????????????
		announcementBean.setDiscount(discount);
		// ????????????(??????????????????)
		announcementService.insert(announcementBean);
		mav.setViewName("redirect:/staff/announcement/viewAnnouncement");
		return mav;
	}
	
	@GetMapping("announcement/deleteAnnouncement")
	public ModelAndView deleteAnnouncement(ModelAndView mav, @RequestParam(name="id") Integer id) {
		announcementService.deleteById(id);
		mav.setViewName("redirect:/staff/announcement/viewAnnouncement");
		return mav;
	}
		
	@GetMapping("/staff/announcement/viewAnnouncement")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<AnnouncementBean> page = announcementService.findByPage(pageNumber);
//		List<AnnouncementBean> announcements = page.getContent();
		
		List<AnnouncementBean> announcements = announcementService.findAllAnnouncement();
		// list???????????????????????? bytes ?????? String
		for(AnnouncementBean ann : announcements) {
			if(ann.getEventPicture() != null) { // 
				ann.setEventPictureBase64(
						Base64.getEncoder().encodeToString( ann.getEventPicture() )
				);
			} 
		}
		
		mav.getModel().put("page", page);
		mav.getModel().put("announcements", announcements);
		mav.setViewName("/announcement/viewAnnouncement");
		
		return mav;
	}
	
	@GetMapping("/announcement/showEditAnnouncement")
	public String editAnnouncement(Model model, @RequestParam(name="id") Integer id) {
		
		// ????????????
		AnnouncementBean ann = announcementService.findById(id);
		// ?????????????????? bytes ?????? String
		if(ann.getEventPicture() != null) { // 
			ann.setEventPictureBase64(
					Base64.getEncoder().encodeToString( ann.getEventPicture() )
				);
		} 

//		System.out.println(dis.getDiscountCategory());
	 	model.addAttribute("announcement", ann);
	 	
	 	// ?????????????????????????????????????????????????????????????????????
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
		// file ??? bytes
		byte[] bytes = BytesUtils.multipartFileToBytes(file);
		ann.setEventPicture(bytes);
		
		// ??????????????????java bean
		Integer discountId = ann.getDiscountId();
		Discount discount = discountService.findById(discountId);
		// ????????????????????????
		ann.setDiscount(discount);
		discount.setAnnouncementBean(ann);
		// ????????????
		announcementService.update(ann);
		
		mav.setViewName("redirect:/staff/announcement/viewAnnouncement");
		
		return mav;
	}
	

//	@GetMapping("/discount/ajax")
//	public String ajaxPage() {
//		return "ajax-messages";
//	}
	
	/////////////////////////////////////////????????????//////////////////////////////////////////////
	//???????????????????????????
	@RequestMapping("/announcement/showEvents-front")
	public String showAllEventsInFront(Model model) {		
		List<AnnouncementBean> announcements = announcementService.findAllAnnouncement();
		// list???????????????????????? bytes ?????? String
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
	
	@GetMapping("/announcement/showEventsForLengh")
	@ResponseBody
	public List<AnnouncementBean> showAllEventsInFrontForLengh(){		
		List<AnnouncementBean> announcements = announcementService.findAllAnnouncement();
		// list???????????????????????? bytes ?????? String
	
		return announcements;
	}
	
	//?????????????????????????????????
	@GetMapping("/announcement/showEventsDetails-front")
	public ModelAndView showEvents(ModelAndView mav, 
			@RequestParam(name = "id") Integer id) {
		AnnouncementBean announcement = announcementService.findById(id);
		// ?????????????????? bytes ?????? String
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
