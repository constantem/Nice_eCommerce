package tw.nicesport.controller;

import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.classic.Logger;
import tw.nicesport.model.CartBean;
import tw.nicesport.model.Member;
import tw.nicesport.service.CartService;
import tw.nicesport.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;

	@GetMapping("/member")
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

	// 新增
	@GetMapping("/member/form")
	public String memberForm(Model model) {
		model.addAttribute("member", new Member());
		return "member/form";
	}

	@RequestMapping("/member/add")
	public ModelAndView addMember(ModelAndView mav, @ModelAttribute(name = "member") Member member) {

//		System.out.println("firstname->" + member.getFirstname());
//		===================================================
		CartBean cart = new CartBean();  //新增購物車 By:Z功
		cart.setMember(member);//新增購物車 By:Z功
		cartService.insert(cart);//新增購物車 By:Z功
//		===================================================
		
		memberService.save(member);		
		mav.setViewName("member/insertSuccess");

		return mav;
	}

	// 查詢部分
	@GetMapping("/member/searchOne")
	public String searchOne(Model model) {

		model.addAttribute("member", new Member());

		return "member/searchOne";
	}

	@PostMapping("/member/showOneResult")
	public String showOneResult(Model model, Integer memberid) {

		Member member = memberService.findById(memberid);
		model.addAttribute("member", member);

		return "member/showOneResult";
	}

	// 查詢全部
	@GetMapping("/member/showAllResultDemo")
	public ModelAndView showAllResult(ModelAndView model) {

		List<Member> members = memberService.findAllMember();
		model.getModel().put("members", members);
		model.setViewName("member/showAllResultDemo");
		return model;
	}

	// 刪除
	@GetMapping("/member/delete")
	public ModelAndView deleteMember(ModelAndView mav, @RequestParam("id") Integer member_id) {

		memberService.deleteById(member_id);

		mav.setViewName("redirect:/member/showAllResult");

		return mav;
	}

	// 修改
	@GetMapping("/member/edit")
	public String editMember(Model model, @RequestParam(name = "id") Integer id) {

		Member member = memberService.findById(id);
		model.addAttribute("member", member);

		return "member/editMember";
	}
	
	@PostMapping("member/editMember")
	public ModelAndView editMemberPage(ModelAndView mav, @ModelAttribute(name = "Member") Member member,
			BindingResult br) {

		mav.setViewName("member/editMember");

		if (!br.hasErrors()) {
//			https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
			memberService.save(member);
			mav.setViewName("redirect:/member/showAllResult");
		}

		return mav;
	}
	

	// 模糊搜尋
	@GetMapping("member/findAllByNameLike")
	public ModelAndView findAllByNameLike(ModelAndView mav, @RequestParam("specificUsername") String specificUsername){
		System.out.println("============================>"+specificUsername);
		List<Member> allMem = memberService.findByUsernameContaining(specificUsername);
		mav.getModel().put("allMem", allMem);
		
		mav.setViewName("member/showMember");
		
		return mav;
	}
	
	// 前台個人資料
	@RequestMapping("/user/myProfileByMemberId")
	public String showPersonalInformation(
			@RequestParam("id") Integer memberid,
			Model model) {
		Member member = memberService.findById(memberid);
		model.addAttribute("member", member);
		return "member/personalInformation";
	}
	
	// 前台註冊
	@GetMapping("/member/register")
	public String memberRegister(Model model) {
		model.addAttribute("member", new Member());
		return "member/register";
	}

	@RequestMapping("/member/registerAdd")
	public ModelAndView register(ModelAndView mav, @ModelAttribute(name = "member") Member member) {

		memberService.save(member);
//		===================================================
		CartBean cart = new CartBean();  //新增購物車 By:Z功
		cart.setMember(member);//新增購物車 By:Z功
		cartService.insert(cart);//新增購物車 By:Z功
//		===================================================
		mav.setViewName("member/registerSuccess");

		return mav;
	}
}
