package com.coolbreeze.realestate.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
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
        List<Property> propertyList = session.createQuery("from Property "
        		+ "ORDER BY publishedDate DESC").list();
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

	@Override
	public void delete(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("delete Property where id = :id");
		query.setParameter("id", id);
		int result = query.executeUpdate();
	}

	@Override
	public Property find(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Property where id = :id ");
		query.setParameter("id", id);
		Property property = (Property) query.uniqueResult();
		logger.info("Property loaded successfully, Property details="+property);
        return property;
	}

	@Override
	public void addMessage(int id, String message) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("UPDATE Property SET message = :message WHERE id =:id ");
		query.setParameter("id", id);
		query.setParameter("message", message);
		int result = query.executeUpdate();
	}

	@Override
	public List<Property> searchProperty(String city, int bed, int bath, String type) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Property where city = :city and "
				+ "bedroom = :bed and bathroom =:bath and type = :type ");
		query.setParameter("city", city);
		query.setParameter("bed", bed);
		query.setParameter("bath", bath);
		query.setParameter("type", type);
		List<Property> propertyList = query.list();
        for(Property prop : propertyList){
            logger.info("Property List::"+prop);
        }
        return propertyList;
	}

	@Override
	public List<Property> searchPropertyMap(HashMap<String, String> map) {
		Session session = this.sessionFactory.getCurrentSession();
		StringBuilder builder = new StringBuilder("from Property WHERE ");
	    Iterator it = map.entrySet().iterator();
	    while (it.hasNext()) {
	        Map.Entry pair = (Map.Entry)it.next();
	        
	        if((pair.getValue()).equals(""))
	        	continue;
	        if((pair.getValue()).equals("on"))
	        	continue;
	        if((pair.getValue()).equals("0"))
	        	continue;
	        
	        String q =pair.getKey() + " = " +"'"+ pair.getValue()+"'"+ " AND ";
	        builder.append(q);
	    }
	    
	    String queryString = builder.toString();
	    String queryFinal = queryString.substring(0,queryString.length()-4);
	    
	    System.out.println(queryFinal);
	    
		Query query = session.createQuery(queryFinal); 
		
		List<Property> propertyList = query.list();
        for(Property prop : propertyList){
            logger.info("Property List::"+prop);
        }
        return propertyList;
	}

	
	
}
