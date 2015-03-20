package com.coolbreeze.realestate.dao;

import java.util.List;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;


public interface PropertyDao {

	public void addProperty(Property property);
    public List<Property> findAll();
    public Property findOne(int id);
    public List<Property> findByUserId(int userId);
	public void delete(int id);
}
