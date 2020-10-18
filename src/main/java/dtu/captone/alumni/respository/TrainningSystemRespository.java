package dtu.captone.alumni.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Edu_level;
import dtu.captone.alumni.domain.Trainning_system;


@Repository
public interface TrainningSystemRespository  extends JpaRepository<Trainning_system, Integer>{
	Trainning_system findById(int id);
}
