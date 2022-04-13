package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.model.CustomerBean;
import tw.nicesport.model.CustomerSupportDAO;

@Service
@Transactional //因為這邊沒有寫service，沒有在service開交易，所以要在這邊編寫
public class CustomerService {
	
	@Autowired
	private CustomerSupportDAO dao;
	
	//新增
	public CustomerBean insert(CustomerBean forms) {
		CustomerBean cs = dao.save(forms);
		return cs;
//		return DAO.save(forms); //簡化版，直接回傳帶參數的回傳值
	}
	
	//透過id查詢
	public CustomerBean findById(Integer id)
	{
		Optional<CustomerBean> option = dao.findById(id);
		if(option.isPresent()) {
			return option.get();
		}
		return null;
	}
	
	//一鍵查詢全部
	public List<CustomerBean> findAllCustomer(){
		return dao.findAll();
	}
	
	//建構子
	public CustomerService() {
	}

	//刪除
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}
	
	//修改
	public CustomerBean update(CustomerBean csb) {
		return csb;
	}
	
	//取得最新資料，有排序方式
	public CustomerBean getLastest() {
		return dao.findFirstByOrderByIdDesc();
	}

	
	
}