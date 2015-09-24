package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.RelUserSettings;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class RelUserSettingsDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT rel0 FROM RelUserSettings rel0";
	private String shortName = "rel0";

	public RelUserSettings create(RelUserSettings relusersettings) {
		em.persist(relusersettings);
		return relusersettings;
	}

	public RelUserSettings update(RelUserSettings relusersettings) {
		return em.merge(relusersettings);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, RelUserSettings.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<RelUserSettings> findByExample(RelUserSettings example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				RelUserSettings.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), RelUserSettings.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<RelUserSettings> findByExample2(RelUserSettings example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, RelUserSettings.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<RelUserSettings> findAll(ScrollableSettings settings) {
		List<RelUserSettings> relusersettingss = DaoUtil.sasQuery(selectClause, settings,
				RelUserSettings.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (RelUserSettings item : relusersettingss) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (RelUserSettings item : relusersettingss) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return relusersettingss;
	}

	@SuppressWarnings("unchecked")
	public List<RelUserSettings> findAllScrollable(ScrollableSettings settings) {
		List<RelUserSettings> relusersettingss = DaoUtil
				.sasQuery(selectClause, settings, RelUserSettings.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (RelUserSettings item : relusersettingss) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (RelUserSettings item : relusersettingss) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return relusersettingss;
	}

	public RelUserSettings findById(Object key, Boolean initAll) {
		RelUserSettings item = em.find(RelUserSettings.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public RelUserSettings findById(ScrollableSettings settings) {
		RelUserSettings item = em.find(RelUserSettings.class, settings.getId());

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
			em.remove(em.getReference(RelUserSettings.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
