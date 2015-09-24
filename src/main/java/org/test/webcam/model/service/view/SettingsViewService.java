package org.test.webcam.model.service.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.view.SettingsViewDao;
import org.test.webcam.model.domain.entity.view.SettingsView;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class SettingsViewService {

	@Autowired
	private SettingsViewDao settingsviewDao;

	@Transactional
	public SettingsView create(SettingsView data) {
		return settingsviewDao.create(data);
	}

	@Transactional
	public SettingsView update(SettingsView data) {
		return settingsviewDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return settingsviewDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return settingsviewDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<SettingsView> findByExample(SettingsView example, String delimitter) {
		return settingsviewDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<SettingsView> findByExample2(SettingsView example, DateCompare type) {
		return settingsviewDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<SettingsView> findAll() {
		return settingsviewDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<SettingsView> findAll(ScrollableSettings settings) {
		return settingsviewDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<SettingsView> findAllScrollable(ScrollableSettings settings) {
		return settingsviewDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public SettingsView findById(ScrollableSettings scrollableSettings) {
		return settingsviewDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public SettingsView findById(Object key, Boolean initAll) {
		return settingsviewDao.findById(key, initAll);
	}
	
	
}
