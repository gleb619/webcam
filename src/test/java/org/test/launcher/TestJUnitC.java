package org.test.launcher;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.config.TestConfig;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.domain.entity.secure.User;
import org.test.webcam.model.domain.entity.secure.UserRole;
import org.test.webcam.model.service.PhotoService;
import org.test.webcam.model.service.secure.UserService;
import org.test.webcam.util.SObjectListner;
import org.test.webcam.util.SObjectUtil;
import org.test.webcam.util.SecurityUtils;
import org.test.webcam.util.task.DeleteTask;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.javafaker.Faker;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader = AnnotationConfigContextLoader.class, classes = {
	TestConfig.class })
//@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false) 
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true) 
@Transactional
@ActiveProfiles("Test")
public class TestJUnitC {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PhotoService photoService;
	
//	@Test
	public void createUser() {
		List<User> list = new ArrayList<User>();
		
		list.add(createUserData("root1", "root1", 1, "ROLE_USER", "ROLE_ADMIN"));
		list.add(createUserData("user1", "user1", 1, "ROLE_USER"));
		
		list.add(createUserData("root2", "root2", 2, "ROLE_USER", "ROLE_ADMIN"));
		list.add(createUserData("user2", "user2", 2, "ROLE_USER"));
		
		list.add(createUserData("root3", "root3", 3, "ROLE_USER", "ROLE_ADMIN"));
		list.add(createUserData("user3", "user3", 3, "ROLE_USER"));
		
		assertNotNull(list.size() == 6);
	}

	private User createUserData(String username, String password, Integer firmId, String... roles) {
		User user = new User(username, password, true);
		
		for (String role : roles) {
			UserRole userRole = new UserRole(user, role);
			user.getUserRole().add(userRole);
		}
		
		user.setFirmid(firmId);
//		user.setToken(SecurityUtils.hash(username + password));
		
		return userService.create(user);
	}
	
	@Test
	public void testTask() {
		System.out.println("TestJUnitC.testTask()");
		DeleteTask deleteTask = null;
		try {
			deleteTask = new DeleteTask(photoService);
			deleteTask.init();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		deleteTask.start();
		
		assertNull(deleteTask);
	}
	
}
