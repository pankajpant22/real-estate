package com.coolbreeze.realestate.service;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
//import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coolbreeze.realestate.dao.PropertyDao;
import com.coolbreeze.realestate.dao.UserDao;
import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;
import com.coolbreeze.realestate.repository.PropertyRepository;
import com.coolbreeze.realestate.repository.UserRepository;


@Service
@Transactional
public class PropertyService {


	@Autowired
	private PropertyDao propertyDao;
	
//	@Autowired
//	private PropertyRepository propertyRepository;
	
	@Transactional
	public List<Property> findAll(int page){
		return propertyDao.findAll(page);
	}
	
	@Transactional
	public List<Property> findAll(){
		return propertyDao.findAll();
	}

	@Transactional
	public Property findOne(int id) {
		return propertyDao.findOne(id);
	}

//	@Transactional
//	public User findOneWithProperty(int userId) {
//		User user = findOne(userId);
//		List<Property> properties= propertyRepository.findByUser(user);
//		user.setProperties(properties);
//		return user;
//	}

	@Transactional   
	public void save(Property property) {
		propertyDao.addProperty(property);
	}

	@Transactional
	public void delete(int id) {
		propertyDao.delete(id);
	}

	@Transactional
	public Property find(int id) {
		return propertyDao.find(id);
	}

	@Transactional
	public void addMessage(int id, String message) {
		propertyDao.addMessage(id,message);
	}

	@Transactional
	public List<Property> searchProperty(String city, int bed, int bath,String type) {
		return propertyDao.searchProperty(city,bed,bath,type);
	}

	@Transactional
	public List<Property> searchPropertyMap(HashMap<String, String> map) {
		return propertyDao.searchPropertyMap(map);
	}

	@Transactional
	public void updateProperty(int id, int s) {
		propertyDao.updateProperty(id,s);
	}

	@Transactional
	public void updateProperty(int id, int s, String dateSold,int userSoldId) {
		propertyDao.updateProperty(id, s,dateSold,userSoldId);
	}

	@Transactional
	public void insertProperty(HashMap<String, String> map) {
		propertyDao.insertProperty(map);
	}

	@Transactional
	public void deactivate(int id) {
		propertyDao.deactivate(id);
	}

	@Transactional
	public List<Property> searchPropertySort(String sort, String properties) {
		return propertyDao.searchPropertySort(sort,properties);
	}


	
	
}
