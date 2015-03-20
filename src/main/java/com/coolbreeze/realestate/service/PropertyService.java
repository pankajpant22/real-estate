package com.coolbreeze.realestate.service;

import java.util.List;

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
}
