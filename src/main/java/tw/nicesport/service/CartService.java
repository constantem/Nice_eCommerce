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
import tw.nicesport.model.CartRepository;

@Service
@Transactional  //去讀書
public class CartService {
	
	@Autowired
	private CartRepository cartDao;
//	@Autowired
//	private MemberService memberservice;
	
	
	//創建購物車
//	public void createCart(Member member) {
////		Member member = memberservice.findById(memberId);
////		cartDao.save(member);
//	}
	// insert資料
	public void insert(CartBean cartBean) {
		cartDao.save(cartBean);
	}

	// 用id搜尋
	public CartBean findById(Integer cartId) {
		// Optional前面有 等等註解
		Optional<CartBean> option = cartDao.findById(cartId);
		// option.isPresent() 判斷是否有東西
		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}


	// 用ID刪除
	public void deleteById(Integer cartId) {
		cartDao.deleteById(cartId);
	}

	// 搜尋全部
	public List<CartBean> findAllCart() {
		return cartDao.findAll();
	}

	// 分頁物件page
	public Page<CartBean> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "cartId");

		Page<CartBean> page = cartDao.findAll(pgb);

		return page;
	}

	// 更新資料
	public boolean updateOne(CartBean CartBean) {
		CartBean cartResult = cartDao.save(CartBean);

		if (cartResult != null) {
			return true;
		} else {
			return false;
		}
	}
}