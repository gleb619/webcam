package org.test.webcam.model.service.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.dao.view.PaymentPolyticViewDao;
import org.test.webcam.model.domain.entity.view.PaymentPolyticView;
import org.test.webcam.util.task.DateCompare;

@Service
@Transactional
public class PaymentPolyticViewService {

	@Autowired
	private PaymentPolyticViewDao paymentpolyticviewDao;

	@Transactional
	public PaymentPolyticView create(PaymentPolyticView data) {
		return paymentpolyticviewDao.create(data);
	}

	@Transactional
	public PaymentPolyticView update(PaymentPolyticView data) {
		return paymentpolyticviewDao.update(data);
	}
	
	@Transactional
	public Boolean delete(Object id) {
		return paymentpolyticviewDao.delete(id);
	}

	@Transactional(readOnly = true)
	public Integer total(ScrollableSettings settings) throws Exception {
		return paymentpolyticviewDao.total(settings);
	}

	@Transactional(readOnly = true)
	public List<PaymentPolyticView> findByExample(PaymentPolyticView example, String delimitter) {
		return paymentpolyticviewDao.findByExample(example, delimitter);
	}
	
	@Transactional(readOnly = true)
	public List<PaymentPolyticView> findByExample2(PaymentPolyticView example, DateCompare type) {
		return paymentpolyticviewDao.findByExample2(example, type);
	}

	@Transactional(readOnly = true)
	public List<PaymentPolyticView> findAll() {
		return paymentpolyticviewDao.findAll(new ScrollableSettings());
	}

	@Transactional(readOnly = true)
	public List<PaymentPolyticView> findAll(ScrollableSettings settings) {
		return paymentpolyticviewDao.findAll(settings);
	}

	@Transactional(readOnly = true)
	public List<PaymentPolyticView> findAllScrollable(ScrollableSettings settings) {
		return paymentpolyticviewDao.findAllScrollable(settings);
	}

	@Transactional(readOnly = true)
	public PaymentPolyticView findById(ScrollableSettings scrollableSettings) {
		return paymentpolyticviewDao.findById(scrollableSettings);
	}
	
	@Transactional(readOnly = true)
	public PaymentPolyticView findById(Object key, Boolean initAll) {
		return paymentpolyticviewDao.findById(key, initAll);
	}
	
	
}
