package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import tw.nicesport.model.Employee;
import tw.nicesport.model.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeRepository employeeDao;

	// save 新增
	public void insert(Employee employee) {
		employeeDao.save(employee);
	}

	// 查詢ID
	public Employee findById(Integer id) {
		Optional<Employee> option = employeeDao.findById(id);

		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}
	
	// 刪除
	public void deleteById(Integer id) {
		employeeDao.deleteById(id);
	}

	// 查詢All
	public List<Employee> findAllEmp() {
		return employeeDao.findAll();
	}
	
 

	// 分頁功能
	public Page<Employee> findByPage(Integer pageNumber , Integer size) {
		Pageable pgb = PageRequest.of(pageNumber, size, Sort.Direction.ASC, "employeeid");
		Page<Employee> page = employeeDao.findAll(pgb);
		return page;
	}

//		// 由最新資料在上面
	public Employee getLastest() {

		return employeeDao.findFirstByOrderByEmployeeidDesc();
	}
	
	
}