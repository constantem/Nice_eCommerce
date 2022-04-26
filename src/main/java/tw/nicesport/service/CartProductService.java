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

import tw.nicesport.model.CartBean;
import tw.nicesport.model.CartProductBean;
import tw.nicesport.model.CartProductRepository;
import tw.nicesport.model.CartRepository;

@Service
@Transactional
public class CartProductService {

	@Autowired
	private CartProductRepository cartProductDao;

	// 新增資料
	public void insert(CartProductBean cartProductBean) {
		cartProductDao.save(cartProductBean);
	}

	// 用ID搜尋
	public CartProductBean findById(Integer cartProductId) {
		Optional<CartProductBean> option = cartProductDao.findById(cartProductId);
		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}


	// 刪除
	public void deleteById(Integer cartProductId) {
		cartProductDao.deleteById(cartProductId);
	}
	
	public void deleteByBean(CartProductBean cartProductBean) {
		cartProductDao.delete(cartProductBean);
	}

	// 更新資料
	public boolean updateOne(CartProductBean cartProductBean) {
		CartProductBean cartResult = cartProductDao.save(cartProductBean);

		if (cartResult != null) {
			return true;
		} else {
			return false;
		}
	}

}