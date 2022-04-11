package tw.nicesport.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	Member findByUsernameAndPassword(String username, String password);
	
}
