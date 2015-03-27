package com.coolbreeze.realestate.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	@Autowired
    private SessionFactory sessionFactory;
    
	@Override
	public void addUser(User user) {
		Session session = this.sessionFactory.getCurrentSession();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String password = encoder.encode(user.getPassword());
		
		logger.info("Password="+password);
		
		user.setPassword(password);
		user.setEnabled(true);
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

	@Override
	public User findOne(String name) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where userName = :name ");
		query.setParameter("name", name);
		User user = (User) query.uniqueResult();
		logger.info("User loaded successfully, User details="+user);
        return user;
	}

	@Override
	public void delete(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete User where userId = :userId");
		query.setParameter("userId", userId);
		int result = query.executeUpdate();
	}

	@Override
	public void insertRoleBuyer(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("INSERT INTO User_Role (users_userId, roles_id) VALUES (:id, 2) ");
		query.setParameter("id", id);
		int result = query.executeUpdate();
	}

	@Override
	public void insertRoleSeller(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("INSERT INTO User_Role (users_userId, roles_id) VALUES (:id, 3) ");
		query.setParameter("id", id);
		int result = query.executeUpdate();
	}

	@Override
	public boolean updateUser(String email, String randomNum) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("update User set password = :password" +
				" where email = :email");
		query.setParameter("password", randomNum);
		query.setParameter("email", email);
		int result = query.executeUpdate();
		if(result > 0) {
			return true;
		}
		else{
			return false;
		}
	}

}
