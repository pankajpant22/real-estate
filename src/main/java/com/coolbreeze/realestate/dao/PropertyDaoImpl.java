package com.coolbreeze.realestate.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	
	private static final int LIMITITEMSPERPAGE = 6;
	
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
		Query query = session.createQuery("from Property "
        		+ "ORDER BY publishedDate DESC");
		List<Property> propertyList = query.list();
        for(Property prop : propertyList){
            logger.info("Property List::"+prop);
        }
        return propertyList;
	}

	@Override
	public List<Property> findAll(int page) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Property Where active = 1 "
        		+ "ORDER BY publishedDate DESC");
		query.setMaxResults(LIMITITEMSPERPAGE);
	    query.setFirstResult(page * LIMITITEMSPERPAGE);
        List<Property> propertyList = query.list();
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
		DateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String current = dateFormat.format(cal.getTime());
		
		Query query = session.createSQLQuery("UPDATE Property SET message = :message, offer = 1,dateOffer = CAST(:dateOffer AS datetime) "
				+ " WHERE id =:id ");
		query.setParameter("id", id);
		query.setParameter("message", message);
		query.setParameter("dateOffer", current);
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
	        
	        if((pair.getKey()=="priceFrom"))
	        {
	        	String q ="price" + " > " +"'"+ pair.getValue()+"'"+ " AND ";
	        	builder.append(q);
	        	continue;
	    	}
	        
	        if((pair.getKey()=="priceTo"))
	        {
	        	String q ="price" + " < " +"'"+ pair.getValue()+"'"+ " AND ";
	        	builder.append(q);
	        	continue;
	    	}
	        
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

	@Override
	public void updateProperty(int id, int s) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("UPDATE Property SET sold = :sold WHERE id =:id ");
		query.setParameter("id", id);
		query.setParameter("sold", s);
		int result = query.executeUpdate();
	}

	@Override
	public void updateProperty(int id, int s, String dateSold, int userSoldId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("UPDATE Property "
				+ "SET sold = :sold,dateSold = CAST(:dateSold AS datetime), user_id=:userSoldId, offer = 0"
				+ " WHERE id =:id ");
		query.setParameter("id", id);
		query.setParameter("sold", s);
		query.setParameter("dateSold", dateSold);
		query.setParameter("userSoldId", userSoldId);
		int result = query.executeUpdate();
	}


	@Override
	public void insertProperty(HashMap<String, String> map, int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		String bed = map.get("bedroom");
		int bedno = Integer.valueOf(bed);
		String bath = map.get("bathroom");
		int bathno = Integer.valueOf(bath);
		String price = map.get("price");
		String priceint= price.replace(",", "");
		int priceno = Integer.valueOf(priceint);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String current = dateFormat.format(date);
		String dateFinal = current.replaceAll("[:\\s-]+", "");
		
		Query query = session.createSQLQuery("INSERT INTO Property "
				+ "(address,city,name,price,published_date,zip,user_id,bathroom,bedroom,description,lat,lng,message,sold,dateSold,type,facility) "
				+ "VALUES (:address,:city,:name,:price,CAST(:current AS datetime),:zip,:userId,:bathroom,:bedroom,:description,"
				+ "CAST(:lat AS DECIMAL(9,6)),CAST(:lng AS DECIMAL(9,6)),NULL,0,NULL,:type,:facility )");
		query.setParameter("address", map.get("address"));
		query.setParameter("city", map.get("city"));
		query.setParameter("name", map.get("name"));
		query.setParameter("price", priceno);
		query.setParameter("current", dateFinal);
		query.setParameter("zip", map.get("zip"));
		query.setParameter("userId", userId);
		query.setParameter("bathroom", bathno);
		query.setParameter("bedroom", bedno);
		query.setParameter("description", map.get("description"));
		query.setParameter("lat",map.get("lat"));
		query.setParameter("lng",map.get("lng"));
		query.setParameter("type", map.get("type"));
		query.setParameter("facility", map.get("facility"));
		int result = query.executeUpdate();
	}

	@Override
	public void deactivate(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("UPDATE Property SET active = 0 WHERE id =:id ");
		query.setParameter("id", id);
		int result = query.executeUpdate();
	}

	@Override
	public List<Property> searchPropertySort(String sort, String properties) {
		String prices = properties;
		String test = prices.substring(0,prices.length()-1);
		String testFinal = test.substring(0);
		
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("Select * from Property "
				+ "where price in (:properties) ORDER BY price "+sort);
		query.setParameter("properties", testFinal);	
		List<Property> propertyList = query.list();
		return propertyList;
	}

	@Override
	public void deactivateOffer(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("UPDATE Property SET offer = 0 WHERE id =:id ");
		query.setParameter("id", id);
		int result = query.executeUpdate();
	}
	
}
