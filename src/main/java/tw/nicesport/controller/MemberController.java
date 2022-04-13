package tw.nicesport.controller;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	
	//新增
	@GetMapping("/form")
	public String memberForm(Model model) {
		model.addAttribute("member", new Member());
		return "member/form";
	}

	@RequestMapping("/add")
	public ModelAndView addMember(ModelAndView mav, @ModelAttribute(name = "member") Member member) {

		System.out.println("firstname->" + member.getFirstname());

		MemberService.insert(member);

		mav.setViewName("member/insertSuccess");

		return mav;
	}

	//查詢全部id
	@GetMapping("/view")
	public String viewAll(Model model) {
		model.addAttribute("view");
		return "member/view";
	}

//	@RequestMapping("/select")
//	public ModelAndView viewMember(ModelAndView view, @ModelAttribute(name = "member") Member member) {
//
////		MemberService.findById(member);
//
//		view.setViewName("member/viewSuccess");
//
//		return view;
//	}
	
	//查詢部分id
	@GetMapping("/users/{id}")
    public ResponseEntity<Member> get(@PathVariable(required = false) Integer id) {
        try {
        	Member product = MemberService.findById(id);
            return new ResponseEntity<Member>(product, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<Member>(HttpStatus.NOT_FOUND);
        }
    }
}
