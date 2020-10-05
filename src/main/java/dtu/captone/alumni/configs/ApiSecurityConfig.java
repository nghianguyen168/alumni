package dtu.captone.alumni.configs;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
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
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class ApiSecurityConfig extends WebSecurityConfigurerAdapter {

	private String tokenKey = "token_key";

	@Autowired
	@Qualifier("userDetailsService")
	private UserDetailsService userDetailsService;

	@Autowired
	@Qualifier("unauthorizedEntryPoint")
	private Http401UnauthorizedEntryPoint unauthorizedEntryPoint;

	@Autowired
	@Qualifier("accessDeniedHandler")
	private AccessDeniedHandler accessDeniedHandler;

	@Autowired
	@Qualifier("authenticationSuccessHandler")
	private AjaxAuthenticationSuccessHandler authenticationSuccessHandler;

	@Autowired
	@Qualifier("ajaxAuthenticationFailureHandler")
	private AjaxAuthenticationFailureHandler authenticationFailureHandler;

	@Autowired
	@Qualifier("ajaxLogoutSuccessHandler")
	private AjaxLogoutSuccessHandler ajaxLogoutSuccessHandler;

	@Autowired
	private JwtRequestFilter jwtRequestFilter;

	@Autowired
	private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private JwtAuthenticationEntryPoint unauthorizedHandler;
	
	@Bean
	public JwtRequestFilter authenticationJwtTokenFilter() {
		return new JwtRequestFilter();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/fonts/**", "/img/**", "/js/**", "/plugins/**", "/sample/**",
				"/admins/**", "/dist/**", "/front/**", "/files/**", "/uploads/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		/*
		 * http.authorizeRequests().and().csrf().disable().formLogin().loginPage(
		 * "/auth/login").permitAll()
		 * .defaultSuccessUrl("/admin/index").failureUrl("/auth/login?msg=Err").and().
		 * logout() .logoutUrl("/auth/logout").logoutSuccessUrl("/api/admin/logout").
		 * invalidateHttpSession(true)
		 * .deleteCookies("JSESSIONID").and().exceptionHandling().accessDeniedPage(
		 * "/error403");
		 */
		  
		  http.authorizeRequests().antMatchers("/resources/**").permitAll();
		  
		  http.authorizeRequests().and().csrf().disable().formLogin().loginPage(
				  "/login").permitAll().defaultSuccessUrl("/home").permitAll().and().logout().logoutUrl("/logout")
		  .logoutSuccessUrl("/home").invalidateHttpSession(true).deleteCookies("JSESSIONID").and().exceptionHandling()
		  .accessDeniedPage(
				  "/error403");

		/*
		 * http.cors().and().csrf().disable().exceptionHandling().
		 * authenticationEntryPoint(unauthorizedHandler).and()
		 * .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).
		 * and().authorizeRequests()
		 * .antMatchers("/auth/login/**").permitAll().antMatchers("/api/admin/login").
		 * permitAll().antMatchers("/resources/**").permitAll().anyRequest()
		 * .authenticated();
		 * 
		 * http.addFilterBefore(authenticationJwtTokenFilter(),
		 * UsernamePasswordAuthenticationFilter.class);
		 */

		/*
		 * http.csrf().disable() // dont authenticate this particular request
		 * .authorizeRequests() .antMatchers("/auth/login", "/resources/**",
		 * "/api/admin/login", "/api/admin/logout").permitAll().and()
		 * .authorizeRequests().antMatchers("/admin/**").permitAll().and()
		 * .exceptionHandling().authenticationEntryPoint(jwtAuthenticationEntryPoint).
		 * and().sessionManagement()
		 * .sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().logout().
		 * deleteCookies(); // Add a filter to validate the tokens with every request
		 * http.addFilterBefore(jwtRequestFilter,
		 * UsernamePasswordAuthenticationFilter.class);
		 * 
		 * http.authorizeRequests().antMatchers("/api/admin/login").permitAll();
		 * http.authorizeRequests().antMatchers("/admin/**").access(
		 * "hasAnyRole('ROLE_MOD','ROLE_ADMIN')");
		 */

	}

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

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
