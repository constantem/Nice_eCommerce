package tw.nicesport.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private static MemberRepository MemberDao;
	
	public void insert(Member data) {
		MemberDao.save(data);
	}
	
	public Member findById(Integer id) {
		Optional<Member> option = MemberDao.findById(id);
		
		if(option.isPresent()) {
			return option.get();
		}
		return null;
	}
	
	public static Member getLastest() {

		return null;
	}

	

}
