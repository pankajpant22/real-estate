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
public class UserService {

//	@Autowired
//	private UserRepository userRepository;
//	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PropertyDao propertyDao;
	
	@Transactional
	public List<User> findAll(){
		return userDao.findAll();
	}

	@Transactional
	public User findOne(int userId) {
		return userDao.findOne(userId);
	}

	@Transactional
	public User findOneWithProperty(int userId) {
		User user = findOne(userId);
		List<Property> properties= propertyDao.findByUserId(userId);
		user.setProperties(properties);
		return user;
	}

	@Transactional   
	public void save(User user) {
		userDao.addUser(user);
	}

	@Transactional
	public User findOneWithProperty(String name) {
		User user = findOne(name);
		return findOneWithProperty(user.getUserId());
	}

	@Transactional
	public User findOne(String name) {
		return userDao.findOne(name);
	}

	@Transactional
	public void delete(int userId) {
		userDao.delete(userId);
	}

	@Transactional
	public void insertIntoRole(int id, String role) {
		 switch (role) 
		 {
         	case "ROLE_BUYER": userDao.insertRoleBuyer(id);
                  			   break;
         	case "ROLE_SELLER": userDao.insertRoleSeller(id);
			   					break;
         }
	}

	@Transactional
	public User findOne(User user) {
		int id = user.getUserId();
		return userDao.findOne(id);
	
	}

	
}
