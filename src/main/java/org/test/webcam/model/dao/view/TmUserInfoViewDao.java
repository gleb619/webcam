package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.TmUserInfoView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class TmUserInfoViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT tmu0 FROM TmUserInfoView tmu0";
	private String shortName = "tmu0";

	public TmUserInfoView create(TmUserInfoView tmuserinfoview) {
		em.persist(tmuserinfoview);
		return tmuserinfoview;
	}

	public TmUserInfoView update(TmUserInfoView tmuserinfoview) {
		return em.merge(tmuserinfoview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, TmUserInfoView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<TmUserInfoView> findByExample(TmUserInfoView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				TmUserInfoView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), TmUserInfoView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TmUserInfoView> findByExample2(TmUserInfoView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, TmUserInfoView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<TmUserInfoView> findAll(ScrollableSettings settings) {
		List<TmUserInfoView> tmuserinfoviews = DaoUtil.sasQuery(selectClause, settings,
				TmUserInfoView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (TmUserInfoView item : tmuserinfoviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TmUserInfoView item : tmuserinfoviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return tmuserinfoviews;
	}

	@SuppressWarnings("unchecked")
	public List<TmUserInfoView> findAllScrollable(ScrollableSettings settings) {
		List<TmUserInfoView> tmuserinfoviews = DaoUtil
				.sasQuery(selectClause, settings, TmUserInfoView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (TmUserInfoView item : tmuserinfoviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TmUserInfoView item : tmuserinfoviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return tmuserinfoviews;
	}

	public TmUserInfoView findById(Object key, Boolean initAll) {
		TmUserInfoView item = em.find(TmUserInfoView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public TmUserInfoView findById(ScrollableSettings settings) {
		TmUserInfoView item = em.find(TmUserInfoView.class, settings.getId());

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
			em.remove(em.getReference(TmUserInfoView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
