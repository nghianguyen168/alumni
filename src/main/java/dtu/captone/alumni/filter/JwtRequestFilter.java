package dtu.captone.alumni.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.security.UserInfoHandler;


@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    @Autowired
    private  UserService userService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private UserInfoHandler userInfoHandler;


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        final String requestTokenHeader = request.getHeader("Authorization");
        if (!request.getServletPath().contains("login") &&
                !request.getServletPath().contains("logout") &&
                !request.getServletPath().contains("swagger") &&
                !request.getServletPath().contains("api-docs") && 
                !request.getServletPath().contains("resources") && 
                
               
              
                !request.getServletPath().contains("")) {
            Member user = userService.findByToken(requestTokenHeader);
            if (user == null) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN,
                        messageSource.getMessage("api.permission.fail", new String[]{}, null));
                return;
            }
            Member bUser = userInfoHandler.getUser(user);
            if (bUser == null) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN,
                        messageSource.getMessage("api.permission.fail", new String[]{}, null));
                return;
            }
            request.setAttribute("userInfo", bUser);
        }
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "*");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, x-requested-with, X-Custom-Header, X-Access-Token");
        chain.doFilter(request, response);
    }


	public Object sessionManagement() {
		// TODO Auto-generated method stub
		return null;
	}

}