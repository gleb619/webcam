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
import org.test.webcam.model.domain.entity.Settings;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.SettingsService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.util.SObjectListner;

@Controller
public class SettingsController implements Serializable {

	private static final long serialVersionUID = -8192727977316571L;

	@Autowired
	private SettingsService settingsService;
	@Autowired
	private SObjectListner sObjectListner;
	@Autowired
	private RestAuthentication restAuthentication;
	private Boolean debug = false;

	@CacheEvict(value = { 
		 "settings_id"		, "settings"		, "settings_scrollable"
		,"settingsview_id"	, "settingsview"	, "settingsview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/settings", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> createRest(@RequestBody Settings data, Principal principal) throws Exception {
		return createData(data, JsonOutput.readSasUser(principal));		
	}
	
	@CacheEvict(value = { 
		 "settings_id"		, "settings"		, "settings_scrollable"
		,"settingsview_id"	, "settingsview"	, "settingsview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/settings", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'settings')")
	public @ResponseBody Map<String, Object> createApi(@PathVariable String key, @RequestBody Settings data) throws Exception {
		return createData(data, restAuthentication.readSasUser(key));		
	}
	
	@CacheEvict(value = { 
		 "settings_id"		, "settings"		, "settings_scrollable"
		,"settingsview_id"	, "settingsview"	, "settingsview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/settings", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> updateRest(@RequestBody Settings data, Principal principal) throws Exception {
		return updateData(data, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "settings_id"		, "settings"		, "settings_scrollable"
		,"settingsview_id"	, "settingsview"	, "settingsview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/settings", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'settings')")
	public @ResponseBody Map<String, Object> updateApi(@PathVariable String key, @RequestBody Settings data) throws Exception {
		return updateData(data, restAuthentication.readSasUser(key));
	}
	
	@CacheEvict(value = { 
		 "settings_id"		, "settings"		, "settings_scrollable"
		,"settingsview_id"	, "settingsview"	, "settingsview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/settings/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> deleteRest(@PathVariable Integer id, Principal principal) throws Exception {
		return deleteData(id, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "settings_id"		, "settings"		, "settings_scrollable"
		,"settingsview_id"	, "settingsview"	, "settingsview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/settings/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'settings')")
	public @ResponseBody Map<String, Object> deleteApi(@PathVariable String key, @PathVariable Integer id) throws Exception {
		return deleteData(id, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "settings_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/settings/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable Integer id, ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewByIdData(id, scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "settings_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/settings/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'settings')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable String key, @PathVariable Integer id, ScrollableSettings scrollableSettings) throws Exception {
		return viewByIdData(id, scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "settings", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/settings", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "settings", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/settings", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'settings')")
	public @ResponseBody Map<String, Object> viewApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "settings_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/settings/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollableRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewScrollableData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "settings_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/settings/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'settings')")
	public @ResponseBody Map<String, Object> viewScrollableApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewScrollableData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@RequestMapping(value = "/data/settings/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> totalRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		scrollableSettings.setSasUser(JsonOutput.readSasUser(principal));
		return totalData(scrollableSettings);
	}
	
	@RequestMapping(value = "/rest/{key}/settings/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'settings')")
	public @ResponseBody Map<String, Object> totalApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		scrollableSettings.setSasUser(restAuthentication.readSasUser(key));
		return totalData(scrollableSettings);
	}
	
//		#-------------------------  LOGIC -------------------------

	private Map<String, Object> createData(Settings data, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preCreate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.create(scrollableSettings.getSasUser(), settingsService.create(data.preInitList()));
			data = sObjectListner.postCreate(scrollableSettings.getSasUser(), data);
			
			return JsonOutput.map(data);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while creating settings: " + e.getMessage());
		}
	}
	
	private Map<String, Object> updateData(Settings data, SasUser sasUser){
	
		Settings settings = null;
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preUpdate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.update(scrollableSettings.getSasUser(), settingsService.update(data.preInitList()));
			data = sObjectListner.postUpdate(scrollableSettings.getSasUser(), data);
			settings = data;
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to update settings: " + e.getMessage());
		}
		
		if (settings == null) {
			return JsonOutput.mapError("Cant find data");
		} else {
			return JsonOutput.mapSingle(settings);
		}
	}
	
	private Map<String, Object> deleteData(Object id, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			sObjectListner.preDelete(scrollableSettings.getSasUser(), Settings.class, id);
			sObjectListner.delete(scrollableSettings.getSasUser(), settingsService.delete(id));
			sObjectListner.postDelete(scrollableSettings.getSasUser(), Settings.class, id);
			
			return JsonOutput.mapSuccess();
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to delete settings: " + e.getMessage());
		}
	}
	
	private Map<String, Object> viewByIdData(Object id, ScrollableSettings scrollableSettings, SasUser sasUser){
		Settings settings = null;
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			scrollableSettings.setId(id);
			settings = sObjectListner.viewById(scrollableSettings.getSasUser(), settingsService.findById(scrollableSettings));
			settings = sObjectListner.postViewById(scrollableSettings.getSasUser(), settings);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewById settings: " + e.getMessage());
		}
		
		if (settings == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(settings);
		}
	}

	private Map<String, Object> viewData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<Settings> settingsList = new ArrayList<Settings>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			settingsList = sObjectListner.view(scrollableSettings.getSasUser(), settingsService.findAll(scrollableSettings));
			settingsList = sObjectListner.postView(scrollableSettings.getSasUser(), settingsList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to view settings: " + e.getMessage());
		}
		
		if (settingsList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (settingsList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(settingsList);
		}
	}
	
	private Map<String, Object> viewScrollableData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<Settings> settingsList = new ArrayList<Settings>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			settingsList = sObjectListner.viewScrollable(scrollableSettings.getSasUser(), settingsService.findAllScrollable(scrollableSettings));
			settingsList = sObjectListner.postViewScrollable(scrollableSettings.getSasUser(), settingsList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewScrollable settings: " + e.getMessage());
		}
		
		if (settingsList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (settingsList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(settingsList);
		}
	}

	private Map<String, Object> totalData(ScrollableSettings scrollableSettings){
		try {
			return JsonOutput.mapSingle(settingsService.total(scrollableSettings));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving total from database: " + e.getMessage());
		}
	}

}
