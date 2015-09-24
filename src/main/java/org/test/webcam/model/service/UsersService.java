package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.UsersDao;
import org.test.webcam.model.domain.entity.Users;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class UsersService {

	@Autowired
	private UsersDao usersDao;

	@Transactional
	public Users create(Users data) {
		return usersDao.create(data);
	}

	@Transactional
	public Users update(Users data) {
		return usersDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return usersDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return usersDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<Users> findByExample(Users example, String delimitter) {
		return usersDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<Users> findByExample2(Users example, DateCompare type) {
		return usersDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<Users> findAll() {
		return usersDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<Users> findAll(ScrollableSettings settings) {
		return usersDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<Users> findAllScrollable(ScrollableSettings settings) {
		return usersDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public Users findById(ScrollableSettings scrollableSettings) {
		return usersDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public Users findById(Object key, Boolean initAll) {
		return usersDao.findById(key, initAll);
	}
	
	
}
