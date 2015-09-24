package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.SettingsDao;
import org.test.webcam.model.domain.entity.Settings;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class SettingsService {

	@Autowired
	private SettingsDao settingsDao;

	@Transactional
	public Settings create(Settings data) {
		return settingsDao.create(data);
	}

	@Transactional
	public Settings update(Settings data) {
		return settingsDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return settingsDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return settingsDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<Settings> findByExample(Settings example, String delimitter) {
		return settingsDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<Settings> findByExample2(Settings example, DateCompare type) {
		return settingsDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<Settings> findAll() {
		return settingsDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<Settings> findAll(ScrollableSettings settings) {
		return settingsDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<Settings> findAllScrollable(ScrollableSettings settings) {
		return settingsDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public Settings findById(ScrollableSettings scrollableSettings) {
		return settingsDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public Settings findById(Object key, Boolean initAll) {
		return settingsDao.findById(key, initAll);
	}
	
	
}
