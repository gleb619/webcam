package org.test.webcam.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.Users;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class UsersDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT use0 FROM Users use0";
	private String shortName = "use0";

	public Users create(Users users) {
		em.persist(users);
		return users;
	}

	public Users update(Users users) {
		return em.merge(users);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, Users.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<Users> findByExample(Users example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				Users.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), Users.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Users> findByExample2(Users example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, Users.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Users> findAll(ScrollableSettings settings) {
		List<Users> userss = DaoUtil.sasQuery(selectClause, settings,
				Users.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (Users item : userss) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (Users item : userss) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return userss;
	}

	@SuppressWarnings("unchecked")
	public List<Users> findAllScrollable(ScrollableSettings settings) {
		List<Users> userss = DaoUtil
				.sasQuery(selectClause, settings, Users.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (Users item : userss) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (Users item : userss) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return userss;
	}

	public Users findById(Object key, Boolean initAll) {
		Users item = em.find(Users.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public Users findById(ScrollableSettings settings) {
		Users item = em.find(Users.class, settings.getId());

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
			em.remove(em.getReference(Users.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
