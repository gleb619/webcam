package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.RelUserSettingsView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class RelUserSettingsViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT rel0 FROM RelUserSettingsView rel0";
	private String shortName = "rel0";

	public RelUserSettingsView create(RelUserSettingsView relusersettingsview) {
		em.persist(relusersettingsview);
		return relusersettingsview;
	}

	public RelUserSettingsView update(RelUserSettingsView relusersettingsview) {
		return em.merge(relusersettingsview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, RelUserSettingsView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<RelUserSettingsView> findByExample(RelUserSettingsView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				RelUserSettingsView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), RelUserSettingsView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<RelUserSettingsView> findByExample2(RelUserSettingsView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, RelUserSettingsView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<RelUserSettingsView> findAll(ScrollableSettings settings) {
		List<RelUserSettingsView> relusersettingsviews = DaoUtil.sasQuery(selectClause, settings,
				RelUserSettingsView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (RelUserSettingsView item : relusersettingsviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (RelUserSettingsView item : relusersettingsviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return relusersettingsviews;
	}

	@SuppressWarnings("unchecked")
	public List<RelUserSettingsView> findAllScrollable(ScrollableSettings settings) {
		List<RelUserSettingsView> relusersettingsviews = DaoUtil
				.sasQuery(selectClause, settings, RelUserSettingsView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (RelUserSettingsView item : relusersettingsviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (RelUserSettingsView item : relusersettingsviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return relusersettingsviews;
	}

	public RelUserSettingsView findById(Object key, Boolean initAll) {
		RelUserSettingsView item = em.find(RelUserSettingsView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public RelUserSettingsView findById(ScrollableSettings settings) {
		RelUserSettingsView item = em.find(RelUserSettingsView.class, settings.getId());

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
			em.remove(em.getReference(RelUserSettingsView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
