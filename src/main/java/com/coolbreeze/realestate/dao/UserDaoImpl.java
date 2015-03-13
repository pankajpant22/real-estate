package com.coolbreeze.realestate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.coolbreeze.realestate.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	@Autowired
    private SessionFactory sessionFactory;
    
	@Override
	public void addUser(User user) {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(user);
        logger.info("User saved successfully, User Details="+user);
	}

	@Override
	public List<User> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User").list();
        for(User user : userList){
            logger.info("User List::"+user);
        }
        return userList;
	}

	@Override
	public User findOne(int id) {
		Session session = this.sessionFactory.getCurrentSession();      
        User user = (User) session.load(User.class, new Integer(id));
        logger.info("User loaded successfully, User details="+user);
        return user;
	}

}
