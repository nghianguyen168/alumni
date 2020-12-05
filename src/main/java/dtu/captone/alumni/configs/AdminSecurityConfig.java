package dtu.captone.alumni.configs;

import javax.servlet.Filter;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;


import dtu.captone.alumni.auth.service.UserDetailsService;
import dtu.captone.alumni.filter.JwtRequestFilter;
import dtu.captone.alumni.security.AjaxAuthenticationFailureHandler;
import dtu.captone.alumni.security.AjaxAuthenticationSuccessHandler;
import dtu.captone.alumni.security.AjaxLogoutSuccessHandler;
import dtu.captone.alumni.security.Http401UnauthorizedEntryPoint;
import io.swagger.models.HttpMethod;
import lombok.extern.java.Log;

@Log
@EnableWebSecurity
@Configuration
public class AdminSecurityConfig extends WebSecurityConfigurerAdapter {



	@Autowired
	private DataSource dataSource;
	

	 
	
		@Configuration
		@Order(1)
	    public class AdminWebSecurityConfig extends WebSecurityConfigurerAdapter {

			@Bean
			public BCryptPasswordEncoder bCryptPasswordEncoder() {
				return new BCryptPasswordEncoder();
			}
			@Override
			public void configure(WebSecurity web) throws Exception {
				web.ignoring().antMatchers("/css/**", "/fonts/**", "/img/**", "/js/**", "/plugins/**", "/sample/**",
						"/admins/**", "/dist/**", "/front/**", "/files/**", "/uploads/**");
			}
			
			
			@Override
			protected void configure(AuthenticationManagerBuilder auth) throws Exception {
				auth.jdbcAuthentication().dataSource(dataSource)
						.usersByUsernameQuery("select dtuMail as username, password,enable from member where dtuMail=?")
						.authoritiesByUsernameQuery("select k.dtuMail as username,concat('ROLE_',v.name) as role from member k inner join role v on v.id = k.role_id where dtuMail=?")
						.passwordEncoder(bCryptPasswordEncoder());
			}
			
		
		 @Override
			protected void configure(HttpSecurity http) throws Exception {
				
				http.csrf().disable().
				authorizeRequests().and().formLogin().loginPage(
							  "/auth/login")
					.usernameParameter("dtumail")
					.passwordParameter("pass").failureUrl("/auth/login?msg=err").loginProcessingUrl("/auth/login")
					.defaultSuccessUrl("/admin/index").and()
					.logout().logoutUrl("/auth/logout").logoutSuccessUrl("/admin/index").invalidateHttpSession(true)
					 .deleteCookies("JSESSIONID").and().exceptionHandling()
					 .accessDeniedPage("/error403").and();
					
			  http.authorizeRequests().antMatchers("/admin/*").access("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')");
			  http.authorizeRequests().antMatchers("/admin/adm/*").access("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')");
			 
		 
	 }
	
	
	}
	/*
	 * @Configuration
	 * 
	 * @Order(2) public class ClientWebSecurityConfig extends
	 * WebSecurityConfigurerAdapter {
	 * 
	 * @Bean public BCryptPasswordEncoder bCryptPasswordEncoder() { return new
	 * BCryptPasswordEncoder(); }
	 * 
	 * @Override public void configure(WebSecurity web) throws Exception {
	 * web.ignoring().antMatchers("/css/**", "/fonts/**", "/img/**", "/js/**",
	 * "/plugins/**", "/sample/**", "/admins/**", "/dist/**", "/front/**",
	 * "/files/**", "/uploads/**"); }
	 * 
	 * @Override protected void configure(AuthenticationManagerBuilder auth) throws
	 * Exception { auth.jdbcAuthentication().dataSource(dataSource)
	 * .usersByUsernameQuery("select dtuMail as username, password,enable from member where dtuMail=?"
	 * )
	 * .authoritiesByUsernameQuery("select k.dtuMail as username,concat('ROLE_',v.name) as role from member  k inner join role v on v.id = k.role_id where dtuMail=?"
	 * ) .passwordEncoder(bCryptPasswordEncoder()); }
	 * 
	 * @Override protected void configure(HttpSecurity http) throws Exception {
	 * 
	 * http.authorizeRequests().and().csrf().disable().formLogin().loginPage(
	 * "/user/login").loginProcessingUrl("/user/login")
	 * .usernameParameter("dtumail") .passwordParameter("pass")
	 * .defaultSuccessUrl("/home").and() .logout().logoutUrl("/logout")
	 * .logoutSuccessUrl("/home").invalidateHttpSession(true)
	 * .deleteCookies("JSESSIONID").and().exceptionHandling()
	 * .accessDeniedPage("/error403");
	 * http.authorizeRequests().antMatchers("/community/**").access(
	 * "hasRole('ROLE_ADMIN')"); // http.headers().frameOptions().disable();
	 * 
	 * 
	 * } }
	 */
	

	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
		db.setDataSource(dataSource);
		return db;
	}

	/**
	 * Remember me config
	 */

}
