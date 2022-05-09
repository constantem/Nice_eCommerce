package tw.nicesport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Employee;
import tw.nicesport.service.EmployeeService; 

@Controller
public class EmpPageController {

	@Autowired
	private EmployeeService empService;

	@GetMapping("/employee")
	public String welcomIndex() {
		return "employee/index";
	}
 
	@GetMapping("/employee/add")
	public ModelAndView addEmployeePage(ModelAndView mav) {

		// 新增留言 必須要放一個空的物件 再放到Model裡面
		Employee emp = new Employee();
		// 放到 Model 並傳給畫面
		mav.getModel().put("employee", emp);

		Employee lastEmp = empService.getLastest();
		mav.getModel().put("lastEmployee", lastEmp);

		// 回傳頁面 View
		mav.setViewName("employee/addEmployee");

		return mav;
	}

	// 再了解內容
	@GetMapping("/admin/employee/viewEmployee")
	public ModelAndView viewEmployee(ModelAndView mav,
			@RequestParam(name = "pn", defaultValue = "1") Integer pageNumber) {

		Page<Employee> page = empService.findByPage(pageNumber,5);
		mav.getModel().put("page", page);
		mav.setViewName("employee/viewEmployee");

		return mav;
	}
	
}
