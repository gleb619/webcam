package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.TimedPolyticDao;
import org.test.webcam.model.domain.entity.TimedPolytic;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class TimedPolyticService {

	@Autowired
	private TimedPolyticDao timedpolyticDao;

	@Transactional
	public TimedPolytic create(TimedPolytic data) {
		return timedpolyticDao.create(data);
	}

	@Transactional
	public TimedPolytic update(TimedPolytic data) {
		return timedpolyticDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return timedpolyticDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return timedpolyticDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<TimedPolytic> findByExample(TimedPolytic example, String delimitter) {
		return timedpolyticDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<TimedPolytic> findByExample2(TimedPolytic example, DateCompare type) {
		return timedpolyticDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<TimedPolytic> findAll() {
		return timedpolyticDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<TimedPolytic> findAll(ScrollableSettings settings) {
		return timedpolyticDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<TimedPolytic> findAllScrollable(ScrollableSettings settings) {
		return timedpolyticDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public TimedPolytic findById(ScrollableSettings scrollableSettings) {
		return timedpolyticDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public TimedPolytic findById(Object key, Boolean initAll) {
		return timedpolyticDao.findById(key, initAll);
	}
	
	
}
