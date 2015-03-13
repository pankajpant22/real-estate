package com.coolbreeze.realestate.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.coolbreeze.realestate.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	

}
