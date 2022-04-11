package tw.nicesport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	private MemberService messageService;

	@RequestMapping("/add")
	public ModelAndView addMember(ModelAndView mav, @ModelAttribute(name = "Member") Member msg,
			BindingResult br) {

		if (!br.hasErrors()) {
			messageService.insert(msg);
			Member newMem = new Member();
			mav.getModel().put("Member", newMem);
		}

		Member latestMem = MemberService.getLastest();
		mav.getModel().put("lastMember", latestMem);
		mav.setViewName("addMember");

		return mav;
	}
}
