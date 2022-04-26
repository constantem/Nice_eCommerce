package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CartProductRepository extends JpaRepository<CartProductBean, Integer>{
	
//	List<OrdersBean> findByProductNameLike(String name);
	 
}

