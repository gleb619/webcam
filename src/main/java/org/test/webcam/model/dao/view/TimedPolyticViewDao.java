package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.TimedPolyticView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class TimedPolyticViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT tim0 FROM TimedPolyticView tim0";
	private String shortName = "tim0";

	public TimedPolyticView create(TimedPolyticView timedpolyticview) {
		em.persist(timedpolyticview);
		return timedpolyticview;
	}

	public TimedPolyticView update(TimedPolyticView timedpolyticview) {
		return em.merge(timedpolyticview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, TimedPolyticView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<TimedPolyticView> findByExample(TimedPolyticView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				TimedPolyticView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), TimedPolyticView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TimedPolyticView> findByExample2(TimedPolyticView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, TimedPolyticView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<TimedPolyticView> findAll(ScrollableSettings settings) {
		List<TimedPolyticView> timedpolyticviews = DaoUtil.sasQuery(selectClause, settings,
				TimedPolyticView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (TimedPolyticView item : timedpolyticviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TimedPolyticView item : timedpolyticviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return timedpolyticviews;
	}

	@SuppressWarnings("unchecked")
	public List<TimedPolyticView> findAllScrollable(ScrollableSettings settings) {
		List<TimedPolyticView> timedpolyticviews = DaoUtil
				.sasQuery(selectClause, settings, TimedPolyticView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (TimedPolyticView item : timedpolyticviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TimedPolyticView item : timedpolyticviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return timedpolyticviews;
	}

	public TimedPolyticView findById(Object key, Boolean initAll) {
		TimedPolyticView item = em.find(TimedPolyticView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public TimedPolyticView findById(ScrollableSettings settings) {
		TimedPolyticView item = em.find(TimedPolyticView.class, settings.getId());

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
			em.remove(em.getReference(TimedPolyticView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
