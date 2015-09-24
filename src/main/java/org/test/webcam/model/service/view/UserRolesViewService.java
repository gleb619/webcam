package org.test.webcam.model.service.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.view.UserRolesViewDao;
import org.test.webcam.model.domain.entity.view.UserRolesView;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class UserRolesViewService {

	@Autowired
	private UserRolesViewDao userrolesviewDao;

	@Transactional
	public UserRolesView create(UserRolesView data) {
		return userrolesviewDao.create(data);
	}

	@Transactional
	public UserRolesView update(UserRolesView data) {
		return userrolesviewDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return userrolesviewDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return userrolesviewDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<UserRolesView> findByExample(UserRolesView example, String delimitter) {
		return userrolesviewDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<UserRolesView> findByExample2(UserRolesView example, DateCompare type) {
		return userrolesviewDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<UserRolesView> findAll() {
		return userrolesviewDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<UserRolesView> findAll(ScrollableSettings settings) {
		return userrolesviewDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<UserRolesView> findAllScrollable(ScrollableSettings settings) {
		return userrolesviewDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public UserRolesView findById(ScrollableSettings scrollableSettings) {
		return userrolesviewDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public UserRolesView findById(Object key, Boolean initAll) {
		return userrolesviewDao.findById(key, initAll);
	}
	
	
}
