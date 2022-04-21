package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	// 會員登入驗證用
	public Member findByUsername(String username);

}
