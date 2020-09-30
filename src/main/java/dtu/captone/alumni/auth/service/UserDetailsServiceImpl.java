package dtu.captone.alumni.auth.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.MemberRole;
import dtu.captone.alumni.model.SecurityUser;
import dtu.captone.alumni.respository.MemberRespository;
import dtu.captone.alumni.respository.UserRoleRepository;


@Transactional
@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private MemberRespository memberRespository;

    @Autowired
    private UserRoleRepository userRoleRepository;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserBuilder builder = null;
        Member member = memberRespository.findByDtuMail(username);
        if (member != null) {

            List<MemberRole> memberRoles = userRoleRepository.findByMember(member);

            List<GrantedAuthority> authorities = buildUserAuthorities(memberRoles);

            SecurityUser securityUser = new SecurityUser(member.getEmail(), member.getPassword(), authorities);
            securityUser.setStatus(member.getEnable());
            return securityUser;
        } else {
            throw new UsernameNotFoundException("User not found.");
        }
    }

    private List<GrantedAuthority> buildUserAuthorities(List<MemberRole> memberRoles) {

        List<GrantedAuthority> authorities = new ArrayList<>(0);
        for (MemberRole memberRole : memberRoles) {
            String role = memberRole.getRole().getName();
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }
}
