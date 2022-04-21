package tw.nicesport.config;

import javax.sql.DataSource;

//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

//@Configuration
//@EnableWebSecurity
//public class CustomSecurityConfig extends WebSecurityConfigurerAdapter {
//
//	@Autowired
//	private DataSource securityDataSource;
//	
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.jdbcAuthentication().dataSource(securityDataSource);
//	}
//
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		
//		http
//			.authorizeRequests() // 規定哪些頁面沒登入要擋
//				.antMatchers("/resources/**").permitAll() // 靜態資源不擋
//				.antMatchers("/").permitAll()  // 首頁不擋
//				.anyRequest().authenticated() // 任何頁面沒登入都要擋
//			.and().formLogin() // 登入畫面要客製
//				.loginPage("/login/member") // 登入 jsp 的 controller 轉跳
//				.loginProcessingUrl("/login/member/authenticate") // 登入 jsp 送出表單後的 controller 帳密驗證
//				.permitAll(); // 此客製化登入頁面不需登入
//			
//	}
//
//	
//}
