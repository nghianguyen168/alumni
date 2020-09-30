package dtu.captone.alumni.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.respository.MemberRespository;
import dtu.captone.alumni.service.MemberService;
import lombok.extern.log4j.Log4j2;


@Log4j2
@Service("userService")
public class UserServiceImpl implements UserService {
	
    @Autowired
    private MemberRespository memberRespository;
    
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @Override
    public List<Member> findAll() {
        return memberRespository.findAll();
    }

    @Override
    public Page<Member> getAllData(Specification<Member> spec, Pageable pageable) {
        return memberRespository.findAll(spec, pageable);
    }

    @Override
    public int getAllDataCount(Specification<Member> spec) {
        return memberRespository.findAll(spec).size();
    }

    @Override
    public Member findByDtuMail(String username) {
        return memberRespository.findByDtuMail(username);
    }

    @Override
    public Member saveAdmin(Member admin) {
        return memberRespository.save(admin);
    }

    @Override
    public Member findById(int id) {
        return memberRespository.findById(id);
    }

    @Override
    public Member deleteById(int id) {
        return null;
    }

    @Override
    public Member save(Member user) {
    	log.debug("save called");
    	System.out.println("user.getPassword(): "+user.getPassword());
      //  user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        return memberRespository.save(user);
    }
    
    @Override
    public Member findByEmail(String email) {
        return memberRespository.findByDtuMail(email);
    }

    @Override
    public void updateToken(String token, String name) {
         memberRespository.updateToken(token, name);
    }

    @Override
    public Member updateLastUsed(String name) {
        return memberRespository.updateLastUsed(name);
    }

    @Override
    public Member findByToken(String token) {
        return memberRespository.findByToken(token);
    }

	@Override
	public Member findByDtuMailAndPassword(String mail, String password) {
		// TODO Auto-generated method stub
		if (findByEmail(mail) != null) {
			if (bCryptPasswordEncoder.matches(password, findByEmail(mail).getPassword())) {
				password = findByEmail(mail).getPassword();
			}
		}
		return memberRespository.findByEmailAndPassword(mail, password);
	}
}
