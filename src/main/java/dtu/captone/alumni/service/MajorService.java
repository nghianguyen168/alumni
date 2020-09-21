package dtu.captone.alumni.service;

import dtu.captone.alumni.domain.Major;

public interface MajorService {
	Major save(Major major);
	void delelte(int major_id);
}
