package com.coolbreeze.realestate.controller;

import org.hibernate.service.spi.InjectService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.coolbreeze.realestate.entity.User;
import com.coolbreeze.realestate.service.UserService;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/applicationContext.xml",
									"file:src/main/webapp/WEB-INF/dispatcher-servlet.xml"
})
@Transactional
public class UserControllerTest {
	
	@Autowired WebApplicationContext wac; 
    @Autowired MockHttpSession session;
    @Autowired MockHttpServletRequest request;
    
    @Autowired
    private UserService userService;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
    }
	
    @Test
    public void registerPageTest() throws Exception {
//        User user = new User();
//        user.setUserName("johnny");

        //session.setAttribute("sessionParm",user);
        this.mockMvc.perform(get("/register"))
        .andExpect(status().isOk())
        .andExpect(view().name("register"));
    }
    
    @Test
    public void getUser() throws Exception {
    	
    	this.mockMvc.perform(get("/users/{userId}", 4))
        .andExpect(status().isOk())
        .andExpect(view().name("users"));
    	
    }



}
