package tw.nicesport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Member;
import tw.nicesport.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService MemberService;

	@GetMapping("/")
	public String welcomIndex() {
		return "member/index";
	}
	
	@GetMapping("/form")
	public String memberForm(Model model) {
		model.addAttribute("member",new Member());
		return "member/form";
	}
	
//	//方法1
//	@RequestMapping("/foo")
//	public String m1(Model model) {
//		model.addAttribute("hello", "hello");
//		model.addAttribute("hello2","Hello");
//		return "jsp1";
//	}
//	
//	//方法2
//	@RequestMapping("/foo")
//	public ModelAndView m1(ModelAndView mav) {
//		mav.getModel().put("hello", "Hello");
//		mav.getModel().put("hello2", "Hello2");
//		mav.setViewName("jsp1");
//		return mav;
//	}
	
	@RequestMapping("/add")
	public ModelAndView addMember(ModelAndView mav, @ModelAttribute(name = "member") Member member) {
		
		System.out.println("firstname->"+member.getFirstname());

		MemberService.insert(member);

		mav.setViewName("member/insertSuccess");

		return mav;
	}
}
