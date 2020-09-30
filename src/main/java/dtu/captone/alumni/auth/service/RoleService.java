package dtu.captone.alumni.auth.service;

import java.util.List;

import dtu.captone.alumni.domain.Role;

public interface RoleService {

    List<Role> findAll();

    Role findById(int id);

    Role findByName(String name);
}
