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
import org.test.webcam.model.domain.entity.TmUserInfo;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.TmUserInfoService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.util.SObjectListner;

@Controller
public class TmUserInfoController implements Serializable {

	private static final long serialVersionUID = -7294163264959274L;

	@Autowired
	private TmUserInfoService tmuserinfoService;
	@Autowired
	private SObjectListner sObjectListner;
	@Autowired
	private RestAuthentication restAuthentication;
	private Boolean debug = false;

	@CacheEvict(value = { 
		 "tmuserinfo_id"		, "tmuserinfo"		, "tmuserinfo_scrollable"
		,"tmuserinfoview_id"	, "tmuserinfoview"	, "tmuserinfoview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/tmuserinfo", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> createRest(@RequestBody TmUserInfo data, Principal principal) throws Exception {
		return createData(data, JsonOutput.readSasUser(principal));		
	}
	
	@CacheEvict(value = { 
		 "tmuserinfo_id"		, "tmuserinfo"		, "tmuserinfo_scrollable"
		,"tmuserinfoview_id"	, "tmuserinfoview"	, "tmuserinfoview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/tmuserinfo", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'tmuserinfo')")
	public @ResponseBody Map<String, Object> createApi(@PathVariable String key, @RequestBody TmUserInfo data) throws Exception {
		return createData(data, restAuthentication.readSasUser(key));		
	}
	
	@CacheEvict(value = { 
		 "tmuserinfo_id"		, "tmuserinfo"		, "tmuserinfo_scrollable"
		,"tmuserinfoview_id"	, "tmuserinfoview"	, "tmuserinfoview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/tmuserinfo", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> updateRest(@RequestBody TmUserInfo data, Principal principal) throws Exception {
		return updateData(data, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "tmuserinfo_id"		, "tmuserinfo"		, "tmuserinfo_scrollable"
		,"tmuserinfoview_id"	, "tmuserinfoview"	, "tmuserinfoview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/tmuserinfo", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'tmuserinfo')")
	public @ResponseBody Map<String, Object> updateApi(@PathVariable String key, @RequestBody TmUserInfo data) throws Exception {
		return updateData(data, restAuthentication.readSasUser(key));
	}
	
	@CacheEvict(value = { 
		 "tmuserinfo_id"		, "tmuserinfo"		, "tmuserinfo_scrollable"
		,"tmuserinfoview_id"	, "tmuserinfoview"	, "tmuserinfoview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/tmuserinfo/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> deleteRest(@PathVariable Integer id, Principal principal) throws Exception {
		return deleteData(id, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "tmuserinfo_id"		, "tmuserinfo"		, "tmuserinfo_scrollable"
		,"tmuserinfoview_id"	, "tmuserinfoview"	, "tmuserinfoview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/tmuserinfo/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'tmuserinfo')")
	public @ResponseBody Map<String, Object> deleteApi(@PathVariable String key, @PathVariable Integer id) throws Exception {
		return deleteData(id, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "tmuserinfo_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/tmuserinfo/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable Integer id, ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewByIdData(id, scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "tmuserinfo_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/tmuserinfo/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'tmuserinfo')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable String key, @PathVariable Integer id, ScrollableSettings scrollableSettings) throws Exception {
		return viewByIdData(id, scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "tmuserinfo", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/tmuserinfo", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "tmuserinfo", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/tmuserinfo", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'tmuserinfo')")
	public @ResponseBody Map<String, Object> viewApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "tmuserinfo_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/tmuserinfo/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollableRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewScrollableData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "tmuserinfo_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/tmuserinfo/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'tmuserinfo')")
	public @ResponseBody Map<String, Object> viewScrollableApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewScrollableData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@RequestMapping(value = "/data/tmuserinfo/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> totalRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		scrollableSettings.setSasUser(JsonOutput.readSasUser(principal));
		return totalData(scrollableSettings);
	}
	
	@RequestMapping(value = "/rest/{key}/tmuserinfo/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'tmuserinfo')")
	public @ResponseBody Map<String, Object> totalApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		scrollableSettings.setSasUser(restAuthentication.readSasUser(key));
		return totalData(scrollableSettings);
	}
	
//		#-------------------------  LOGIC -------------------------

	private Map<String, Object> createData(TmUserInfo data, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preCreate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.create(scrollableSettings.getSasUser(), tmuserinfoService.create(data.preInitList()));
			data = sObjectListner.postCreate(scrollableSettings.getSasUser(), data);
			
			return JsonOutput.map(data);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while creating tmuserinfo: " + e.getMessage());
		}
	}
	
	private Map<String, Object> updateData(TmUserInfo data, SasUser sasUser){
	
		TmUserInfo tmuserinfo = null;
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preUpdate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.update(scrollableSettings.getSasUser(), tmuserinfoService.update(data.preInitList()));
			data = sObjectListner.postUpdate(scrollableSettings.getSasUser(), data);
			tmuserinfo = data;
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to update tmuserinfo: " + e.getMessage());
		}
		
		if (tmuserinfo == null) {
			return JsonOutput.mapError("Cant find data");
		} else {
			return JsonOutput.mapSingle(tmuserinfo);
		}
	}
	
	private Map<String, Object> deleteData(Object id, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			sObjectListner.preDelete(scrollableSettings.getSasUser(), TmUserInfo.class, id);
			sObjectListner.delete(scrollableSettings.getSasUser(), tmuserinfoService.delete(id));
			sObjectListner.postDelete(scrollableSettings.getSasUser(), TmUserInfo.class, id);
			
			return JsonOutput.mapSuccess();
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to delete tmuserinfo: " + e.getMessage());
		}
	}
	
	private Map<String, Object> viewByIdData(Object id, ScrollableSettings scrollableSettings, SasUser sasUser){
		TmUserInfo tmuserinfo = null;
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			scrollableSettings.setId(id);
			tmuserinfo = sObjectListner.viewById(scrollableSettings.getSasUser(), tmuserinfoService.findById(scrollableSettings));
			tmuserinfo = sObjectListner.postViewById(scrollableSettings.getSasUser(), tmuserinfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewById tmuserinfo: " + e.getMessage());
		}
		
		if (tmuserinfo == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(tmuserinfo);
		}
	}

	private Map<String, Object> viewData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<TmUserInfo> tmuserinfoList = new ArrayList<TmUserInfo>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			tmuserinfoList = sObjectListner.view(scrollableSettings.getSasUser(), tmuserinfoService.findAll(scrollableSettings));
			tmuserinfoList = sObjectListner.postView(scrollableSettings.getSasUser(), tmuserinfoList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to view tmuserinfo: " + e.getMessage());
		}
		
		if (tmuserinfoList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (tmuserinfoList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(tmuserinfoList);
		}
	}
	
	private Map<String, Object> viewScrollableData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<TmUserInfo> tmuserinfoList = new ArrayList<TmUserInfo>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			tmuserinfoList = sObjectListner.viewScrollable(scrollableSettings.getSasUser(), tmuserinfoService.findAllScrollable(scrollableSettings));
			tmuserinfoList = sObjectListner.postViewScrollable(scrollableSettings.getSasUser(), tmuserinfoList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewScrollable tmuserinfo: " + e.getMessage());
		}
		
		if (tmuserinfoList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (tmuserinfoList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(tmuserinfoList);
		}
	}

	private Map<String, Object> totalData(ScrollableSettings scrollableSettings){
		try {
			return JsonOutput.mapSingle(tmuserinfoService.total(scrollableSettings));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving total from database: " + e.getMessage());
		}
	}

}
