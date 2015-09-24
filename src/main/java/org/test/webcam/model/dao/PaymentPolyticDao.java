package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.PaymentPolytic;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class PaymentPolyticDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT pay0 FROM PaymentPolytic pay0";
	private String shortName = "pay0";

	public PaymentPolytic create(PaymentPolytic paymentpolytic) {
		em.persist(paymentpolytic);
		return paymentpolytic;
	}

	public PaymentPolytic update(PaymentPolytic paymentpolytic) {
		return em.merge(paymentpolytic);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, PaymentPolytic.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<PaymentPolytic> findByExample(PaymentPolytic example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				PaymentPolytic.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), PaymentPolytic.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<PaymentPolytic> findByExample2(PaymentPolytic example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, PaymentPolytic.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<PaymentPolytic> findAll(ScrollableSettings settings) {
		List<PaymentPolytic> paymentpolytics = DaoUtil.sasQuery(selectClause, settings,
				PaymentPolytic.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (PaymentPolytic item : paymentpolytics) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (PaymentPolytic item : paymentpolytics) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return paymentpolytics;
	}

	@SuppressWarnings("unchecked")
	public List<PaymentPolytic> findAllScrollable(ScrollableSettings settings) {
		List<PaymentPolytic> paymentpolytics = DaoUtil
				.sasQuery(selectClause, settings, PaymentPolytic.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (PaymentPolytic item : paymentpolytics) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (PaymentPolytic item : paymentpolytics) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return paymentpolytics;
	}

	public PaymentPolytic findById(Object key, Boolean initAll) {
		PaymentPolytic item = em.find(PaymentPolytic.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public PaymentPolytic findById(ScrollableSettings settings) {
		PaymentPolytic item = em.find(PaymentPolytic.class, settings.getId());

		if (settings.getList().size() > 0) {
			item.customInit(item, settings.getList());
		}

		if (settings.getInitDicts()) {
			item.initDicts();
		}

		if (settings.getInitLists()) {
			item.initList();
		}

		return item;
	}

	public Boolean delete(Object id) {
		try {
			em.remove(em.getReference(PaymentPolytic.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
