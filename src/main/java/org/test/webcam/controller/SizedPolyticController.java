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
import org.test.webcam.model.domain.entity.SizedPolytic;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.SizedPolyticService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.util.SObjectListner;

@Controller
public class SizedPolyticController implements Serializable {

	private static final long serialVersionUID = -1382541545946968L;

	@Autowired
	private SizedPolyticService sizedpolyticService;
	@Autowired
	private SObjectListner sObjectListner;
	@Autowired
	private RestAuthentication restAuthentication;
	private Boolean debug = false;

	@CacheEvict(value = { 
		 "sizedpolytic_id"		, "sizedpolytic"		, "sizedpolytic_scrollable"
		,"sizedpolyticview_id"	, "sizedpolyticview"	, "sizedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/sizedpolytic", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> createRest(@RequestBody SizedPolytic data, Principal principal) throws Exception {
		return createData(data, JsonOutput.readSasUser(principal));		
	}
	
	@CacheEvict(value = { 
		 "sizedpolytic_id"		, "sizedpolytic"		, "sizedpolytic_scrollable"
		,"sizedpolyticview_id"	, "sizedpolyticview"	, "sizedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/sizedpolytic", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'sizedpolytic')")
	public @ResponseBody Map<String, Object> createApi(@PathVariable String key, @RequestBody SizedPolytic data) throws Exception {
		return createData(data, restAuthentication.readSasUser(key));		
	}
	
	@CacheEvict(value = { 
		 "sizedpolytic_id"		, "sizedpolytic"		, "sizedpolytic_scrollable"
		,"sizedpolyticview_id"	, "sizedpolyticview"	, "sizedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/sizedpolytic", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> updateRest(@RequestBody SizedPolytic data, Principal principal) throws Exception {
		return updateData(data, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "sizedpolytic_id"		, "sizedpolytic"		, "sizedpolytic_scrollable"
		,"sizedpolyticview_id"	, "sizedpolyticview"	, "sizedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/sizedpolytic", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'sizedpolytic')")
	public @ResponseBody Map<String, Object> updateApi(@PathVariable String key, @RequestBody SizedPolytic data) throws Exception {
		return updateData(data, restAuthentication.readSasUser(key));
	}
	
	@CacheEvict(value = { 
		 "sizedpolytic_id"		, "sizedpolytic"		, "sizedpolytic_scrollable"
		,"sizedpolyticview_id"	, "sizedpolyticview"	, "sizedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/sizedpolytic/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> deleteRest(@PathVariable Integer id, Principal principal) throws Exception {
		return deleteData(id, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "sizedpolytic_id"		, "sizedpolytic"		, "sizedpolytic_scrollable"
		,"sizedpolyticview_id"	, "sizedpolyticview"	, "sizedpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/sizedpolytic/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'sizedpolytic')")
	public @ResponseBody Map<String, Object> deleteApi(@PathVariable String key, @PathVariable Integer id) throws Exception {
		return deleteData(id, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "sizedpolytic_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/sizedpolytic/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable Integer id, ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewByIdData(id, scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "sizedpolytic_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/sizedpolytic/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'sizedpolytic')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable String key, @PathVariable Integer id, ScrollableSettings scrollableSettings) throws Exception {
		return viewByIdData(id, scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "sizedpolytic", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/sizedpolytic", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "sizedpolytic", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/sizedpolytic", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'sizedpolytic')")
	public @ResponseBody Map<String, Object> viewApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "sizedpolytic_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/sizedpolytic/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollableRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewScrollableData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "sizedpolytic_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/sizedpolytic/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'sizedpolytic')")
	public @ResponseBody Map<String, Object> viewScrollableApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewScrollableData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@RequestMapping(value = "/data/sizedpolytic/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> totalRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		scrollableSettings.setSasUser(JsonOutput.readSasUser(principal));
		return totalData(scrollableSettings);
	}
	
	@RequestMapping(value = "/rest/{key}/sizedpolytic/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'sizedpolytic')")
	public @ResponseBody Map<String, Object> totalApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		scrollableSettings.setSasUser(restAuthentication.readSasUser(key));
		return totalData(scrollableSettings);
	}
	
//		#-------------------------  LOGIC -------------------------

	private Map<String, Object> createData(SizedPolytic data, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preCreate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.create(scrollableSettings.getSasUser(), sizedpolyticService.create(data.preInitList()));
			data = sObjectListner.postCreate(scrollableSettings.getSasUser(), data);
			
			return JsonOutput.map(data);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while creating sizedpolytic: " + e.getMessage());
		}
	}
	
	private Map<String, Object> updateData(SizedPolytic data, SasUser sasUser){
	
		SizedPolytic sizedpolytic = null;
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preUpdate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.update(scrollableSettings.getSasUser(), sizedpolyticService.update(data.preInitList()));
			data = sObjectListner.postUpdate(scrollableSettings.getSasUser(), data);
			sizedpolytic = data;
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to update sizedpolytic: " + e.getMessage());
		}
		
		if (sizedpolytic == null) {
			return JsonOutput.mapError("Cant find data");
		} else {
			return JsonOutput.mapSingle(sizedpolytic);
		}
	}
	
	private Map<String, Object> deleteData(Object id, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			sObjectListner.preDelete(scrollableSettings.getSasUser(), SizedPolytic.class, id);
			sObjectListner.delete(scrollableSettings.getSasUser(), sizedpolyticService.delete(id));
			sObjectListner.postDelete(scrollableSettings.getSasUser(), SizedPolytic.class, id);
			
			return JsonOutput.mapSuccess();
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to delete sizedpolytic: " + e.getMessage());
		}
	}
	
	private Map<String, Object> viewByIdData(Object id, ScrollableSettings scrollableSettings, SasUser sasUser){
		SizedPolytic sizedpolytic = null;
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			scrollableSettings.setId(id);
			sizedpolytic = sObjectListner.viewById(scrollableSettings.getSasUser(), sizedpolyticService.findById(scrollableSettings));
			sizedpolytic = sObjectListner.postViewById(scrollableSettings.getSasUser(), sizedpolytic);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewById sizedpolytic: " + e.getMessage());
		}
		
		if (sizedpolytic == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(sizedpolytic);
		}
	}

	private Map<String, Object> viewData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<SizedPolytic> sizedpolyticList = new ArrayList<SizedPolytic>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			sizedpolyticList = sObjectListner.view(scrollableSettings.getSasUser(), sizedpolyticService.findAll(scrollableSettings));
			sizedpolyticList = sObjectListner.postView(scrollableSettings.getSasUser(), sizedpolyticList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to view sizedpolytic: " + e.getMessage());
		}
		
		if (sizedpolyticList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (sizedpolyticList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(sizedpolyticList);
		}
	}
	
	private Map<String, Object> viewScrollableData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<SizedPolytic> sizedpolyticList = new ArrayList<SizedPolytic>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			sizedpolyticList = sObjectListner.viewScrollable(scrollableSettings.getSasUser(), sizedpolyticService.findAllScrollable(scrollableSettings));
			sizedpolyticList = sObjectListner.postViewScrollable(scrollableSettings.getSasUser(), sizedpolyticList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewScrollable sizedpolytic: " + e.getMessage());
		}
		
		if (sizedpolyticList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (sizedpolyticList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(sizedpolyticList);
		}
	}

	private Map<String, Object> totalData(ScrollableSettings scrollableSettings){
		try {
			return JsonOutput.mapSingle(sizedpolyticService.total(scrollableSettings));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving total from database: " + e.getMessage());
		}
	}

}
