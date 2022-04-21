package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WorkOedersRepository extends JpaRepository<OrdersBean, Integer>{
	
//	List<OrdersBean> findByProductNameLike(String name);
	 
}

