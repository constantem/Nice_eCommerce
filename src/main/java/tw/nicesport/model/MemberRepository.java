package tw.nicesport.model;

import java.util.Optional;
//import java.util.List;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	// 分頁用
	public Member findFirstByOrderByMemberid();
		
	// 模糊搜尋用
//	@Query(value="select * from Member where username like CONCAT('%',:findAllByNameLike,'%')",nativeQuery=true)
	public List<Member> findByUsernameContaining(String username);
	// 用Containing 可不用 + "%"
  
	// 會員登入驗證用
	public Optional<Member> findByUsername(String username);

  	// 會員登入驗證用
//	public Member findByUsername(String username);

	// 會員登入驗證用
	public Member findByUsernameAndPassword(String username, String password);

	// 從email抓密碼修改用
	// 第三方登入也會用到
	public Optional<Member> findByEmail(String email);
	
	// 冠陞使用, 前台登入一鍵輸入
	public List<Member> findTop3ByOrderByMemberid();
}
