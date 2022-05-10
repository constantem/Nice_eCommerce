package tw.nicesport.security;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.dto.GoogleOAuth2UserInfo;
import tw.nicesport.model.CartBean;
import tw.nicesport.model.CartRepository;
import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;
import tw.nicesport.service.CartService;
import tw.nicesport.service.MemberService;

@Service
public class CustomOidcUserService extends OidcUserService {

    @Autowired
    private MemberRepository memberDao;
     
    @Autowired
	private CartRepository cartDao;

    @Override
    public OidcUser loadUser(OidcUserRequest userRequest) throws OAuth2AuthenticationException {
        OidcUser oidcUser = super.loadUser(userRequest);
        Map attributes = oidcUser.getAttributes();
        GoogleOAuth2UserInfo userInfo = new GoogleOAuth2UserInfo();
        System.out.println("attributes map");
        System.out.println(attributes);
        userInfo.setEmail((String) attributes.get("email"));
        userInfo.setId((String) attributes.get("sub"));
        userInfo.setImageUrl((String) attributes.get("picture"));
        userInfo.setName((String) attributes.get("name"));
        updateUser(userInfo);
        return oidcUser;
    }

    private void updateUser(GoogleOAuth2UserInfo userInfo) {
    	Optional<Member> memberOpt = memberDao.findByEmail(userInfo.getEmail());
    	Member member;
    	if(memberOpt.isPresent()) {
    		member = memberOpt.get();
            member.setEmail(userInfo.getEmail());
            member.setFirstname(userInfo.getName());
        	memberDao.save(member);
    	} else {
    		member = new Member();
            member.setEmail(userInfo.getEmail());
            member.setUsername(userInfo.getId());
            member.setFirstname(userInfo.getName());
            member.setUserType(UserType.google);
        	// 新會員要順便建購物車
            CartBean cart = new CartBean(); 
            // 新購物車並同步 set
            member.setCart(cart);
            cart.setMember(member);
            // 會員新增
        	memberDao.save(member);
    	}

    }
	
}
