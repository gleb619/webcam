package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.SizedPolyticView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class SizedPolyticViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT siz0 FROM SizedPolyticView siz0";
	private String shortName = "siz0";

	public SizedPolyticView create(SizedPolyticView sizedpolyticview) {
		em.persist(sizedpolyticview);
		return sizedpolyticview;
	}

	public SizedPolyticView update(SizedPolyticView sizedpolyticview) {
		return em.merge(sizedpolyticview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, SizedPolyticView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<SizedPolyticView> findByExample(SizedPolyticView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				SizedPolyticView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), SizedPolyticView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<SizedPolyticView> findByExample2(SizedPolyticView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, SizedPolyticView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<SizedPolyticView> findAll(ScrollableSettings settings) {
		List<SizedPolyticView> sizedpolyticviews = DaoUtil.sasQuery(selectClause, settings,
				SizedPolyticView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (SizedPolyticView item : sizedpolyticviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (SizedPolyticView item : sizedpolyticviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return sizedpolyticviews;
	}

	@SuppressWarnings("unchecked")
	public List<SizedPolyticView> findAllScrollable(ScrollableSettings settings) {
		List<SizedPolyticView> sizedpolyticviews = DaoUtil
				.sasQuery(selectClause, settings, SizedPolyticView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (SizedPolyticView item : sizedpolyticviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (SizedPolyticView item : sizedpolyticviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return sizedpolyticviews;
	}

	public SizedPolyticView findById(Object key, Boolean initAll) {
		SizedPolyticView item = em.find(SizedPolyticView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public SizedPolyticView findById(ScrollableSettings settings) {
		SizedPolyticView item = em.find(SizedPolyticView.class, settings.getId());

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
			em.remove(em.getReference(SizedPolyticView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
