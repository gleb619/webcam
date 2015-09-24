package org.test.webcam.model.dao.view;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.UserRolesView;
import org.test.webcam.util.DaoUtil;
import org.test.webcam.util.data.types.FindByDateExample;
import org.test.webcam.util.data.types.FindByExample;
import org.test.webcam.util.data.types.TotalQuery;
import org.test.webcam.util.task.DateCompare;

@Repository
public class UserRolesViewDao {

	@PersistenceContext
	private EntityManager em;
	private String selectClause = "SELECT use0 FROM UserRolesView use0";
	private String shortName = "use0";

	public UserRolesView create(UserRolesView userrolesview) {
		em.persist(userrolesview);
		return userrolesview;
	}

	public UserRolesView update(UserRolesView userrolesview) {
		return em.merge(userrolesview);
	}

	public Integer total(ScrollableSettings settings) throws Exception {
		TotalQuery totalQuery = DaoUtil.total(settings, UserRolesView.class, em);
		
		return ((Long) totalQuery.getQuery().getSingleResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	public List<UserRolesView> findByExample(UserRolesView example, String delimitter) {
		FindByExample findByExample = DaoUtil.findByExampleQueryRaw(example,
				UserRolesView.class, em, delimitter);
		Query query = DaoUtil.sasQuery(findByExample.getSelectClause(),
				new ScrollableSettings(), UserRolesView.class, em);
		for (String key : findByExample.getValues().keySet()) {
			query.setParameter(key, findByExample.getValues().get(key));
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<UserRolesView> findByExample2(UserRolesView example, DateCompare type) {
		FindByDateExample findByExample = DaoUtil.findByExample2(example, UserRolesView.class, em, type).init();
		return findByExample.getQuery().getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<UserRolesView> findAll(ScrollableSettings settings) {
		List<UserRolesView> userrolesviews = DaoUtil.sasQuery(selectClause, settings,
				UserRolesView.class, em).getResultList();

		if (settings.getList().size() > 0) {
			for (UserRolesView item : userrolesviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (UserRolesView item : userrolesviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return userrolesviews;
	}

	@SuppressWarnings("unchecked")
	public List<UserRolesView> findAllScrollable(ScrollableSettings settings) {
		List<UserRolesView> userrolesviews = DaoUtil
				.sasQuery(selectClause, settings, UserRolesView.class, em)
				.setFirstResult(
						(settings.getPageNumber() - 1) * settings.getPageSize())
				.setMaxResults(settings.getPageSize()).getResultList();

		if (settings.getList().size() > 0) {
			for (UserRolesView item : userrolesviews) {
				item.customInit(item, settings.getList());
			}
		}

		if (settings.getInitLists() || settings.getInitDicts()) {
			for (UserRolesView item : userrolesviews) {
				if (settings.getInitDicts()) {
					item.initDicts();
				}
				if (settings.getInitLists()) {
					item.initList();
				}
			}
		}

		return userrolesviews;
	}

	public UserRolesView findById(Object key, Boolean initAll) {
		UserRolesView item = em.find(UserRolesView.class, key);
		
		if (initAll) {
			item.init();
		}
		
		return item;
	}

	public UserRolesView findById(ScrollableSettings settings) {
		UserRolesView item = em.find(UserRolesView.class, settings.getId());

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
			em.remove(em.getReference(UserRolesView.class, id));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
