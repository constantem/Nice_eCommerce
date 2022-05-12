package tw.nicesport.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.boot.autoconfigure.security.oauth2.resource.PrincipalExtractor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.oauth2.client.InMemoryOAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.www.BasicAuthenticationEntryPoint;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.savedrequest.RequestCache;

@Configuration
@EnableWebSecurity
@ComponentScan("tw.nicesport")
public class CustomSecurityConfig {

	
	/////////////////////////////////////////
	//                                     //
	//   spring security configuration 1   //
	//                                     //
	/////////////////////////////////////////
	
	@Configuration
	@Order(1)
	public static class AdminSecurityConfig extends WebSecurityConfigurerAdapter {
		
		@Autowired @Qualifier("adminDetailsService")
		private UserDetailsService adminDetailsService;
		
	    public AdminSecurityConfig() {
	        super();
	    }
		
	    // Override 則可建立 "local" AuthenticationManager, 為 a child of global AuthenticationManager
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(adminDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
		}
		
		// Autowired 則可建立 global AuthenticationManager
//		@Autowired
//		public void initialize(AuthenticationManagerBuilder auth) throws Exception {
//			auth.userDetailsService(employeeDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
//		}
		
//		@Bean("adminAuthenticationManagerBean")
//		@Override
//		public AuthenticationManager authenticationManagerBean() throws Exception {
//			return super.authenticationManagerBean();
//		}
		
	    @Autowired
	    @Qualifier("customRequestCache")
	    RequestCache myRequestCache;

	    @Autowired
	    @Qualifier("adminAccessDeniedHandler")
	    AccessDeniedHandler myAccessDeniedHandler;
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			
			http
				// 以下規定要被 "後台 security filter" 攔截的 url
				.requestMatchers() 
					.antMatchers("/admin*/**")
				.and()
				
				// 以下規定被攔截的 url 是否要被驗證擋
				.authorizeRequests() 
					// 以下 url 會被攔截, 但不必被驗證, 被攔截是因為需要 spring security tag
//					.antMatchers("/backstage").hasAnyRole("ADMIN", "EMPLOYEE") // 後台首頁
					
					// 以下 url 為登入相關, 不必被驗證
					.antMatchers("/adminLogin*").permitAll() // 登入畫面
					
					// 以下 url 為前端請求, 不必被驗證
//					.antMatchers("/admin/role").permitAll() // 前端對後端的 role 請求不擋
//					.antMatchers("/admin/fullName").permitAll() // 測試用
					
					/////////////////////////////////////////////////////////////////////
					// 其他符合 "/staff*/**" 的 url 需要被驗證, 且角色為 ADMIN 或 EMPLOYEE //
					/////////////////////////////////////////////////////////////////////
					.anyRequest().hasAnyRole("ADMIN") 
				.and()
				
				// 客製登入畫面
				.formLogin() 
					.loginPage("/adminLogin") // 登入 jsp 的 controller 轉跳
					.loginProcessingUrl("/adminLoginAuthenticate") // 登入 jsp 送出表單後的 controller 帳密驗證
					.defaultSuccessUrl("/backstage")
					.failureUrl("/adminLogin?error")
				.and()
				
				// 客製登出 URL
			    .logout()
		            .logoutUrl("/staffLogout")
		            .logoutSuccessUrl("/backstage")
				.and()

				// 將 BasicAuthenticationFilter instance 加入 filter chain, 這樣進行 authenticate 時, 會套用一些 spring security 預設
				.httpBasic()
					// 客製 AuthenticationEntryPoint instance (cf.The default to use BasicAuthenticationEntryPoint with the realm "Spring Security Application")
					.authenticationEntryPoint(adminAuthenticationEntryPoint())
				.and()
				
		        .csrf().disable(); // 若前端用 form 而非 form:form 但沒加 csrf
			
			// 拒訪處理
	        http
		        .requestCache()
		            .requestCache(myRequestCache)
		        .and()
	        
		        .exceptionHandling()
		            .accessDeniedHandler(myAccessDeniedHandler);
				
		}
		
		// 客製化的 AuthenticationEntryPoint instance, 改了 realm name
	    @Bean
	    public AuthenticationEntryPoint adminAuthenticationEntryPoint(){
	        BasicAuthenticationEntryPoint entryPoint = 
	          new BasicAuthenticationEntryPoint();
	        entryPoint.setRealmName("admin realm");
	        return entryPoint;
	    }
	}
	
	/////////////////////////////////////////
	//                                     //
	//   spring security configuration 2   //
	//                                     //
	/////////////////////////////////////////
	
	@Configuration
	@Order(2)
	public static class StaffSecurityConfig extends WebSecurityConfigurerAdapter {
		
		@Autowired @Qualifier("employeeDetailsService")
		private UserDetailsService employeeDetailsService;
		
	    @Autowired
	    @Qualifier("customRequestCache")
	    RequestCache myRequestCache;

	    @Autowired
	    @Qualifier("employeeAccessDeniedHandler")
	    AccessDeniedHandler myAccessDeniedHandler;
		
	    public StaffSecurityConfig() {
	        super();
	    }
		
	    // Override 則可建立 "local" AuthenticationManager, 為 a child of global AuthenticationManager
		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(employeeDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
		}
		
		// Autowired 則可建立 global AuthenticationManager
//		@Autowired
//		public void initialize(AuthenticationManagerBuilder auth) throws Exception {
//			auth.userDetailsService(employeeDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
//		}
		
//		@Bean("staffAuthenticationManagerBean")
//		@Override
//		public AuthenticationManager authenticationManagerBean() throws Exception {
//			return super.authenticationManagerBean();
//		}
		
//	    @Override
//	    public void configure(WebSecurity web) {
//	    	web.ignoring().antMatchers("/resources/**", "/static/**", "/css/**", "/js/**", "/images/**", "/error", "/dist/**");
//	    }
		
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
					
					// 以下 url 為登出相關, 不必被驗證
					.antMatchers("/staffLogout*").permitAll() // 登入畫面
					
					// 以下 url 為前端請求, 不必被驗證
					.antMatchers("/staff/role").permitAll() // 前端對後端的 role 請求不擋
					.antMatchers("/staff/fullName").permitAll() // 測試用
					
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
		            .logoutSuccessUrl("/backstage")
				.and()

				// 將 BasicAuthenticationFilter instance 加入 filter chain, 這樣進行 authenticate 時, 會套用一些 spring security 預設
				.httpBasic()
					// 客製 AuthenticationEntryPoint instance (cf.The default to use BasicAuthenticationEntryPoint with the realm "Spring Security Application")
					.authenticationEntryPoint(staffAuthenticationEntryPoint())
				.and()
				
		        .csrf().disable(); // 若前端用 form 而非 form:form 但沒加 csrf
			
			// 拒訪處理
	        http
		        .requestCache()
		            .requestCache(myRequestCache)
		        .and()
	        
		        .exceptionHandling()
		            .accessDeniedHandler(myAccessDeniedHandler);
				
		}
		
		// 客製化的 AuthenticationEntryPoint instance, 改了 realm name
	    @Bean
	    public AuthenticationEntryPoint staffAuthenticationEntryPoint(){
	        BasicAuthenticationEntryPoint entryPoint = 
	          new BasicAuthenticationEntryPoint();
	        entryPoint.setRealmName("staff realm");
	        return entryPoint;
	    }
	}
	
	/////////////////////////////////////////
	//                                     //
	//   spring security configuration 3   //
	//                                     //
	/////////////////////////////////////////
	
	@Configuration
	@Order(3)
	public class SecurityConfig extends WebSecurityConfigurerAdapter {
		
	    @Autowired
	    private OidcUserService oidcUserService;
		
//		@Autowired @Qualifier("userAuthenticationManagerBean")
//		private AuthenticationManager authenticationManagerBean;
//		
//		@Override
//		public AuthenticationManager authenticationManagerBean() throws Exception {
//		    return authenticationManagerBean;
//		}
		
//	    @Bean
//	    public JwtAuthenticationFilter authenticationTokenFilterBean() {
//	        return new JwtAuthenticationFilter();
//	    }
	    
//	    @Bean
//	    public PrincipalExtractor principalExtractor() {
//	        return map -> {
//	            System.out.println("Principal extracted.");
//	            User user = new User();
//	            user.setUsername((String)map.get("username"));
//	            return user;
//	        };
//	    }
	    
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	    	
//	    	http.oauth2Login();  //equivalent to @EnableOAuth2Sso
	    	// We've also annotated our configuration class with @EnableOAuthSso which converts our application into an OAuth client and creates the necessary components for it to behave as such.
	    	
			http
				// 以下規定要被 "前台 security filter" 攔截的 url
				.requestMatchers()
					.antMatchers("/google/**","/oauth2/authorization/google","/login/oauth2/code/google")
				.and()
				
				// 以下規定被攔截的 url 是否要被驗證擋
				.authorizeRequests()
					.anyRequest().authenticated()
				.and()
				
				// 第三方驗證
				.oauth2Login() //equivalent to @EnableOAuth2Sso
					.loginPage("/userLogin")
					.failureUrl("/userLogin?error")           
					.userInfoEndpoint()
	            		.oidcUserService(oidcUserService);
			
//	        http
//            	.addFilterBefore(authenticationTokenFilterBean(), UsernamePasswordAuthenticationFilter.class);
	        
	        }
	    

	    
	}
	
	/////////////////////////////////////////
	//                                     //
	//   spring security configuration 4   //
	//                                     //
	/////////////////////////////////////////
	
	@Configuration
	@Order(4)
	public static class MemberSecurityConfig extends WebSecurityConfigurerAdapter {

		@Autowired @Qualifier("memberDetailsService")
		private UserDetailsService memberDetailsService;
		
	    @Autowired
	    @Qualifier("customRequestCache")
	    RequestCache myRequestCache;

	    @Autowired
	    @Qualifier("userAccessDeniedHandler")
	    AccessDeniedHandler myAccessDeniedHandler;
		
	    public MemberSecurityConfig() {
	        super();
	    }
		
	    // Override 則可建立 "local" AuthenticationManager, 為 a child of global AuthenticationManager
		@Override 
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(memberDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
		}
		
		// Autowired 則可建立 global AuthenticationManager
//		@Autowired
//		public void initialize(AuthenticationManagerBuilder auth) throws Exception {
//			auth.userDetailsService(memberDetailsService).passwordEncoder(NoOpPasswordEncoder.getInstance());
//		}
		
		@Bean("userAuthenticationManagerBean")
		@Primary
		@Override
		public AuthenticationManager authenticationManagerBean() throws Exception {
			return super.authenticationManagerBean();
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
					
					// 以下 url 為登入相關, 不必被驗證
					.antMatchers("/userLogout*").permitAll()
					
					
					// 以下 url 為前端請求, 不必被驗證
					.antMatchers("/user/role").permitAll() // 前端對後端的 role 請求
					
					///////////////////////////////////////////////////////
					// 其他符合 "/user*/**" 的 url 需要被驗證, 且角色為 USER //
					///////////////////////////////////////////////////////
					.anyRequest().hasRole("USER") 
//					.anyRequest().permitAll()
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
				.and()
				
				// 將 BasicAuthenticationFilter instance 加入 filter chain, 這樣進行 authenticate 時, 會套用一些 spring security 預設
				.httpBasic()
					// 客製 AuthenticationEntryPoint instance (cf.The default to use BasicAuthenticationEntryPoint with the realm "Spring Security Application")
					.authenticationEntryPoint(userAuthenticationEntryPoint())
				.and()
				
		        .csrf().disable(); // 若前端用 form 而非 form:form 但沒加 csrf
			
			// 拒訪處理
	        http
		        .requestCache()
		            .requestCache(myRequestCache)
		        .and()
		        
		        .exceptionHandling()
		            .accessDeniedHandler(myAccessDeniedHandler);
				
		}
		
		// 客製化的 AuthenticationEntryPoint instance, 改了 realm name
	    @Bean
	    public AuthenticationEntryPoint userAuthenticationEntryPoint(){
	        BasicAuthenticationEntryPoint entryPoint = 
	          new BasicAuthenticationEntryPoint();
	        entryPoint.setRealmName("user realm");
	        return entryPoint;
	    }
	}
}
