package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.SizedPolyticDao;
import org.test.webcam.model.domain.entity.SizedPolytic;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class SizedPolyticService {

	@Autowired
	private SizedPolyticDao sizedpolyticDao;

	@Transactional
	public SizedPolytic create(SizedPolytic data) {
		return sizedpolyticDao.create(data);
	}

	@Transactional
	public SizedPolytic update(SizedPolytic data) {
		return sizedpolyticDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return sizedpolyticDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return sizedpolyticDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<SizedPolytic> findByExample(SizedPolytic example, String delimitter) {
		return sizedpolyticDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<SizedPolytic> findByExample2(SizedPolytic example, DateCompare type) {
		return sizedpolyticDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<SizedPolytic> findAll() {
		return sizedpolyticDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<SizedPolytic> findAll(ScrollableSettings settings) {
		return sizedpolyticDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<SizedPolytic> findAllScrollable(ScrollableSettings settings) {
		return sizedpolyticDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public SizedPolytic findById(ScrollableSettings scrollableSettings) {
		return sizedpolyticDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public SizedPolytic findById(Object key, Boolean initAll) {
		return sizedpolyticDao.findById(key, initAll);
	}
	
	
}
