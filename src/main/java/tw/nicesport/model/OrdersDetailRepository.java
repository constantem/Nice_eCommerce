package tw.nicesport.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdersDetailRepository extends JpaRepository<OrderDetailBean, Integer>{
	
//	public OrdersBean findFirstByOrderByAddedDesc();
	
//	public List<OrderDetailBean> findAllByOrderId(Integer orderId);
	
}

