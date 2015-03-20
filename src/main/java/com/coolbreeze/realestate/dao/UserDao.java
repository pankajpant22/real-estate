package com.coolbreeze.realestate.dao;

import java.util.List;

import com.coolbreeze.realestate.entity.User;


public interface UserDao {

	public void addUser(User user);
    public List<User> findAll();
    public User findOne(int id);
	public User findOne(String name);
	public void delete(int userId);
}
