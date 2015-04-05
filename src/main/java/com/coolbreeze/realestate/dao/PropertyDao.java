package com.coolbreeze.realestate.dao;

import java.util.HashMap;
import java.util.List;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;


public interface PropertyDao {

	public void addProperty(Property property);
    public List<Property> findAll(int page);
    public List<Property> findAll();
    public Property findOne(int id);
    public List<Property> findByUserId(int userId);
	public void delete(int id);
	public Property find(int id);
	public void addMessage(int id, String message);
	public List<Property> searchProperty(String city, int bed, int bath,String type);
	public List<Property> searchPropertyMap(HashMap<String, String> map);
	public void updateProperty(int id, int s);
	public void updateProperty(int id, int s, String dateSold, int userSoldId);
	public void insertProperty(HashMap<String, String> map);
	public void deactivate(int id);
	public List<Property> searchPropertySort(String sort, String properties);
	
}
