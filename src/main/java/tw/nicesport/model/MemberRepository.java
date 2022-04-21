package tw.nicesport.model;

//import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	public Member findFirstByOrderByMemberid();
	
	// 會員登入驗證用
	public Member findByUsername(String username);
	// 會員登入驗證用
	public Member findByUsernameAndPassword(String username, String password);
//	public List<Member> findAllByNameLike(String key);
}
