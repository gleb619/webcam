package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.SizedPolytic;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class SizedPolyticDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT siz0 FROM SizedPolytic siz0";
	private String shortName = "siz0";

	public SizedPolytic create(SizedPolytic sizedpolytic) {
		em.persist(sizedpolytic);
		return sizedpolytic;
	}

	public SizedPolytic update(SizedPolytic sizedpolytic) {
		return em.merge(sizedpolytic);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, SizedPolytic.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<SizedPolytic> findByExample(SizedPolytic example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				SizedPolytic.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), SizedPolytic.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<SizedPolytic> findByExample2(SizedPolytic example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, SizedPolytic.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<SizedPolytic> findAll(ScrollableSettings settings) {
		List<SizedPolytic> sizedpolytics = DaoUtil.sasQuery(selectClause, settings,
				SizedPolytic.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (SizedPolytic item : sizedpolytics) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (SizedPolytic item : sizedpolytics) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return sizedpolytics;
	}

	@SuppressWarnings("unchecked")
	public List<SizedPolytic> findAllScrollable(ScrollableSettings settings) {
		List<SizedPolytic> sizedpolytics = DaoUtil
				.sasQuery(selectClause, settings, SizedPolytic.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (SizedPolytic item : sizedpolytics) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (SizedPolytic item : sizedpolytics) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return sizedpolytics;
	}

	public SizedPolytic findById(Object key, Boolean initAll) {
		SizedPolytic item = em.find(SizedPolytic.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public SizedPolytic findById(ScrollableSettings settings) {
		SizedPolytic item = em.find(SizedPolytic.class, settings.getId());

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
			em.remove(em.getReference(SizedPolytic.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
