package org.test.webcam.controller.view;

import java.io.Serializable;
import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.test.webcam.controller.data.types.JsonOutput;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.view.UsersView;
import org.test.webcam.model.service.view.UsersViewService;
import org.test.webcam.util.SObjectListner;

@Controller
public class UsersViewController implements Serializable {

	private static final long serialVersionUID = -4165513685393461L;

	@Autowired
	private UsersViewService usersviewService;
	@Autowired
	private SObjectListner sObjectListner;
	private Boolean debug = false;

	@Cacheable(value = "usersview_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #settings)")
	@RequestMapping(value = "/data/usersview/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(
			@PathVariable String id, ScrollableSettings settings,
			Principal principal) throws Exception {
		UsersView usersview = null;
		try {
			settings.setSasUser(JsonOutput.readSasUser(principal));
			try {
				Integer idRaw = new Integer(id);
				settings.setId(idRaw);
			} catch (NumberFormatException e) {
				settings.setId(id);
				e.printStackTrace();
			}
			usersview = sObjectListner.viewById(settings.getSasUser(), usersviewService.findById(settings));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving usersview from database: "
					+ e.getLocalizedMessage());
		}

		if (usersview == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(usersview);
		}
	}

	@Cacheable(value = "usersview", key = "T(java.util.Objects).hash(#root.methodName, #principal, #settings)")
	@RequestMapping(value = "/data/usersview", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> view(
			ScrollableSettings settings, Principal principal) throws Exception {
		try {

			settings.setSasUser(JsonOutput.readSasUser(principal));
			return JsonOutput.map(sObjectListner.view(settings.getSasUser(), usersviewService.findAll(settings)));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving usersview from database: "
					+ e.getLocalizedMessage());
		}
	}

	@Cacheable(value = "usersview_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #settings)")
	@RequestMapping(value = "/data/usersview/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollable(
			ScrollableSettings settings, Principal principal) throws Exception {
		try {
			settings.setSasUser(JsonOutput.readSasUser(principal));
			return JsonOutput.map(sObjectListner.viewScrollable(settings.getSasUser(), usersviewService.findAllScrollable(settings)));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving usersview from database: "
					+ e.getLocalizedMessage());
		}
	}

}
