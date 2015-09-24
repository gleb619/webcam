package org.test.webcam.model.dao;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.Photo;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class PhotoDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT pho0 FROM Photo pho0";
	private String shortName = "pho0";

	public Photo create(Photo photo) {
		em.persist(photo);
		return photo;
	}

	public Photo update(Photo photo) {
		return em.merge(photo);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, Photo.class, em);
		
		return ((BigInteger) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<Photo> findByExample(Photo example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				Photo.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), Photo.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Photo> findByExample2(Photo example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, Photo.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Photo> findAll(ScrollableSettings settings) {
		List<Photo> photos = DaoUtil.sasQuery(selectClause, settings,
				Photo.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (Photo item : photos) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (Photo item : photos) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return photos;
	}

	@SuppressWarnings("unchecked")
	public List<Photo> findAllScrollable(ScrollableSettings settings) {
		List<Photo> photos = DaoUtil
				.sasQuery(selectClause, settings, Photo.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (Photo item : photos) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (Photo item : photos) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return photos;
	}

	public Photo findById(Object key, Boolean initAll) {
		Photo item = em.find(Photo.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public Photo findById(ScrollableSettings settings) {
		Photo item = em.find(Photo.class, settings.getId());

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
			em.remove(em.getReference(Photo.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
