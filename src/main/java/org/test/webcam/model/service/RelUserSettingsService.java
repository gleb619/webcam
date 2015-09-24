package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.RelUserSettingsDao;
import org.test.webcam.model.domain.entity.RelUserSettings;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class RelUserSettingsService {

	@Autowired
	private RelUserSettingsDao relusersettingsDao;

	@Transactional
	public RelUserSettings create(RelUserSettings data) {
		return relusersettingsDao.create(data);
	}

	@Transactional
	public RelUserSettings update(RelUserSettings data) {
		return relusersettingsDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return relusersettingsDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return relusersettingsDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<RelUserSettings> findByExample(RelUserSettings example, String delimitter) {
		return relusersettingsDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<RelUserSettings> findByExample2(RelUserSettings example, DateCompare type) {
		return relusersettingsDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<RelUserSettings> findAll() {
		return relusersettingsDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<RelUserSettings> findAll(ScrollableSettings settings) {
		return relusersettingsDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<RelUserSettings> findAllScrollable(ScrollableSettings settings) {
		return relusersettingsDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public RelUserSettings findById(ScrollableSettings scrollableSettings) {
		return relusersettingsDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public RelUserSettings findById(Object key, Boolean initAll) {
		return relusersettingsDao.findById(key, initAll);
	}
	
	
}
