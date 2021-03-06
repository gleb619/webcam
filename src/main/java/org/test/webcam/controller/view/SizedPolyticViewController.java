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
import org.test.webcam.model.domain.entity.view.SizedPolyticView;
import org.test.webcam.model.service.view.SizedPolyticViewService;
import org.test.webcam.util.SObjectListner;

@Controller
public class SizedPolyticViewController implements Serializable {

	private static final long serialVersionUID = -4165513685393461L;

	@Autowired
	private SizedPolyticViewService sizedpolyticviewService;
	@Autowired
	private SObjectListner sObjectListner;
	private Boolean debug = false;

	@Cacheable(value = "sizedpolyticview_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #settings)")
	@RequestMapping(value = "/data/sizedpolyticview/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(
			@PathVariable String id, ScrollableSettings settings,
			Principal principal) throws Exception {
		SizedPolyticView sizedpolyticview = null;
		try {
			settings.setSasUser(JsonOutput.readSasUser(principal));
			try {
				Integer idRaw = new Integer(id);
				settings.setId(idRaw);
			} catch (NumberFormatException e) {
				settings.setId(id);
				e.printStackTrace();
			}
			sizedpolyticview = sObjectListner.viewById(settings.getSasUser(), sizedpolyticviewService.findById(settings));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving sizedpolyticview from database: "
					+ e.getLocalizedMessage());
		}

		if (sizedpolyticview == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(sizedpolyticview);
		}
	}

	@Cacheable(value = "sizedpolyticview", key = "T(java.util.Objects).hash(#root.methodName, #principal, #settings)")
	@RequestMapping(value = "/data/sizedpolyticview", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> view(
			ScrollableSettings settings, Principal principal) throws Exception {
		try {

			settings.setSasUser(JsonOutput.readSasUser(principal));
			return JsonOutput.map(sObjectListner.view(settings.getSasUser(), sizedpolyticviewService.findAll(settings)));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving sizedpolyticview from database: "
					+ e.getLocalizedMessage());
		}
	}

	@Cacheable(value = "sizedpolyticview_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #settings)")
	@RequestMapping(value = "/data/sizedpolyticview/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollable(
			ScrollableSettings settings, Principal principal) throws Exception {
		try {
			settings.setSasUser(JsonOutput.readSasUser(principal));
			return JsonOutput.map(sObjectListner.viewScrollable(settings.getSasUser(), sizedpolyticviewService.findAllScrollable(settings)));

		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving sizedpolyticview from database: "
					+ e.getLocalizedMessage());
		}
	}

}
