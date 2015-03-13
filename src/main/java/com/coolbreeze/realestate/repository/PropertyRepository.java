package com.coolbreeze.realestate.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;


public interface PropertyRepository extends JpaRepository<Property, Integer> {
	

	List<Property> findByUser(User user);
	
}
