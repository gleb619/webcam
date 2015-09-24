package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.TmUserInfoDao;
import org.test.webcam.model.domain.entity.TmUserInfo;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class TmUserInfoService {

	@Autowired
	private TmUserInfoDao tmuserinfoDao;

	@Transactional
	public TmUserInfo create(TmUserInfo data) {
		return tmuserinfoDao.create(data);
	}

	@Transactional
	public TmUserInfo update(TmUserInfo data) {
		return tmuserinfoDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return tmuserinfoDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return tmuserinfoDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<TmUserInfo> findByExample(TmUserInfo example, String delimitter) {
		return tmuserinfoDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<TmUserInfo> findByExample2(TmUserInfo example, DateCompare type) {
		return tmuserinfoDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<TmUserInfo> findAll() {
		return tmuserinfoDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<TmUserInfo> findAll(ScrollableSettings settings) {
		return tmuserinfoDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<TmUserInfo> findAllScrollable(ScrollableSettings settings) {
		return tmuserinfoDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public TmUserInfo findById(ScrollableSettings scrollableSettings) {
		return tmuserinfoDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public TmUserInfo findById(Object key, Boolean initAll) {
		return tmuserinfoDao.findById(key, initAll);
	}
	
	
}
