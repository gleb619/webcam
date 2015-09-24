package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.PhotoDao;
import org.test.webcam.model.domain.entity.Photo;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class PhotoService {

	@Autowired
	private PhotoDao photoDao;

	@Transactional
	public Photo create(Photo data) {
		return photoDao.create(data);
	}

	@Transactional
	public Photo update(Photo data) {
		return photoDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return photoDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return photoDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<Photo> findByExample(Photo example, String delimitter) {
		return photoDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<Photo> findByExample2(Photo example, DateCompare type) {
		return photoDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<Photo> findAll() {
		return photoDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<Photo> findAll(ScrollableSettings settings) {
		return photoDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<Photo> findAllScrollable(ScrollableSettings settings) {
		return photoDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public Photo findById(ScrollableSettings scrollableSettings) {
		return photoDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public Photo findById(Object key, Boolean initAll) {
		return photoDao.findById(key, initAll);
	}
	
	
}
