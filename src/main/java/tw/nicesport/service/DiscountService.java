package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.model.Discount;
import tw.nicesport.model.DiscountRepository;
import tw.nicesport.model.Employee;

@Service
@Transactional
public class DiscountService {

	@Autowired
	private DiscountRepository discountDao;
	
		//新增優惠
		public Discount insert(Discount discount) {
		Discount discountResult = discountDao.save(discount);
		return discountResult;
		}
		
		//修改優惠
		public Discount update(Discount discount) {
		Discount discountResult = discountDao.save(discount);
		return discountResult;
		}
	
		// 查詢ID
		public Discount findById(Integer id) {
		Optional<Discount> option = discountDao.findById(id);

		if (option.isPresent()) {
			return option.get();
		}
		return null;
		}
		
		//找全部
		public List<Discount> findAllMessages(){
			return discountDao.findAll();
		}
		
		//頁面
		public Page<Discount> findByPage(Integer pageNumber){
			Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.ASC, "id");
			
			Page<Discount> page = discountDao.findAll(pgb);
			
			return page;
		}
		
		//找最新訊息
//		public Discount getLastest() {
//			return discountDao.findFirstByOrderByAddedDesc();
//		}
//		
			
		//依ID刪除
		public void deleteById(Integer id) {
			discountDao.deleteById(id);
		}
		
		// 分頁功能
		public Page<Discount> findByPage(Integer pageNumber , Integer size) {
			Pageable pgb = PageRequest.of(pageNumber, size, Sort.Direction.ASC, "discountid");
			Page<Discount> page = discountDao.findAll(pgb);
			return page;
		}
	


	
}