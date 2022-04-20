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
import tw.nicesport.dto.MemberDto;
import tw.nicesport.model.Member;
import tw.nicesport.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

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
	public String showOneResult(Model model, @RequestParam(name = "memberid") Integer memberid) {

		Member member = memberService.findById(memberid);
		model.addAttribute("member", member);

		return "member/showOneResult";
	}

	// 查詢全部
	@GetMapping("/member/showAllResult")
	public ModelAndView showAllResult(ModelAndView model) {

		List<Member> members = memberService.findAllMember();
		model.getModel().put("members", members);
		model.setViewName("member/showAllResult");
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
	
//	@PostMapping("/api/postMember")
//	@ResponseBody
//	public List<Member> postMemberApi(@RequestBody MemberDto dto) {
//
//		String text = dto.getMem();
//
//		Member member = new Member();
//		member.setMember_id(null);
//		memberService.save(member);
//
//		Page<Member> page = memberService.findByPage(1);
//
//		List<Member> list = page.getContent();
//
//		return list;
//	}

//	@ResponseBody
//	public List<Member> showSearch(@RequestParam(value="key") String key, Model model){
//		logger.info("key:" + key);
//		List<Member> list = memberService.searchMembers(key);
//		logger.info("查詢結果:" + list.size());
//		return list;
//	}
}
