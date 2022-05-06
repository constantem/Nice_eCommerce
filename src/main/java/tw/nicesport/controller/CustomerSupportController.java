package tw.nicesport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.mail.JavaMail;
import tw.nicesport.model.CustomerBean;
import tw.nicesport.service.CustomerService;

@Controller
public class CustomerSupportController {

	@Autowired
	private CustomerService csService;

	@Autowired
	private JavaMail mail;

	@GetMapping("/")
	public String welcomeIndex() {
		return "index";
	}

	// 導去智慧客服畫面
	@GetMapping("/ai")
	public String ai() {

		return "customerSupport/ai";

	}

	// 純寄送email
	@GetMapping("/message/sendMail")
	public String mail(@RequestParam("id") Integer id) {
		mail.SendMail();
		return "Success";
	}


	// 送出表單後查詢單筆資料
	@GetMapping("/message/selectOne")
	public ModelAndView selectOnePage(ModelAndView mav) {
		
		CustomerBean lastMag = csService.findById(null);
		mav.getModel().put("lastMag", lastMag);
		mav.setViewName("customerSupport/selectOne");
		return mav;
	}

	@GetMapping("/message/selectAll")
	public ModelAndView selectAllPage(ModelAndView mav,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {

		Page<CustomerBean> page = csService.findByPage(pageNumber);

//		List<CustomerBean> allCus = csService.findAllCustomer();
		mav.getModel().put("page", page);
//		mav.getModel().put("allCus", allCus);
		mav.setViewName("customerSupport/selectAll");
		return mav;

	}

	// 模糊搜尋
	@GetMapping("/message/findByServiceInfoLike")
	public ModelAndView findByServiceInfoLike(ModelAndView mav, @RequestParam String findByServiceInfoLike) {
		List<CustomerBean> allCus = csService.findByServiceInfoLike(findByServiceInfoLike);

		mav.getModel().put("allCus", allCus);

		mav.setViewName("customerSupport/serviceInfo");

		return mav;

	}

	// 導去輸入表單
	@RequestMapping("/message/form")
	public ModelAndView formPage() {

		// Model and View, view 規定去哪個 jsp, model 裡放去那個 jsp 帶的資料
		ModelAndView mav = new ModelAndView();

		// 空的 java bean, 要塞進 model, 讓 ModelAndView 帶去 jsp
		CustomerBean cs = new CustomerBean();

		mav.getModel().put("CustomerBean", cs); // java bean 塞進 model
		mav.setViewName("customerSupport/form"); // ModelAndView 裡規定去哪個 jsp
		return mav;
	}

	// 寫入資料庫
//	@RequestMapping(value="/message/insert", method=RequestMethod.GET)
//	@GetMapping("/message/insert")
//	@RequestMapping(value="/message/insert", method=RequestMethod.POST)
//	@PostMapping("/message/insert")
	@RequestMapping("/message/insert")
	public ModelAndView insertPage(@ModelAttribute(name = "CustomerBean") CustomerBean cs) {

		cs.setProcessStatus("處理中");
		
		CustomerBean csb = csService.insert(cs); // insert不需有回傳值

		ModelAndView mav = new ModelAndView();
		CustomerBean csResult = csService.findById(csb.getId());
		mav.getModel().put("csResult", csResult);
		mav.setViewName("customerSupport/selectOne");
		return mav;
	}

	// 導去修改畫面
	@GetMapping("/message/editForm{id}")
	public ModelAndView editFormPage(ModelAndView mav, @PathVariable Integer id) {

		mav.getModel().put("id", id);// 抓到修改的對象的id

		mav.getModel().put("customerBean2", new CustomerBean());// 將空物件放進model

		List<CustomerBean> allCus = csService.findAllCustomer();
		mav.getModel().put("allCus", allCus);

		mav.setViewName("customerSupport/editForm");

		return mav;
	}

	// 確認修改
	@GetMapping("/message/edit")
	public ModelAndView editPage(ModelAndView mav, Integer id, @ModelAttribute("customerBean2") CustomerBean csb) {

		// 資料庫修改
		csService.editOne(csb);

		// 資料庫查詢, 查詢完, 給前端
		List<CustomerBean> allCus = csService.findAllCustomer();
		mav.getModel().put("allCus", allCus);
		mav.setViewName("redirect:/message/selectAll");
		return mav;
	}

	@GetMapping("/message/delete{id}")
	public ModelAndView deletePage(ModelAndView mav,@PathVariable Integer id) {
		csService.deleteById(id);

		mav.setViewName("redirect:/message/selectAll");

		return mav;
	}

}