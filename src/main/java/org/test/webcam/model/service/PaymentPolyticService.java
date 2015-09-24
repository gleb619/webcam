package org.test.webcam.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.PaymentPolyticDao;
import org.test.webcam.model.domain.entity.PaymentPolytic;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class PaymentPolyticService {

	@Autowired
	private PaymentPolyticDao paymentpolyticDao;

	@Transactional
	public PaymentPolytic create(PaymentPolytic data) {
		return paymentpolyticDao.create(data);
	}

	@Transactional
	public PaymentPolytic update(PaymentPolytic data) {
		return paymentpolyticDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return paymentpolyticDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return paymentpolyticDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<PaymentPolytic> findByExample(PaymentPolytic example, String delimitter) {
		return paymentpolyticDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<PaymentPolytic> findByExample2(PaymentPolytic example, DateCompare type) {
		return paymentpolyticDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<PaymentPolytic> findAll() {
		return paymentpolyticDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<PaymentPolytic> findAll(ScrollableSettings settings) {
		return paymentpolyticDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<PaymentPolytic> findAllScrollable(ScrollableSettings settings) {
		return paymentpolyticDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public PaymentPolytic findById(ScrollableSettings scrollableSettings) {
		return paymentpolyticDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public PaymentPolytic findById(Object key, Boolean initAll) {
		return paymentpolyticDao.findById(key, initAll);
	}
	
	
}
