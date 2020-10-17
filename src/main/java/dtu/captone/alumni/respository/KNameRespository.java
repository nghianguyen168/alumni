package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.Major;

@Repository
public interface KNameRespository extends JpaRepository<Kname, Integer>,JpaSpecificationExecutor<Major> {
	Kname findById(int id);
	List<Kname> findAll();
}
