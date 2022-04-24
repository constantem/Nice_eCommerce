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

import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberRepository memberDao;

//	public void insert(Member member) {
//		System.out.println("dao, member->" + member.getFirstname());
//		memberDao.save(member);
//	}

	public Member findById(Integer memberid) {
		Optional<Member> option = memberDao.findById(memberid);

		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}

	public List<Member> findAllMember() {
		return memberDao.findAll();
	}

	public void deleteById(Integer memberid) {
		  memberDao.deleteById(memberid);
	}
	
	public Member save(Member member) {
		return memberDao.save(member);
		
	}
	
	public Page<Member> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.ASC, "memberid");
		
		Page<Member> page = memberDao.findAll(pgb);
		
		return page;
	}

	public Member getLastest() {
//		return null;
		
		return memberDao.findFirstByOrderByMemberid();
	}
	
	public List<Member> findByUsernameContaining(String specificUsername){
		return memberDao.findByUsernameContaining(specificUsername);
	}
	
	public List<Member> queryAll(){
		return memberDao.findAll();
	}

}
