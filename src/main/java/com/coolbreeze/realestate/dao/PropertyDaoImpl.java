package com.coolbreeze.realestate.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coolbreeze.realestate.entity.Property;
import com.coolbreeze.realestate.entity.User;

@Repository
public class PropertyDaoImpl implements PropertyDao {

	private static final Logger logger = LoggerFactory.getLogger(PropertyDaoImpl.class);
	 
	@Autowired
    private SessionFactory sessionFactory;
    
	@Override
	public void addProperty(Property property) {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(property);
        logger.info("User saved successfully, User Details="+property);
	}

	@Override
	public List<Property> findAll() {
		Session session = this.sessionFactory.getCurrentSession();
        List<Property> propertyList = session.createQuery("from Property").list();
        for(Property prop : propertyList){
            logger.info("Property List::"+prop);
        }
        return propertyList;
	}

	@Override
	public Property findOne(int id) {
		Session session = this.sessionFactory.getCurrentSession();      
        Property property = (Property) session.load(Property.class, new Integer(id));
        logger.info("Property loaded successfully,  details="+property);
        return property;
	}

	@Override
	public List<Property> findByUserId(int  userId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Property where user_id = :id ");
		query.setParameter("id", userId);
		List<Property> propertyList = query.list(); 
		return propertyList;
	}

}
