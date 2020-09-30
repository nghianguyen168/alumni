package dtu.captone.alumni.controller.auth;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import dtu.captone.alumni.auth.service.UserService;
import dtu.captone.alumni.constant.CommonConstants;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.Role;
import dtu.captone.alumni.model.JwtRequest;
import dtu.captone.alumni.model.JwtResponse;
import dtu.captone.alumni.model.ResponseAPI;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("api/admin")
@Api(value = "api.user", description = "User API")
public class APIAuthController extends dtu.captone.alumni.base.AbstractController {
	
    @Autowired
    private dtu.captone.alumni.configs.JwtTokenUtil jwtTokenUtil;

    @Autowired
    @Qualifier("userDetailsService")
    private UserDetailsService userDetailsService;
    
    @Autowired
    private MessageSource messageSource;

    @Autowired
    private UserService userService;
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @SuppressWarnings({"unchecked", "rawtypes"})
	@PostMapping(value =  "/login")
    @ApiOperation(value = "Login", response = Object.class)
    public ResponseAPI search(@RequestBody JwtRequest authenticationRequest,
            HttpServletRequest request,
            HttpServletResponse response,
            @RequestHeader(value = "Authorization", required = false, defaultValue = "") String authorization) throws NoSuchMessageException, Exception {
        log.info("Call API login");
        System.out.println(authenticationRequest.getEmail());
        System.out.println("pass word nè:"+authenticationRequest.getPassword());
        System.out.println(bCryptPasswordEncoder.encode(authenticationRequest.getPassword()));
        Member user = userService.findByDtuMailAndPassword(authenticationRequest.getEmail(), authenticationRequest.getPassword());
       
        if (user == null) {
            throw new Exception(messageSource.getMessage("api.admin.login.wrong", new String[]{}, null), null);
        }
        if(CommonConstants.DEACTIVE.equals(user.getEnable())) {
        	 throw new Exception(messageSource.getMessage("api.admin.login.disabled", new String[]{}, null), null);
        }
        List<Role> roles = new ArrayList<>(user.getRoles() );
        final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getEmail());
        final String token = jwtTokenUtil.generateToken(userDetails);
        
        JwtResponse jwtResponse = new JwtResponse(token);
        String accessToken = jwtResponse.getToken();
        //Update token when login success
        userService.updateToken(accessToken, authenticationRequest.getEmail());
		HashMap resultLogin = new HashMap();
        resultLogin.put("access_token", accessToken);
        user.setPassword("");
        resultLogin.put("user", user);
        resultLogin.put("role", roles);
        request.getSession().setAttribute("userInfo", user);
        request.getSession().setAttribute("roles", roles);
        ResponseAPI responseAPI = new ResponseAPI(HttpStatus.SC_OK, "OK", resultLogin);
        return responseAPI;
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ResponseAPI logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        if(session.getAttribute("userInfo") != null) {
        	Member user =  (Member)session.getAttribute("userInfo");
        	userService.updateToken(null, user.getEmail());
        	session.removeAttribute("userInfo");
        }
        if(session.getAttribute("roles") != null) {
        	session.removeAttribute("roles");
        }
        ResponseAPI responseAPI = new ResponseAPI(HttpStatus.SC_OK, "OK", null);
        return responseAPI;
    }

}

