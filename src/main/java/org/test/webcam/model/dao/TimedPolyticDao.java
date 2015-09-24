package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.TimedPolytic;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class TimedPolyticDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT tim0 FROM TimedPolytic tim0";
	private String shortName = "tim0";

	public TimedPolytic create(TimedPolytic timedpolytic) {
		em.persist(timedpolytic);
		return timedpolytic;
	}

	public TimedPolytic update(TimedPolytic timedpolytic) {
		return em.merge(timedpolytic);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, TimedPolytic.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<TimedPolytic> findByExample(TimedPolytic example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				TimedPolytic.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), TimedPolytic.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TimedPolytic> findByExample2(TimedPolytic example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, TimedPolytic.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<TimedPolytic> findAll(ScrollableSettings settings) {
		List<TimedPolytic> timedpolytics = DaoUtil.sasQuery(selectClause, settings,
				TimedPolytic.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (TimedPolytic item : timedpolytics) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TimedPolytic item : timedpolytics) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return timedpolytics;
	}

	@SuppressWarnings("unchecked")
	public List<TimedPolytic> findAllScrollable(ScrollableSettings settings) {
		List<TimedPolytic> timedpolytics = DaoUtil
				.sasQuery(selectClause, settings, TimedPolytic.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (TimedPolytic item : timedpolytics) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TimedPolytic item : timedpolytics) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return timedpolytics;
	}

	public TimedPolytic findById(Object key, Boolean initAll) {
		TimedPolytic item = em.find(TimedPolytic.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public TimedPolytic findById(ScrollableSettings settings) {
		TimedPolytic item = em.find(TimedPolytic.class, settings.getId());

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
			em.remove(em.getReference(TimedPolytic.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
