package dtu.captone.alumni.base;

import org.springframework.beans.factory.annotation.Autowired;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.security.UserInfoHandler;

public abstract class AbstractController {

	@Autowired
	protected UserService userService;
	
	@Autowired
	protected UserInfoHandler userInfoHandler;

	protected Member currentUser(String token) {
		return userService.findByToken(token);
	}
}
