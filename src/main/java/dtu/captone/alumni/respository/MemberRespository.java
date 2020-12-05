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

@Repository
public interface MemberRespository extends JpaRepository<Member, Integer>,JpaSpecificationExecutor<Member>{
	
	List<Member> findAll();

	Page<Member> findAll(Specification<Member> spec, Pageable pageable);

	List<Member> findAll(Specification<Member> spec);

	@Query(value = "SELECT * FROM member WHERE student_id = ?",nativeQuery = true)
	Member findByStudentID(Long studentId);
	
	@Query(value = "UPDATE member SET enable = ? WHERE id = ?",nativeQuery = true)
	@Modifying(clearAutomatically=true, flushAutomatically = true)
	@Transactional
	int active(int active,int id);
	
	Member findById(int id);

	Page<Member> findByHometown(String hometown,Pageable pageable);
	
	@Query(value = "SELECT * FROM member WHERE member_type_id = ?",nativeQuery = true)
	List<Member> findByMemberType(int member_type);
	
	@Query(value = "SELECT * FROM member WHERE enable = 1",nativeQuery = true)
	Page<Member> getListEnable(Pageable page);
	
	@Query(value = "SELECT * FROM member WHERE enable = 1 AND id <> ? ORDER BY id DESC",nativeQuery = true)
	List<Member> findAllEnable(int id);
	
	@Query(value = "SELECT * FROM member WHERE enable = 1 AND kname_id = ? ORDER BY id DESC",nativeQuery = true)
	List<Member> findByKname(int id);
	
	@Query(value = "SELECT * FROM member WHERE member_type_id = ? AND enable = 1",nativeQuery = true)
	Page<Member> getListByTypeEnable(int type,Pageable page);
	
	@Query(value = "SELECT * FROM member WHERE member_type_id = ? ",nativeQuery = true)
	Page<Member> getListByType(int type,Pageable page);
	
	Member findByDtuMail(String email);

	@Query(value = "UPDATE member SET token = ? WHERE dtuMail = ?", nativeQuery = true)
    @Modifying(clearAutomatically=true, flushAutomatically = true)
    @Transactional
	void updateToken(String token, String email);

	@Query(value = "UPDATE member SET last_used = CURRENT_TIMESTAMP() WHERE dtu_mail = ?", nativeQuery = true)
    @Modifying(clearAutomatically=true, flushAutomatically = true)
    @Transactional
	Member updateLastUsed(String dtu_mail);

	Member findByToken(String token);

	@Query(nativeQuery = true, value = "SELECT * from member where dtuMail = ? AND password = ?")
	Member findByEmailAndPassword(String dtu_mail, String password);

	@Query(value = "SELECT * FROM member WHERE enable = 1 AND major_id = ? ORDER BY id DESC",nativeQuery = true)
	List<Member> findByMajor(int id);

	@Query(value = "SELECT * FROM member WHERE enable = 1 AND member_type_id  = ? ORDER BY id DESC",nativeQuery = true)
	List<Member> findByType(int id);

	@Query(value = "SELECT * FROM member WHERE enable = 1 AND Concat(first_name,last_name) LIKE ? ORDER BY id DESC",nativeQuery = true)
	List<Member> findByNameSearch(String name);
	
	
}
