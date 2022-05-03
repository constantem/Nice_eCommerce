package tw.nicesport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.ProductWishListBean;
import tw.nicesport.model.ProductWishListRepository;

@Service
public class ProductWishListService {
	
	@Autowired
	private ProductWishListRepository pwRes;

	public void insert(ProductWishListBean myWishListBean) {
		pwRes.save(myWishListBean);
	}
	
	public void deleteWishList(Integer wishListId) {
		pwRes.deleteById(wishListId);
	}
}
