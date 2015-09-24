package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.SettingsView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class SettingsViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT set0 FROM SettingsView set0";
	private String shortName = "set0";

	public SettingsView create(SettingsView settingsview) {
		em.persist(settingsview);
		return settingsview;
	}

	public SettingsView update(SettingsView settingsview) {
		return em.merge(settingsview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, SettingsView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<SettingsView> findByExample(SettingsView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				SettingsView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), SettingsView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<SettingsView> findByExample2(SettingsView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, SettingsView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<SettingsView> findAll(ScrollableSettings settings) {
		List<SettingsView> settingsviews = DaoUtil.sasQuery(selectClause, settings,
				SettingsView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (SettingsView item : settingsviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (SettingsView item : settingsviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return settingsviews;
	}

	@SuppressWarnings("unchecked")
	public List<SettingsView> findAllScrollable(ScrollableSettings settings) {
		List<SettingsView> settingsviews = DaoUtil
				.sasQuery(selectClause, settings, SettingsView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (SettingsView item : settingsviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (SettingsView item : settingsviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return settingsviews;
	}

	public SettingsView findById(Object key, Boolean initAll) {
		SettingsView item = em.find(SettingsView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public SettingsView findById(ScrollableSettings settings) {
		SettingsView item = em.find(SettingsView.class, settings.getId());

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
			em.remove(em.getReference(SettingsView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
