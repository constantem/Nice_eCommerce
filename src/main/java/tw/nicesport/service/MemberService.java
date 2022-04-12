package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberDao;

	public void insert(Member member) {
		System.out.println("dao, member->" + member.getFirstname());
		memberDao.save(member);
	}

	public Member findById(Integer id) {
		Optional<Member> option = memberDao.findById(id);

		if (option.isPresent()) {
			return option.get();
		}
		return null;
	}

	public List<Member> findAllMember() {
		return memberDao.findAll();
	}

	public Page<Member> findByAll(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 3, Sort.Direction.DESC, "added");
		Page<Member> page = memberDao.findAll(pgb);

		return page;
	}

	public static Member getLastest() {

		return null;
	}

}
