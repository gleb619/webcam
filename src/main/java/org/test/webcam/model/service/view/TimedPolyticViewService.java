package org.test.webcam.model.service.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.view.TimedPolyticViewDao;
import org.test.webcam.model.domain.entity.view.TimedPolyticView;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class TimedPolyticViewService {

	@Autowired
	private TimedPolyticViewDao timedpolyticviewDao;

	@Transactional
	public TimedPolyticView create(TimedPolyticView data) {
		return timedpolyticviewDao.create(data);
	}

	@Transactional
	public TimedPolyticView update(TimedPolyticView data) {
		return timedpolyticviewDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return timedpolyticviewDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return timedpolyticviewDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<TimedPolyticView> findByExample(TimedPolyticView example, String delimitter) {
		return timedpolyticviewDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<TimedPolyticView> findByExample2(TimedPolyticView example, DateCompare type) {
		return timedpolyticviewDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<TimedPolyticView> findAll() {
		return timedpolyticviewDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<TimedPolyticView> findAll(ScrollableSettings settings) {
		return timedpolyticviewDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<TimedPolyticView> findAllScrollable(ScrollableSettings settings) {
		return timedpolyticviewDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public TimedPolyticView findById(ScrollableSettings scrollableSettings) {
		return timedpolyticviewDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public TimedPolyticView findById(Object key, Boolean initAll) {
		return timedpolyticviewDao.findById(key, initAll);
	}
	
	
}
