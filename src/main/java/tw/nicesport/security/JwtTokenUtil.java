package tw.nicesport.security;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.function.Function;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import tw.nicesport.model.Member;
//
//@Component
//public class JwtTokenUtil implements Serializable {
//
//	private static final long ACCESS_TOKEN_VALIDITY_SECONDS = 5*60*60;
//	private static final String SIGNING_KEY = "nicesport";
//	
//    public String getUsernameFromToken(String token) {
//        return getClaimFromToken(token, Claims::getSubject);
//    }
//
//    public Date getExpirationDateFromToken(String token) {
//        return getClaimFromToken(token, Claims::getExpiration);
//    }
//
//    public <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
//        final Claims claims = getAllClaimsFromToken(token);
//        return claimsResolver.apply(claims);
//    }
//
//    private Claims getAllClaimsFromToken(String token) {
//        return Jwts.parser()
//                .setSigningKey(SIGNING_KEY)
//                .parseClaimsJws(token)
//                .getBody();
//    }
//
//    private Boolean isTokenExpired(String token) {
//        final Date expiration = getExpirationDateFromToken(token);
//        return expiration.before(new Date());
//    }
//
//    public String generateToken(Member member) {
//        return doGenerateToken(member.getEmail());
//    }
//
//    private String doGenerateToken(String subject) {
//
//        Claims claims = Jwts.claims().setSubject(subject);
//        claims.put("scopes", Arrays.asList(new SimpleGrantedAuthority("ROLE_USER")));
//
//        return Jwts.builder()
//                .setClaims(claims)
//                .setIssuer("https://devglan.com")
//                .setIssuedAt(new Date(System.currentTimeMillis()))
//                .setExpiration(new Date(System.currentTimeMillis() + ACCESS_TOKEN_VALIDITY_SECONDS*1000))
//                .signWith(SignatureAlgorithm.HS256, SIGNING_KEY)
//                .compact();
//    }
//
//    public Boolean validateToken(String token, UserDetails userDetails) {
//        final String username = getUsernameFromToken(token);
//        return (
//                username.equals(userDetails.getUsername())
//                        && !isTokenExpired(token));
//    }
//	
//}