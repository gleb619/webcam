/*
 * 
 */
package org.test.webcam.util.listner;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.Users;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.UsersService;

// TODO: Auto-generated Javadoc
/**
 * The Class ReqServHotelListner.
 */
@Service
public class UsersListner {
	
	/**
	 * Creates the.
	 *
	 * @param item the item
	 * @param sasUser the sas user
	 * @return the req serv hotel
	 */
	public Users create(Users item, SasUser sasUser) {
		item.setPassword(new BCryptPasswordEncoder().encode(item.getPassword()));
		
		return item;
	}
	
	
}
