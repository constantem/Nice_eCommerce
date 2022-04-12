package tw.nicesport.model;


import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	 
	public Employee findFirstByOrderByEmployeeidDesc();
	
}
