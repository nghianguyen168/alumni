package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Major;

@Repository
public interface MajorRespository extends JpaRepository<Major, Integer>,JpaSpecificationExecutor<Major> {
	Major findById(int id);
	List<Major> findAll();
}
