package tw.nicesport.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import tw.nicesport.model.Employee;
import tw.nicesport.service.EmployeeService;

//@RestController
//@CrossOrigin(origins = "*")
@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@PostMapping("/save")
	@ResponseBody
	public String addEmployee(ModelAndView mav, @Valid @ModelAttribute(name = "Employee") Employee emp,
			BindingResult br) {

		if (!br.hasErrors()) {
			employeeService.insert(emp);
			Employee newEmp = new Employee();
			mav.getModel().put("Employee", newEmp);
		}

//		Employee latestEmp = employeeService.getLastest();
//
//		mav.getModel().put("lastEmployee", latestEmp);
//
//		mav.setViewName("employee/addemp");

		return "新增成功";
	}

	@GetMapping("/employee/editEmployee")
	public String editEmployee(Model model, @RequestParam(name = "employee_id") Integer id) {
		// 等同於model
		Employee emp = employeeService.findById(id);
		model.addAttribute("employee", emp);

		// 等同於View
		return "editEmployee";
	}

	@PostMapping("employee/editEmployee")
	public ModelAndView editEmployee(ModelAndView mav, @Valid @ModelAttribute(name = "employee") Employee emp,
			BindingResult br) {
		mav.setViewName("editEmployee");
		if (!br.hasErrors()) {
			employeeService.insert(emp);
			mav.setViewName("redirect:/employee/viewEmployee");
		}

		return mav;
	}

	@GetMapping("employee/deleteEmployee")
	public ModelAndView deleteEmployee(ModelAndView mav, @RequestParam(name = "employee_id") Integer id) {

		employeeService.deleteById(id);

		mav.setViewName("redirect:/employee/viewEmployee");

		return mav;
	}

//	@RequestMapping(value="/emp", method=RequestMethod.POST)
//	@ResponseBody
//	public Msg saveEmp(Employee employee) {
//		employeeService.insert(employee);
//		return Msg.success();
//	}

//	@RequestMapping("/emps")
//	@ResponseBody	
//	public PageInfo<Employee> getEmpsWithJson(@RequestParam(value="pageNum", defaultValue="1")Integer pageNum) {
//		//引入分頁插件pagehelper
//		//在startPage後的第一個查詢會變成分頁查詢
//		PageHelper.startPage(pageNum, 5);
//		List<Employee> emps = employeeService.findAllEmp();
//		System.out.print(emps.size());
//		//把查詢結果放到pageInfo裏，這個pagehelper提供的類很好用，封裝了各種我們需要的信息，那個5代表連續現實的頁數
//		Page<Employee> page = new Page<Employee>();
//		page.addAll(emps);
//		PageInfo<Employee> pageInfos = new PageInfo<Employee>(page, 5);
//		System.out.println(pageInfos);
//		return pageInfos;
//	}
//	
	@RequestMapping("/emps")
	@ResponseBody
	//@ResponseBody 把Json格式序列化 轉成java 字串
	public Page<Employee> postEmployeeApi(@RequestParam(name="page", defaultValue="1")Integer pageNumber ,Integer size) {

		Page<Employee> page = employeeService.findByPage(pageNumber,size);

		return page;
	}
	
//	@ResponseBody
//	@PostMapping("/save")
//	public ResponseEntity<Void> saveOrUpdateCompany(@RequestBody Employee employee) {
//		employeeService.insert(employee);
//		return new ResponseEntity<Void>(HttpStatus.OK);
//	}
//	

}
