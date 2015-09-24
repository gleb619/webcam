package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.UserRoles;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class UserRolesDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT use0 FROM UserRoles use0";
	private String shortName = "use0";

	public UserRoles create(UserRoles userroles) {
		em.persist(userroles);
		return userroles;
	}

	public UserRoles update(UserRoles userroles) {
		return em.merge(userroles);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, UserRoles.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<UserRoles> findByExample(UserRoles example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				UserRoles.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), UserRoles.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<UserRoles> findByExample2(UserRoles example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, UserRoles.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<UserRoles> findAll(ScrollableSettings settings) {
		List<UserRoles> userroless = DaoUtil.sasQuery(selectClause, settings,
				UserRoles.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (UserRoles item : userroless) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (UserRoles item : userroless) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return userroless;
	}

	@SuppressWarnings("unchecked")
	public List<UserRoles> findAllScrollable(ScrollableSettings settings) {
		List<UserRoles> userroless = DaoUtil
				.sasQuery(selectClause, settings, UserRoles.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (UserRoles item : userroless) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (UserRoles item : userroless) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return userroless;
	}

	public UserRoles findById(Object key, Boolean initAll) {
		UserRoles item = em.find(UserRoles.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public UserRoles findById(ScrollableSettings settings) {
		UserRoles item = em.find(UserRoles.class, settings.getId());

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
			em.remove(em.getReference(UserRoles.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
