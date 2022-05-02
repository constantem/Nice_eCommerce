package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import tw.nicesport.model.ProductBean;
import tw.nicesport.model.ProductDao;
import tw.nicesport.model.ProductRepository;
import tw.nicesport.model.StockBean;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductDao pDao;
	
	@Autowired
	private ProductRepository pRes;
	
	public List<ProductBean> findByPriceBetween(String startPrice, String endPrice){
		return pRes.findByPriceBetween( startPrice, endPrice);
	}
	
	public List<ProductBean> findByColor(String color){
		return pRes.findByColor(color);
	}
	
	public List<ProductBean> findBySupplier(String supplier){
		return pRes.findBySupplier(supplier);
	}
	
	public List<ProductBean> findByProductNameLike(String brand){
		String searchContent = "%"+ brand +"%";
		return pRes.findByProductNameLike(searchContent);
	}
	
	
	public List<ProductBean> selectAll() {
		return pDao.selectAll();
	}
	
	public ProductBean insertProduct(ProductBean prodBean) {
		return pDao.insertProduct(prodBean);
	}
	
	
	// JPA
	public void insert(ProductBean prodBean) {
		pRes.save(prodBean);
	}
	
	public boolean UpdateById(Integer product_id, ProductBean p) {
		return pDao.UpdateById(product_id, p);
	}
	
	// JPA
	public void deleteById(Integer product_id) {
		pDao.deleteById(product_id);
	}
	
	public ProductBean queryById(Integer product_id) {
		return pDao.queryById(product_id);
	}
	
	
	public List<ProductBean> findAllProduct() {
		return pRes.findAll();
	}
	
	public List<ProductBean> findTop6ByOrderByCreatedAtDesc() {
		return pRes.findLast6ByOrderByCreatedAtDesc();
	}
	
	
	// JPA SortByprice
	public Page<ProductBean> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.DESC, "price");
		Page<ProductBean> page = pRes.findAll(pgb);
		return page;
	}
	
	// JPA SortByCreatedAt
	public Page<ProductBean> findByPageSortByCreatedAt(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "createdAt");
		Page<ProductBean> page = pRes.findAll(pgb);
		return page;
	}
	
	
	public ProductBean findById(Integer product_id) {
		Optional<ProductBean> option = pRes.findById(product_id);

		if (!option.isEmpty()) {
			return option.get();
		}
		return null;
	}
	

}
