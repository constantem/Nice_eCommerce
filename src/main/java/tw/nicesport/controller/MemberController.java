package tw.nicesport.controller;

import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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

import tw.nicesport.mail.MemberJavaMail;
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
	private MemberJavaMail membermail;

    @Autowired
	private CartService cartService;
  
  	@Autowired
  	private AuthenticationManager authManager;

	@GetMapping("/member")
	public String welcomIndex() {
		return "member/index";
	}

	// ????????????
	@GetMapping("/staff/member/form")
	public String memberForm(Model model) {
		model.addAttribute("member", new Member());
		return "member/form";
	}

	@RequestMapping("/member/add")
	public ModelAndView addMember(ModelAndView mav, @ModelAttribute(name = "member") Member member) {

//		System.out.println("firstname->" + member.getFirstname());
//		===================================================
		CartBean cart = new CartBean();  //??????????????? By:Z???
		cart.setMember(member);//??????????????? By:Z???
		cartService.insert(cart);//??????????????? By:Z???
//		===================================================
		
		memberService.save(member);		
		mav.setViewName("redirect:/staff/member/showAllResult");

		return mav;
	}

	// ??????????????????
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

	// ??????????????????(???????????????????????????)
	@GetMapping("/member/showAllResultDemo")
	public ModelAndView showAllResult(ModelAndView model) {

		List<Member> members = memberService.findAllMember();
		model.getModel().put("members", members);
		model.setViewName("member/showAllResultDemo");
		return model;
	}

	// ????????????
	@GetMapping("/member/delete")
	public ModelAndView deleteMember(ModelAndView mav, @RequestParam("id") Integer member_id) {

		memberService.deleteById(member_id);

		mav.setViewName("redirect:/staff/member/showAllResult");

		return mav;
	}

	// ????????????
	@GetMapping("/member/edit")
	public String editMember(Model model, @RequestParam(name = "id") Integer id) {

		Member member = memberService.findById(id);
		model.addAttribute("member", member);

		return "member/editMember";
	}
	
	@PostMapping("/member/editMember")
	public ModelAndView editMemberPage(ModelAndView mav, @ModelAttribute(name = "Member") Member member,
			BindingResult br) {

		mav.setViewName("member/editMember");

		if (!br.hasErrors()) {
//			https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
			memberService.save(member);
			mav.setViewName("redirect:/staff/member/showAllResult");
		}

		return mav;
	}
	

	// ??????????????????
	@GetMapping("/member/findAllByNameLike")
	public ModelAndView findAllByNameLike(ModelAndView mav, @RequestParam("specificUsername") String specificUsername){
		System.out.println("============================>"+specificUsername);
		List<Member> allMem = memberService.findByUsernameContaining(specificUsername);
		mav.getModel().put("allMem", allMem);
		
		mav.setViewName("member/showMember");
		
		return mav;
	}
	
	// ??????????????????(????????????show???????????????)
	@RequestMapping("/user/myProfileByMemberId")
	public String showPersonalInformation(
			Model model,
			@RequestParam("id") Integer memberid
			) {
		Member member = memberService.findById(memberid);
		model.addAttribute("member", member);
		return "member/personalInformation";
	}
	
	// ????????????(show?????????????????????)
	@PostMapping("/member/editRegister")
	public ModelAndView editRegister(
			ModelAndView mav,
			@RequestParam("lastname") String lastname,
			@RequestParam("firstname") String firstname,
			@RequestParam("phone") String phone,
			@RequestParam("birthdate") String birthdate,
			@RequestParam("gender") String gender,
			@RequestParam("email") String email,
			@RequestParam("address") String address,
			@RequestParam(name = "id") Integer id) {

		Member member = memberService.findById(id);
		member.setLastname(lastname);
		member.setFirstname(firstname);
		member.setGender(gender);
		member.setEmail(email);
		member.setAddress(address);
		member.setBirthdate(birthdate);
		member.setPhone(phone);
		
		memberService.save(member);
		
		mav.setViewName("redirect:/user/myProfileByMemberId?id=" + Integer.valueOf(id));
		
		return mav;
	}
	
	// ????????????(????????????)
	@PostMapping("/member/editRegisterSuccess")
	public ModelAndView editRegisterPage(ModelAndView mav, @ModelAttribute(name = "Member") Member member,
			BindingResult br) {

		mav.setViewName("member/editRegister");

		if (!br.hasErrors()) {
//					https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence.saving-entites
			memberService.save(member);
			mav.setViewName("redirect:/member/editRegister");
		}

		return mav;
	}
	
	// ????????????(??????)
	@GetMapping("/member/register")
	public String memberRegister(Model model) {
		model.addAttribute("member", new Member());

		return "/member/register";
	}

	// ????????????(??????)
	@RequestMapping("/member/registerAdd")
	@ResponseBody
	public String register(
			@ModelAttribute(name = "member") Member member,
			HttpServletRequest request) {

		Member memberRegistered = memberService.save(member);
//		===================================================
		CartBean cart = new CartBean();  //??????????????? By:Z???
		cart.setMember(memberRegistered);//??????????????? By:Z???
		cartService.insert(cart);//??????????????? By:Z???
//		===================================================
		
		
		
//		=============???????????????Session, ???????????????===========
		// ??????????????????
		UsernamePasswordAuthenticationToken token 
		= new UsernamePasswordAuthenticationToken(memberRegistered.getUsername(),memberRegistered.getPassword());
		// ???????????????????????????????????????, ?????????, ????????????
		Authentication auth = authManager.authenticate(token);
		// ????????? session
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(auth);
		HttpSession session = request.getSession(true);
		session.setAttribute("SPRING_SECURITY_CONTEXT", context);
//		===================================================
		
		
		
		return "????????????";
		
//		if(br.hasError()) {
//			return "????????????";
//		}
	}
	
	
	// ???????????? ---------????????????????????????????????????email?????????
	@GetMapping("/member/forget")
	public String forget(){
		return "member/memberCheckEmail";
	}
	
	// ???????????? ---------?????????email?????????????????????????????????email(????????????:????????????)
	@GetMapping("/member/sendMail") 
	@ResponseBody
	public String mail(
			@RequestParam("customerEmail") String customerEmail, 
			@RequestParam("memberId") Integer memberId, 
			HttpSession session){
		
		membermail.sendMail(customerEmail, memberId);
		return "????????????";
	}
	
	// ???????????????????????????
	@GetMapping("/member/findByEmail")
	@ResponseBody
	public Integer findByEmail(@RequestParam("customerEmail") String customerEmail) {
		Member member = memberService.findByEmail(customerEmail);
		if(member == null) {
			return null;
		} else {
			return member.getMemberid();
		}
	}
	
	// ???????????? ---------??????????????????????????????(???member/memberCheckEmail.jsp???)
	
	
	// ???????????????????????????
	@PostMapping("/member/memberCheck")
	public String checkPassword(Model model, String email, @RequestParam(name="password") String password, HttpSession session){
		Member email1 = (Member) session.getAttribute("customerEmail");
		
		System.out.println(email1);
		email1.setPassword(password);
		memberService.save(email1);
//		Member member = memberService.findByEmail(email);
		return "member/memberCheckEmail";
	}
	
	// ???????????? ---------???email???????????????????????????????????????
	@GetMapping("/member/changePasswordForm")
	public String changePasswordForm(Model model, @RequestParam("memberId") Integer memberId) {
		model.addAttribute("memberId", memberId);
		return "login/changePasswordForm";
	}
	
	// ??????????????????????????????
	@PostMapping("/member/changePassword")
	public String changePassword(
			Model model, 
			@RequestParam("memberId") Integer memberId,
			@RequestParam("password") String newPassword,
			HttpServletRequest request) {
		
		// ????????????
		Member member = memberService.changePassword(memberId, newPassword);
		String username = member.getUsername();
		// ??????????????????
		UsernamePasswordAuthenticationToken token 
			= new UsernamePasswordAuthenticationToken(username,newPassword);
		// ???????????????????????????????????????, ?????????, ????????????
		Authentication auth = authManager.authenticate(token);
		// ????????? session
		SecurityContext context = SecurityContextHolder.getContext();
		context.setAuthentication(auth);
		HttpSession session = request.getSession(true);
		session.setAttribute("SPRING_SECURITY_CONTEXT", context);
		return "index";
	}
	
//	//??????1
//	@RequestMapping("/foo")
//	public String m1(Model model) {
//		model.addAttribute("hello", "hello");
//		model.addAttribute("hello2","Hello");
//		return "jsp1";
//	}
//	
//	//??????2
//	@RequestMapping("/foo")
//	public ModelAndView m1(ModelAndView mav) {
//		mav.getModel().put("hello", "Hello");
//		mav.getModel().put("hello2", "Hello2");
//		mav.setViewName("jsp1");
//		return mav;
//	}
}
