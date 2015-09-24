package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.PaymentPolyticView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class PaymentPolyticViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT pay0 FROM PaymentPolyticView pay0";
	private String shortName = "pay0";

	public PaymentPolyticView create(PaymentPolyticView paymentpolyticview) {
		em.persist(paymentpolyticview);
		return paymentpolyticview;
	}

	public PaymentPolyticView update(PaymentPolyticView paymentpolyticview) {
		return em.merge(paymentpolyticview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, PaymentPolyticView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<PaymentPolyticView> findByExample(PaymentPolyticView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				PaymentPolyticView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), PaymentPolyticView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<PaymentPolyticView> findByExample2(PaymentPolyticView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, PaymentPolyticView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<PaymentPolyticView> findAll(ScrollableSettings settings) {
		List<PaymentPolyticView> paymentpolyticviews = DaoUtil.sasQuery(selectClause, settings,
				PaymentPolyticView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (PaymentPolyticView item : paymentpolyticviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (PaymentPolyticView item : paymentpolyticviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return paymentpolyticviews;
	}

	@SuppressWarnings("unchecked")
	public List<PaymentPolyticView> findAllScrollable(ScrollableSettings settings) {
		List<PaymentPolyticView> paymentpolyticviews = DaoUtil
				.sasQuery(selectClause, settings, PaymentPolyticView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (PaymentPolyticView item : paymentpolyticviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (PaymentPolyticView item : paymentpolyticviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return paymentpolyticviews;
	}

	public PaymentPolyticView findById(Object key, Boolean initAll) {
		PaymentPolyticView item = em.find(PaymentPolyticView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public PaymentPolyticView findById(ScrollableSettings settings) {
		PaymentPolyticView item = em.find(PaymentPolyticView.class, settings.getId());

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
			em.remove(em.getReference(PaymentPolyticView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
