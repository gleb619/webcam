package org.test.webcam.model.service.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.view.PhotoViewDao;
import org.test.webcam.model.domain.entity.view.PhotoView;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class PhotoViewService {

	@Autowired
	private PhotoViewDao photoviewDao;

	@Transactional
	public PhotoView create(PhotoView data) {
		return photoviewDao.create(data);
	}

	@Transactional
	public PhotoView update(PhotoView data) {
		return photoviewDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return photoviewDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return photoviewDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<PhotoView> findByExample(PhotoView example, String delimitter) {
		return photoviewDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<PhotoView> findByExample2(PhotoView example, DateCompare type) {
		return photoviewDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<PhotoView> findAll() {
		return photoviewDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<PhotoView> findAll(ScrollableSettings settings) {
		return photoviewDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<PhotoView> findAllScrollable(ScrollableSettings settings) {
		return photoviewDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public PhotoView findById(ScrollableSettings scrollableSettings) {
		return photoviewDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public PhotoView findById(Object key, Boolean initAll) {
		return photoviewDao.findById(key, initAll);
	}
	
	
}
