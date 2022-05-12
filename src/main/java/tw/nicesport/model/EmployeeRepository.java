package tw.nicesport.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	 
	public Employee findFirstByOrderByEmployeeidDesc();
	
	public Page<Employee> findByEmployeeidNot(Integer id, Pageable pageable);
	
	public List<Employee> findByEmployeeidNot(Integer id);
	
}
