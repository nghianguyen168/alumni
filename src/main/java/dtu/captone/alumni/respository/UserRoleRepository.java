package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.domain.MemberRole;
import dtu.captone.alumni.domain.Role;

@Repository
public interface UserRoleRepository extends JpaRepository<MemberRole, Integer>, JpaSpecificationExecutor<MemberRole> {

	List<MemberRole> findAll();

	Page<MemberRole> findAll(Specification<MemberRole> spec, Pageable pageable);

	List<MemberRole> findByMember(Member user);

	MemberRole findByRole(Role role);

	@Query(value = "DELETE FROM member_role WHERE user_id = ?", nativeQuery = true)
    @Modifying(clearAutomatically=true, flushAutomatically = true)
    @Transactional
	void deleteAllByUser(int userId);

}
