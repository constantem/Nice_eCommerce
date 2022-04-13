package tw.nicesport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Member;
import tw.nicesport.service.MemberService;

@Controller
public class MemberPageController {
	@Autowired
	private MemberService MemberService;


//
//	@GetMapping("/member/add")
//	public ModelAndView addMemberPage(ModelAndView mav) {
//
//		Member message = new Member();
//		mav.getModel().put("Member", message);
//
//		Member lastMag = MemberService.getLastest();
//		mav.getModel().put("lastMember", lastMag);
//
//		mav.setViewName("member/addMember");
//		return mav;
//	}
//	
//	@GetMapping("/member/viewMember")
//	public ModelAndView viewMessages(ModelAndView mav,
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//		Member page = MemberService.findById(pageNumber);
//
//		mav.getModel().put("page", page);
//		mav.setViewName("member/viewMember");
//
//		return mav;
//	}
}
