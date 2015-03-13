package com.coolbreeze.realestate.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.coolbreeze.realestate.entity.Role;


public interface RoleRepository extends JpaRepository<Role, Integer> {
	

}
