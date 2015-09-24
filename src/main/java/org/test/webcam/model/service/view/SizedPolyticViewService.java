package org.test.webcam.model.service.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.view.SizedPolyticViewDao;
import org.test.webcam.model.domain.entity.view.SizedPolyticView;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class SizedPolyticViewService {

	@Autowired
	private SizedPolyticViewDao sizedpolyticviewDao;

	@Transactional
	public SizedPolyticView create(SizedPolyticView data) {
		return sizedpolyticviewDao.create(data);
	}

	@Transactional
	public SizedPolyticView update(SizedPolyticView data) {
		return sizedpolyticviewDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return sizedpolyticviewDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return sizedpolyticviewDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<SizedPolyticView> findByExample(SizedPolyticView example, String delimitter) {
		return sizedpolyticviewDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<SizedPolyticView> findByExample2(SizedPolyticView example, DateCompare type) {
		return sizedpolyticviewDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<SizedPolyticView> findAll() {
		return sizedpolyticviewDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<SizedPolyticView> findAll(ScrollableSettings settings) {
		return sizedpolyticviewDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<SizedPolyticView> findAllScrollable(ScrollableSettings settings) {
		return sizedpolyticviewDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public SizedPolyticView findById(ScrollableSettings scrollableSettings) {
		return sizedpolyticviewDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public SizedPolyticView findById(Object key, Boolean initAll) {
		return sizedpolyticviewDao.findById(key, initAll);
	}
	
	
}
