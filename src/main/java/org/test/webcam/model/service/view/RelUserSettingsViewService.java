package org.test.webcam.model.service.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.view.RelUserSettingsViewDao;
import org.test.webcam.model.domain.entity.view.RelUserSettingsView;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class RelUserSettingsViewService {

	@Autowired
	private RelUserSettingsViewDao relusersettingsviewDao;

	@Transactional
	public RelUserSettingsView create(RelUserSettingsView data) {
		return relusersettingsviewDao.create(data);
	}

	@Transactional
	public RelUserSettingsView update(RelUserSettingsView data) {
		return relusersettingsviewDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return relusersettingsviewDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return relusersettingsviewDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<RelUserSettingsView> findByExample(RelUserSettingsView example, String delimitter) {
		return relusersettingsviewDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<RelUserSettingsView> findByExample2(RelUserSettingsView example, DateCompare type) {
		return relusersettingsviewDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<RelUserSettingsView> findAll() {
		return relusersettingsviewDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<RelUserSettingsView> findAll(ScrollableSettings settings) {
		return relusersettingsviewDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<RelUserSettingsView> findAllScrollable(ScrollableSettings settings) {
		return relusersettingsviewDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public RelUserSettingsView findById(ScrollableSettings scrollableSettings) {
		return relusersettingsviewDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public RelUserSettingsView findById(Object key, Boolean initAll) {
		return relusersettingsviewDao.findById(key, initAll);
	}
	
	
}
