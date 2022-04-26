package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdersRepository extends JpaRepository<OrdersBean, Integer>{
	
//	List<OrdersBean> findByProductNameLike(String name);
	 
}

