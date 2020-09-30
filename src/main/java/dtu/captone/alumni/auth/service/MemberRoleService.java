package dtu.captone.alumni.auth.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.MemberRole;
import dtu.captone.alumni.domain.Role;

import java.util.List;

public interface MemberRoleService {

    List<MemberRole> findAll();

    Page<MemberRole> getAllData(Specification<MemberRole> spec, Pageable pageable);

    List<MemberRole> findByAdmin(Member member);

    MemberRole findByRole(Role role);

    void save(MemberRole MemberRole);

    void deleteAllByAdmin(int adminId);

}
