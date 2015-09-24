package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.TmUserInfo;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class TmUserInfoDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT tmu0 FROM TmUserInfo tmu0";
	private String shortName = "tmu0";

	public TmUserInfo create(TmUserInfo tmuserinfo) {
		em.persist(tmuserinfo);
		return tmuserinfo;
	}

	public TmUserInfo update(TmUserInfo tmuserinfo) {
		return em.merge(tmuserinfo);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, TmUserInfo.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<TmUserInfo> findByExample(TmUserInfo example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				TmUserInfo.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), TmUserInfo.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<TmUserInfo> findByExample2(TmUserInfo example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, TmUserInfo.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<TmUserInfo> findAll(ScrollableSettings settings) {
		List<TmUserInfo> tmuserinfos = DaoUtil.sasQuery(selectClause, settings,
				TmUserInfo.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (TmUserInfo item : tmuserinfos) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TmUserInfo item : tmuserinfos) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return tmuserinfos;
	}

	@SuppressWarnings("unchecked")
	public List<TmUserInfo> findAllScrollable(ScrollableSettings settings) {
		List<TmUserInfo> tmuserinfos = DaoUtil
				.sasQuery(selectClause, settings, TmUserInfo.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (TmUserInfo item : tmuserinfos) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (TmUserInfo item : tmuserinfos) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return tmuserinfos;
	}

	public TmUserInfo findById(Object key, Boolean initAll) {
		TmUserInfo item = em.find(TmUserInfo.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public TmUserInfo findById(ScrollableSettings settings) {
		TmUserInfo item = em.find(TmUserInfo.class, settings.getId());

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
			em.remove(em.getReference(TmUserInfo.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
