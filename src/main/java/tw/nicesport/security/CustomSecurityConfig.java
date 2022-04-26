package tw.nicesport.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

@Configuration
@EnableWebSecurity
@ComponentScan("tw.nicesport")
public class CustomSecurityConfig {

	@Configuration
	@Order(1)
	public static class MemberSecurityConfig extends WebSecurityConfigurerAdapter {

		@Autowired @Qualifier("memberDetailsService")
		private UserDetailsService memberDetailsService;
		
	    public MemberSecurityConfig() {
	        super();
	    }
		
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(memberDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
		}
	    
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			
			http.antMatcher("/user*/**") // 符合的 URL 才需要考慮 

				.authorizeRequests() 
					.antMatchers("/userLogin*").permitAll()
					.anyRequest().authenticated()
//					.hasRole("USER")
					
				
				.and()
				.formLogin() // 登入畫面要客製
					.loginPage("/userLogin") // 登入 jsp 的 controller 轉跳
					.loginProcessingUrl("/userLoginAuthenticate") // 登入 jsp 送出表單後的 controller 帳密驗證
					.failureUrl("/userLogin?error")
					.permitAll() // 此客製化登入頁面不需登入
		        
				.and()
			    .logout()
		            .logoutUrl("/userLogout")
		            .logoutSuccessUrl("/userLogin?logout")
		            .deleteCookies("JSESSIONID")
		            .permitAll()
		            
				.and()
		        .csrf().disable(); // 若前端用 form 但沒加 csr
				
		}
	}
	
	@Configuration
	@Order(2)
	public static class StaffSecurityConfig extends WebSecurityConfigurerAdapter {
		
		@Autowired @Qualifier("employeeDetailsService")
		private UserDetailsService employeeDetailsService;
		
	    public StaffSecurityConfig() {
	        super();
	    }
		
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(employeeDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
		}
	    
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			
			http.antMatcher("/staff*/**")
					
				.authorizeRequests() 
					.antMatchers("/staffLogin*").permitAll()
					.anyRequest().authenticated()
//					.hasRole("EMPLOYEE")
					
				.and()
				.formLogin() // 登入畫面要客製
					.loginPage("/staffLogin") // 登入 jsp 的 controller 轉跳
					.loginProcessingUrl("/staffLoginAuthenticate") // 登入 jsp 送出表單後的 controller 帳密驗證
					.defaultSuccessUrl("/backstage")
					.failureUrl("/staffLogin?error")
					.permitAll() // 此客製化登入頁面不需登入
		        
				.and()
			    .logout()
		            .logoutUrl("/staffLogout")
		            .logoutSuccessUrl("/staffLogin?logout")
		            .deleteCookies("JSESSIONID")
		            .permitAll()
		            
				.and()
		        .csrf().disable(); // 若前端用 form 但沒加 csrf
				
		}
	}
	

	
}
