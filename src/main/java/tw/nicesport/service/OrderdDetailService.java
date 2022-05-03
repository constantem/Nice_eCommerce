package tw.nicesport.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import tw.nicesport.model.OrderDetailBean;
import tw.nicesport.model.OrdersDetailRepository;
@Service
public class OrderdDetailService {

	@Autowired
	private OrdersDetailRepository workOrdersDetailDao;

	// insert資料
	public void insert(OrderDetailBean ordersBean) {
		workOrdersDetailDao.save(ordersBean);
	}

	//用orderid搜尋
	public OrderDetailBean findById(Integer orderid) {
		//Optional前面有  等等註解
		Optional<OrderDetailBean> option = workOrdersDetailDao.findById(orderid);
		// option.isPresent() 判斷是否有東西 
		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}
	//用orderid搜尋
//	public List<OrderDetailBean> findAllByOrderId(Integer orderId) {
//		//Optional前面有  等等註解
//		List<OrderDetailBean> option = workOrdersDetailDao.findAllByOrderId(orderId);
//		// option.isPresent() 判斷是否有東西 
////		if (option.isPresent()) {
////			return option.get();
////		}
//		return option;
//	}
	//用ID刪除
	public void deleteById(Integer order_id) {
		workOrdersDetailDao.deleteById(order_id);
	}	
	
	//搜尋全部
	public List<OrderDetailBean> findAllOrders(Integer order_id){
		List<Integer> ids = new ArrayList<>();
		ids.add(order_id);
		List<OrderDetailBean> OrderDetailList = workOrdersDetailDao.findAllById(ids);
		return OrderDetailList;
	}
	
	//分頁物件page
	public Page<OrderDetailBean> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1,10, Sort.Direction.DESC, "createdAt");
		
		Page<OrderDetailBean> page = workOrdersDetailDao.findAll(pgb);
		
		return page;
	}
	

}