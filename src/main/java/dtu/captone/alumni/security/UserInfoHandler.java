package dtu.captone.alumni.security;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Role;



@Component
public class UserInfoHandler {
	@Autowired
	private UserService userService;

	@Autowired
	private HttpServletRequest request;

	public Member getUser(Member user) {
		Member userInfo = null;
		if (user != null) {
			userInfo = userService.findByEmail(user.getEmail());
		}
		return userInfo;
	}

	public Member getInfoUser() {
		Member userInfo = null;
		if (request.getAttribute("userInfo") != null) {
			userInfo = (Member) request.getAttribute("userInfo");
		}
		return userInfo;
	}

	public List<Role> getRoles(HttpSession session) {
		List<Role> roles = new ArrayList<>();
		if (session.getAttribute("roles") != null) {
			roles = (List<Role>) session.getAttribute("roles");
		}
		return roles;
	}

	public boolean isAdmin(HttpSession session) {
		for (Role r : getRoles(session)) {
			if ("ROLE_ADMIN".equals(r.getName())) {
				return true;
			}
		}
		return false;
	}

	public boolean isUser(HttpSession session) {
		for (Role r : getRoles(session)) {
			if ("ROLE_USER".equals(r.getName())) {
				return true;
			}
		}
		return false;
	}

	public boolean isGuest(HttpSession session) {
		for (Role r : getRoles(session)) {
			if ("ROLE_GUEST".equals(r.getName())) {
				return true;
			}
		}
		return false;
	}
}
