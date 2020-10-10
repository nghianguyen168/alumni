package dtu.captone.alumni.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.FollowJob;

@Repository
public interface FollowJobRespository extends JpaRepository<FollowJob, Integer> {

}
