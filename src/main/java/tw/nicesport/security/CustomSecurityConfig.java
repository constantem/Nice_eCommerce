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
		
		@Override //using an @Override of a method in the configurer, then the AuthenticationManagerBuilder is only used to build a "local" AuthenticationManager, which is a child of the global one.
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(memberDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
		}
	    
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			
			http
				// 以下規定要被 "前台 security filter" 攔截的 url
				.requestMatchers() 
					.antMatchers("/user*/**")
					.antMatchers("/info*/**") // 前台不需登入驗證的 url
					.antMatchers("/") // 前台首頁
				.and()
				
				// 以下規定被攔截的 url 是否要被驗證擋
				.authorizeRequests() 
					// 以下 url 會被攔截, 但不必被驗證, 被攔截是因為需要 spring security tag
					.antMatchers("/").permitAll() // 前台首頁
					.antMatchers("/info*/**").permitAll()
					
					// 以下 url 為登入相關, 不必被驗證
					.antMatchers("/userLogin*").permitAll()
					
					// 以下 url 為前端請求, 不必被驗證
					.antMatchers("/user/role").permitAll() // 前端對後端的 role 請求
					
					///////////////////////////////////////////////////////
					// 其他符合 "/user*/**" 的 url 需要被驗證, 且角色為 USER //
					///////////////////////////////////////////////////////
					.anyRequest().hasRole("USER") 
				.and()
				
				// 客製登入畫面
				.formLogin() 
					.loginPage("/userLogin") // 登入 jsp 的 controller 轉跳
					.loginProcessingUrl("/userLoginAuthenticate") // 登入 jsp 送出表單後的 controller 帳密驗證
					.failureUrl("/userLogin?error")
				.and()
				
				// 客製登出 URL
			    .logout()
		            .logoutUrl("/userLogout")
		            .logoutSuccessUrl("/userLogin?logout")
		            .invalidateHttpSession(false)
		            .clearAuthentication(true)
		            .deleteCookies("JSESSIONID")
				.and()
				
		        .csrf().disable(); // 若前端用 form 而非 form:form 但沒加 csrf
				
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
			
			http
				// 以下規定要被 "後台 security filter" 攔截的 url
				.requestMatchers() 
					.antMatchers("/staff*/**")
					.antMatchers("/backstage") // 後台首頁
				.and()
				
				// 以下規定被攔截的 url 是否要被驗證擋
				.authorizeRequests() 
					// 以下 url 會被攔截, 但不必被驗證, 被攔截是因為需要 spring security tag
					.antMatchers("/backstage").permitAll() // 後台首頁
					
					// 以下 url 為登入相關, 不必被驗證
					.antMatchers("/staffLogin*").permitAll() // 登入畫面
					
					// 以下 url 為前端請求, 不必被驗證
					.antMatchers("/staff/role").permitAll() // 前端對後端的 role 請求不擋
					
					/////////////////////////////////////////////////////////////////////
					// 其他符合 "/staff*/**" 的 url 需要被驗證, 且角色為 ADMIN 或 EMPLOYEE //
					/////////////////////////////////////////////////////////////////////
					.anyRequest().hasAnyRole("ADMIN", "EMPLOYEE") 
				.and()
				
				// 客製登入畫面
				.formLogin() 
					.loginPage("/staffLogin") // 登入 jsp 的 controller 轉跳
					.loginProcessingUrl("/staffLoginAuthenticate") // 登入 jsp 送出表單後的 controller 帳密驗證
					.defaultSuccessUrl("/backstage")
					.failureUrl("/staffLogin?error")
				.and()
				
				// 客製登出 URL
			    .logout()
		            .logoutUrl("/staffLogout")
		            .logoutSuccessUrl("/staffLogin?logout")
		            .invalidateHttpSession(false)
		            .clearAuthentication(true)
		            .deleteCookies("JSESSIONID")
		            .permitAll()
				.and()
				
		        .csrf().disable(); // 若前端用 form 而非 form:form 但沒加 csrf
				
		}
	}
	

	
}
