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
import tw.nicesport.model.WorkMessages;
import tw.nicesport.model.WorkMessagesRepository;

@Service
@Transactional
public class DiscountService {

	@Autowired
	private DiscountRepository discountDao;
	
	public Discount insert(Discount discount) {
		Discount discountResult = discountDao.save(discount);
		return discountResult;
	}

	
}