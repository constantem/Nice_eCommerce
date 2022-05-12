package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.AnnouncementBean;
import tw.nicesport.model.Discount;
import tw.nicesport.model.Member;
import tw.nicesport.model.MemberDiscountDetailBean;
import tw.nicesport.service.AnnouncementService;
import tw.nicesport.service.DiscountService;
import tw.nicesport.service.MemberDiscountDetailService;
import tw.nicesport.service.MemberService;

@Controller
public class DiscountController {
	
	@Autowired
	private DiscountService discountService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberDiscountDetailService memberDiscountDetailService;
	
	@GetMapping("/discount")
	public String welcomIndex() {
		return "discount/index";
	}
	
	@GetMapping("/staff/discount/form")
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
		mav.setViewName("redirect:/staff/discount/viewDiscount");
		return mav;
	}
	
	@GetMapping("discount/deleteDiscount")
	public ModelAndView deleteMessage(ModelAndView mav, @RequestParam(name="id") Integer id) {
		discountService.deleteById(id);
		mav.setViewName("redirect:/staff/discount/viewDiscount");
		return mav;
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
	
	@GetMapping("/staff/discount/viewDiscount")
	public ModelAndView viewMessages(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<Discount> page = discountService.findByPage(pageNumber);
		List<Discount> discounts = page.getContent();
		mav.getModel().put("page", page);
		mav.getModel().put("discounts", discounts);
		mav.setViewName("/discount/viewDiscount");
		System.out.println("page");
		
		return mav;
	}
	
	//跳轉到前台優惠券一覽
	@RequestMapping("/discount/showADs-front")
	public String showAllADsInFront(Model model) {		
		List<Discount> discounts = discountService.queryAll();
		model.addAttribute("discounts", discounts);
		return "discount/showADs-front";
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
		
		mav.setViewName("redirect:/staff/discount/viewDiscount");
		
		return mav;
	}
	
	// 我的優惠券
	@RequestMapping("/user/myDiscountByMemberId")
	public ModelAndView showMyDiscount(
			ModelAndView mav,
			@RequestParam("memberId") Integer memberId) {
		// 接 memberId, 回傳 Discount list
		List<Discount> discounts = discountService.findAllDiscountListByMemberId(memberId);
		List<Member> members = memberService.findAllMember();
		Member member  = memberService.findById(memberId);
		mav.getModel().put("discounts", discounts);
		mav.getModel().put("memberId",memberId);
		for(Discount discount : discounts) {
			System.out.println(discount.getName());
		}
		
		mav.setViewName("discount/myDiscount");
		
		return mav;
	}
	
	@RequestMapping("/user/addToMyDiscountByMemberId")
	public ModelAndView showMyDiscount(
			ModelAndView mav,
			@RequestParam("memberId") Integer memberId,
			@RequestParam("discountId") Integer discountId) {
		
		// 要去的 jsp
		// 找 discount
		Discount discount = discountService.findById(discountId);
		// 從 discount 找 announcement id
		AnnouncementBean announcement = discount.getAnnouncementBean();
		mav.addObject("announcement",announcement);
		mav.setViewName("discount/showEventsDetails-front");
		
		if(discount.getCurrentQuantity()==0) {
			mav.getModel().put("addDiscountresult", "優惠券沒了");
			return mav;
		}
		
		// 接 memberId, 回傳 Discount list
		Set<MemberDiscountDetailBean> memberDiscountDetailBeanSet = discountService.findAllByMemberId(memberId);
		
		// 若優惠券已存在, 回傳訊息並跳出
		for(MemberDiscountDetailBean memberDiscountDetailBean : memberDiscountDetailBeanSet) {
			if(memberDiscountDetailBean.getDiscount().getId()==discountId) {
				mav.getModel().put("addDiscountresult", "已領過");
				return mav;
			}
		}

		// 若優惠券不存在, 新增, 先找 member 與 discount
		
		// 扣優惠券數量
		discount.setCurrentQuantity( discount.getCurrentQuantity()-1 );
		Discount discountUpdated = discountService.update(discount);
		
		// 找 member
		Member member = memberService.findById(memberId);
		
		// 新增
		// MemberDiscountDetail 的 java bean 與 Member java bean 的新增同步 
		MemberDiscountDetailBean newMemberDiscountDetailBean = new MemberDiscountDetailBean();
		newMemberDiscountDetailBean.setMember(member);
		newMemberDiscountDetailBean.setDiscount(discountUpdated);
		
		// 另一向同步
		member.getMemberDiscountDetailBeanSet().add(newMemberDiscountDetailBean);
		discountUpdated.getMemberDiscountDetailBeanSet().add(newMemberDiscountDetailBean);
		
		// 真的去新增
		memberDiscountDetailService.insert(newMemberDiscountDetailBean);
		mav.getModel().put("addDiscountresult", "領取成功");
		
		return mav;
	}
	
	
	
	
//	@GetMapping("/discount/ajax")
//	public String ajaxPage() {
//		return "ajax-messages";
//	}
	

}