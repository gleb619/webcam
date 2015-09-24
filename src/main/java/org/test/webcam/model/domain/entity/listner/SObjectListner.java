/*
 * 
 */
package org.test.webcam.model.domain.entity.listner;

import java.util.Date;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.test.webcam.model.domain.SObject;
import org.test.webcam.model.domain.entity.Users;
import org.test.webcam.model.domain.entity.secure.User;
import org.test.webcam.util.SecurityUtils;

/**
 * The Class SObjectListner.
 */
public class SObjectListner {

	@PrePersist
	public void prePersist(SObject object){
		if(object.getCreateon() == null){
			object.setCreateon(new Date());
		}
		if(object.getModifyon() == null){
			object.setModifyon(new Date());
		}
		
		if (object instanceof Users) {
			((Users) object).setToken(SecurityUtils.hash(((Users) object).getUsername() + ((Users) object).getPassword()));
			((Users) object).setPassword(new BCryptPasswordEncoder().encode(((Users) object).getPassword()));
		}
		else if (object instanceof User) {
			((User) object).setToken(SecurityUtils.hash(((User) object).getUsername() + ((User) object).getPassword()));
			((User) object).setPassword(new BCryptPasswordEncoder().encode(((User) object).getPassword()));
		}
	}
	
	@PreUpdate
	public void preUpdate(SObject object){
		object.setModifyon(new Date());
	}
	
}
