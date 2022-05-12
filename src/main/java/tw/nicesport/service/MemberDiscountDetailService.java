package tw.nicesport.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.model.Discount;
import tw.nicesport.model.Member;
import tw.nicesport.model.MemberDiscountDetailBean;
import tw.nicesport.model.MemberDiscountDetailRepository;
import tw.nicesport.model.MemberRepository;

@Service
@Transactional
public class MemberDiscountDetailService {

	@Autowired
	private MemberDiscountDetailRepository memberDiscountDetailDao;
	
	public List<MemberDiscountDetailBean> findAll(){
		return memberDiscountDetailDao.findAll();
	}
	
	public void deleteById(Integer id) {
		memberDiscountDetailDao.deleteById(id); 
	}
	
	public MemberDiscountDetailBean insert(MemberDiscountDetailBean memberDiscountDetailBean) {
		return memberDiscountDetailDao.save(memberDiscountDetailBean);
	}
	

}
