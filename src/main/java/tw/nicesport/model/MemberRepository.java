package tw.nicesport.model;

import java.util.Optional;

//import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	public Member findFirstByOrderByMemberid(); // 會員登入驗證也會用
	
	// 會員登入驗證用
	public Optional<Member> findByUsername(String username);
	
	// 會員登入驗證用
	public Member findByUsernameAndPassword(String username, String password);
//	public List<Member> findAllByNameLike(String key);
}
