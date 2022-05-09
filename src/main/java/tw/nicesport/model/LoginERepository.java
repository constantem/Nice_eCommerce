package tw.nicesport.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LoginERepository extends JpaRepository<Employee, Integer> {
	
	public Employee findFirstByOrderByEmployeeid();
	
	@Query(
		value = 
			"SELECT TOP 3 * "
			+ "FROM Employee "
			+ "WHERE permission = 'EMPLOYEE' "
			+ "ORDER BY employee_id",
		nativeQuery = true)
	public List<Employee> findTop3ByOrderByIdWhereRoleEmployee();
	
	@Query(
		value = 
			"SELECT TOP 1 * "
			+ "FROM Employee "
			+ "WHERE permission = 'ADMIN' ",
		nativeQuery = true)
	public Employee findAdmin();
	
//	public Optional<Employee> findByEmployeeid(Integer id);
}
