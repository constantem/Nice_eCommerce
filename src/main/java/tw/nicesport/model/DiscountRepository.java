package tw.nicesport.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

public interface DiscountRepository extends JpaRepository<Discount, Integer>{

	//Discount findFirstByOrderByAddedDesc();

	@Query("from Discount where name = :name")
	public List<Discount> findDiscountByName(@Param("name") String name);
	
	@Query(value="select*from Discount where name = :name", nativeQuery = true)
	public List<Discount> findDiscountByName2(@Param("name") String name);
	
	@Transactional
	@Modifying
	@Query(value="delete from Discount where id =?1", nativeQuery = true)
	public void deleteDiscountById(Integer id);

	//public Discount findFirstByOrderByAddedDesc();
	
	//public List<Discount> findByLevelOrderByName(Integer level);
}
