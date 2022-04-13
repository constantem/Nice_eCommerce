package tw.nicesport.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import tw.nicesport.model.Discount;
import tw.nicesport.model.DiscountRepository;



@Controller
public class DiscountApi {

	@Autowired
	private DiscountRepository dao;
	
	@ResponseBody
	@PostMapping(value = "discount/insert")
	public Discount insertDiscount() {
		Discount dis = new Discount("母親節", "滿888折88", "有門檻", 888, "定額折扣",0,88,"2022-01-01","2022-12-31");
		Discount resDis = dao.save(dis);
		
		return resDis;
	}
	
	@ResponseBody
	@PostMapping(value = "discount/insert2")
	//後端用@RequestBody接JSON
	public Discount insertDiscount(@RequestBody Discount dis) {
		Discount resDis = dao.save(dis);
		return resDis;
	}
	
	@ResponseBody
	@PostMapping(value = "discount/insertAll")
	public List<Discount> insertDiscount(@RequestBody List<Discount> dis) {
		List<Discount> responseList= dao.saveAll(dis);
		return responseList;
		//把JAVA物件轉成JSON字串
	}
	
	@GetMapping(value = "discount/get/{id}")
	//@ResponseBody
	public Discount getDiscountById(@PathVariable Integer id) {
		Optional<Discount> responseDis = dao.findById(id);
		
		//有東西用isPresent()判斷
		if(responseDis.isPresent()) {
			return responseDis.get();
		}
		return null;
	}
	
	//VS{id}一個帶問號一個沒有
	//如果是FORM表格，用@RequestParam抓FORM資料=(HttpServletRequest request)
	@GetMapping(value = "customer/get")
	public Discount getCustomerById2(@RequestParam Integer id) {
		Optional<Discount> responseCus = dao.findById(id);
		
		if(responseCus.isPresent()) {
			return responseCus.get();
		}
		return null;
	}
	
	@GetMapping(value ="discount/page/{pageNumber}")
	public List<Discount> findByPage(@PathVariable Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 4,Sort.Direction.DESC,"id");
		Page<Discount> page = dao.findAll(pgb);
		List<Discount> list = page.getContent();
		return list;
	}
	
	//HQL方法
	//對到DiscountRepository
	@GetMapping(value="discount/findByName")
	public List<Discount> findByName(@RequestParam String name){
		return dao.findDiscountByName(name);
	}
	
	//下原生SQL指令
	@GetMapping(value="discount/findByName2")
	public List<Discount> findByName2(@RequestParam String name){
		return dao.findDiscountByName2(name);
	}
	
	@GetMapping(value="discount/delete/{id}")
	public boolean deleteDiscount(@PathVariable Integer id) {
		dao.deleteDiscountById(id);
		return true;
	}
	
	//對照DiscountRepository
	//因為還很新，正式開發不建議使用
	//其他方法參考講義P.102
	@GetMapping(value="discount/conditionPrice/{conditionPrice}")
	public List<Discount> findByConditionPrice(@PathVariable Integer conditionPrice){
		return dao.findByConditionPriceOrderById(conditionPrice);
	}
	
}
