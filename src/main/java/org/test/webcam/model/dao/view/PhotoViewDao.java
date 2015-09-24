package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.PhotoView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class PhotoViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT pho0 FROM PhotoView pho0";
	private String shortName = "pho0";

	public PhotoView create(PhotoView photoview) {
		em.persist(photoview);
		return photoview;
	}

	public PhotoView update(PhotoView photoview) {
		return em.merge(photoview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, PhotoView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<PhotoView> findByExample(PhotoView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				PhotoView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), PhotoView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<PhotoView> findByExample2(PhotoView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, PhotoView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<PhotoView> findAll(ScrollableSettings settings) {
		List<PhotoView> photoviews = DaoUtil.sasQuery(selectClause, settings,
				PhotoView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (PhotoView item : photoviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (PhotoView item : photoviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return photoviews;
	}

	@SuppressWarnings("unchecked")
	public List<PhotoView> findAllScrollable(ScrollableSettings settings) {
		List<PhotoView> photoviews = DaoUtil
				.sasQuery(selectClause, settings, PhotoView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (PhotoView item : photoviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (PhotoView item : photoviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return photoviews;
	}

	public PhotoView findById(Object key, Boolean initAll) {
		PhotoView item = em.find(PhotoView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public PhotoView findById(ScrollableSettings settings) {
		PhotoView item = em.find(PhotoView.class, settings.getId());

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
			em.remove(em.getReference(PhotoView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
