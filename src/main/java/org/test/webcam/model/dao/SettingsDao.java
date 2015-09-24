package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.Settings;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class SettingsDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT set0 FROM Settings set0";
	private String shortName = "set0";

	public Settings create(Settings settings) {
		em.persist(settings);
		return settings;
	}

	public Settings update(Settings settings) {
		return em.merge(settings);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, Settings.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<Settings> findByExample(Settings example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				Settings.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), Settings.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Settings> findByExample2(Settings example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, Settings.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Settings> findAll(ScrollableSettings settings) {
		List<Settings> settingss = DaoUtil.sasQuery(selectClause, settings,
				Settings.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (Settings item : settingss) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (Settings item : settingss) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return settingss;
	}

	@SuppressWarnings("unchecked")
	public List<Settings> findAllScrollable(ScrollableSettings settings) {
		List<Settings> settingss = DaoUtil
				.sasQuery(selectClause, settings, Settings.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (Settings item : settingss) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (Settings item : settingss) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return settingss;
	}

	public Settings findById(Object key, Boolean initAll) {
		Settings item = em.find(Settings.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public Settings findById(ScrollableSettings settings) {
		Settings item = em.find(Settings.class, settings.getId());

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
			em.remove(em.getReference(Settings.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
