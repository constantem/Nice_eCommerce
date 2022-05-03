package tw.nicesport.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;

@Service("memberDetailsService")
public class MemberDetailsService implements UserDetailsService {

	@Autowired
	private MemberRepository memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		// 先查出該 entity
		Member member = memberDao.findByUsername(username).orElseThrow(
			()->new UsernameNotFoundException("username not found"));
		
		// 取出等效 spring security username 的欄位
		String usernameForAuth = member.getUsername();
		
		// 取出等效 spring security password 的欄位
		String passwordForAuth = member.getPassword();
				
		// 取出等效 spring security authorities 的欄位
		List<GrantedAuthority> authoritiesForAuth = 
				AuthorityUtils.createAuthorityList("ROLE_USER");
		
		User user = new User(
			usernameForAuth,
			passwordForAuth,
			authoritiesForAuth
		);
		
		return user;
	}

}
