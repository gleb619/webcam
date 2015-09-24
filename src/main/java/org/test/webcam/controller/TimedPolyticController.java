package org.test.webcam.controller;

import java.io.Serializable;
import java.security.Principal;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.test.webcam.controller.data.types.JsonOutput;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.model.domain.entity.TimedPolytic;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.TimedPolyticService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.util.SObjectListner;

@Controller
public class TimedPolyticController implements Serializable {

	private static final long serialVersionUID = -7795913344187745L;

	@Autowired
	private TimedPolyticService timedpolyticService;
	@Autowired
	private SObjectListner sObjectListner;
	@Autowired
	private RestAuthentication restAuthentication;
	private Boolean debug = false;

	@CacheEvict(value = { 
		 "timedpolytic_id"		, "timedpolytic"		, "timedpolytic_scrollable"
		,"timedpolyticview_id"	, "timedpolyticview"	, "timedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/timedpolytic", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> createRest(@RequestBody TimedPolytic data, Principal principal) throws Exception {
		return createData(data, JsonOutput.readSasUser(principal));		
	}
	
	@CacheEvict(value = { 
		 "timedpolytic_id"		, "timedpolytic"		, "timedpolytic_scrollable"
		,"timedpolyticview_id"	, "timedpolyticview"	, "timedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/timedpolytic", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'timedpolytic')")
	public @ResponseBody Map<String, Object> createApi(@PathVariable String key, @RequestBody TimedPolytic data) throws Exception {
		return createData(data, restAuthentication.readSasUser(key));		
	}
	
	@CacheEvict(value = { 
		 "timedpolytic_id"		, "timedpolytic"		, "timedpolytic_scrollable"
		,"timedpolyticview_id"	, "timedpolyticview"	, "timedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/timedpolytic", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> updateRest(@RequestBody TimedPolytic data, Principal principal) throws Exception {
		return updateData(data, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "timedpolytic_id"		, "timedpolytic"		, "timedpolytic_scrollable"
		,"timedpolyticview_id"	, "timedpolyticview"	, "timedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/timedpolytic", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'timedpolytic')")
	public @ResponseBody Map<String, Object> updateApi(@PathVariable String key, @RequestBody TimedPolytic data) throws Exception {
		return updateData(data, restAuthentication.readSasUser(key));
	}
	
	@CacheEvict(value = { 
		 "timedpolytic_id"		, "timedpolytic"		, "timedpolytic_scrollable"
		,"timedpolyticview_id"	, "timedpolyticview"	, "timedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/timedpolytic/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> deleteRest(@PathVariable Integer id, Principal principal) throws Exception {
		return deleteData(id, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "timedpolytic_id"		, "timedpolytic"		, "timedpolytic_scrollable"
		,"timedpolyticview_id"	, "timedpolyticview"	, "timedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/timedpolytic/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'timedpolytic')")
	public @ResponseBody Map<String, Object> deleteApi(@PathVariable String key, @PathVariable Integer id) throws Exception {
		return deleteData(id, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "timedpolytic_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/timedpolytic/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable Integer id, ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewByIdData(id, scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "timedpolytic_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/timedpolytic/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'timedpolytic')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable String key, @PathVariable Integer id, ScrollableSettings scrollableSettings) throws Exception {
		return viewByIdData(id, scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "timedpolytic", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/timedpolytic", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "timedpolytic", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/timedpolytic", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'timedpolytic')")
	public @ResponseBody Map<String, Object> viewApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "timedpolytic_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/timedpolytic/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollableRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewScrollableData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "timedpolytic_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/timedpolytic/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'timedpolytic')")
	public @ResponseBody Map<String, Object> viewScrollableApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewScrollableData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@RequestMapping(value = "/data/timedpolytic/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> totalRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		scrollableSettings.setSasUser(JsonOutput.readSasUser(principal));
		return totalData(scrollableSettings);
	}
	
	@RequestMapping(value = "/rest/{key}/timedpolytic/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'timedpolytic')")
	public @ResponseBody Map<String, Object> totalApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		scrollableSettings.setSasUser(restAuthentication.readSasUser(key));
		return totalData(scrollableSettings);
	}
	
//		#-------------------------  LOGIC -------------------------

	private Map<String, Object> createData(TimedPolytic data, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preCreate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.create(scrollableSettings.getSasUser(), timedpolyticService.create(data.preInitList()));
			data = sObjectListner.postCreate(scrollableSettings.getSasUser(), data);
			
			return JsonOutput.map(data);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while creating timedpolytic: " + e.getMessage());
		}
	}
	
	private Map<String, Object> updateData(TimedPolytic data, SasUser sasUser){
	
		TimedPolytic timedpolytic = null;
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preUpdate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.update(scrollableSettings.getSasUser(), timedpolyticService.update(data.preInitList()));
			data = sObjectListner.postUpdate(scrollableSettings.getSasUser(), data);
			timedpolytic = data;
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to update timedpolytic: " + e.getMessage());
		}
		
		if (timedpolytic == null) {
			return JsonOutput.mapError("Cant find data");
		} else {
			return JsonOutput.mapSingle(timedpolytic);
		}
	}
	
	private Map<String, Object> deleteData(Object id, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			sObjectListner.preDelete(scrollableSettings.getSasUser(), TimedPolytic.class, id);
			sObjectListner.delete(scrollableSettings.getSasUser(), timedpolyticService.delete(id));
			sObjectListner.postDelete(scrollableSettings.getSasUser(), TimedPolytic.class, id);
			
			return JsonOutput.mapSuccess();
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to delete timedpolytic: " + e.getMessage());
		}
	}
	
	private Map<String, Object> viewByIdData(Object id, ScrollableSettings scrollableSettings, SasUser sasUser){
		TimedPolytic timedpolytic = null;
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			scrollableSettings.setId(id);
			timedpolytic = sObjectListner.viewById(scrollableSettings.getSasUser(), timedpolyticService.findById(scrollableSettings));
			timedpolytic = sObjectListner.postViewById(scrollableSettings.getSasUser(), timedpolytic);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewById timedpolytic: " + e.getMessage());
		}
		
		if (timedpolytic == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(timedpolytic);
		}
	}

	private Map<String, Object> viewData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<TimedPolytic> timedpolyticList = new ArrayList<TimedPolytic>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			timedpolyticList = sObjectListner.view(scrollableSettings.getSasUser(), timedpolyticService.findAll(scrollableSettings));
			timedpolyticList = sObjectListner.postView(scrollableSettings.getSasUser(), timedpolyticList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to view timedpolytic: " + e.getMessage());
		}
		
		if (timedpolyticList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (timedpolyticList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(timedpolyticList);
		}
	}
	
	private Map<String, Object> viewScrollableData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<TimedPolytic> timedpolyticList = new ArrayList<TimedPolytic>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			timedpolyticList = sObjectListner.viewScrollable(scrollableSettings.getSasUser(), timedpolyticService.findAllScrollable(scrollableSettings));
			timedpolyticList = sObjectListner.postViewScrollable(scrollableSettings.getSasUser(), timedpolyticList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewScrollable timedpolytic: " + e.getMessage());
		}
		
		if (timedpolyticList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (timedpolyticList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(timedpolyticList);
		}
	}

	private Map<String, Object> totalData(ScrollableSettings scrollableSettings){
		try {
			return JsonOutput.mapSingle(timedpolyticService.total(scrollableSettings));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving total from database: " + e.getMessage());
		}
	}

}
