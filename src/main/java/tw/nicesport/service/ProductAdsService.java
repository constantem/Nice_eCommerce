package tw.nicesport.service;



import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.ProductAdsBean;
import tw.nicesport.model.ProductAdsRepository;

@Service
@Transactional
public class ProductAdsService {

	@Autowired
	private ProductAdsRepository pAdsRes;

	public ProductAdsBean findFirst() {
		return pAdsRes.findFirstByOrderByIdDesc();
	}

	public void insert(ProductAdsBean prodAdsBean) {
		pAdsRes.save(prodAdsBean);
	}
	
	public void update(ProductAdsBean prodAdsBean) {
		pAdsRes.save(prodAdsBean);
	}

	public void findById(Integer id) {
		pAdsRes.findById(id);
	}
}
