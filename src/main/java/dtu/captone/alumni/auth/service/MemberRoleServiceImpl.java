package dtu.captone.alumni.auth.service;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.MemberRole;
import dtu.captone.alumni.domain.Role;
import dtu.captone.alumni.respository.UserRoleRepository;

import java.util.List;

@Log4j2
@Service("userRoleService")
public class MemberRoleServiceImpl implements MemberRoleService {

    @Autowired
    private UserRoleRepository userRoleRepository;

    @Override
    public List<MemberRole> findAll() {
        return userRoleRepository.findAll();
    }

    @Override
    public Page<MemberRole> getAllData(Specification<MemberRole> spec, Pageable pageable) {
        return userRoleRepository.findAll(spec, pageable);
    }

	@Override
	public List<MemberRole> findByAdmin(Member member) {
		// TODO Auto-generated method stub
		return userRoleRepository.findByMember(member);
	}

	@Override
	public MemberRole findByRole(Role role) {
		// TODO Auto-generated method stub
		return userRoleRepository.findByRole(role);
	}

	@Override
	public void save(MemberRole MemberRole) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllByAdmin(int adminId) {
		// TODO Auto-generated method stub
		
	}

   
}
