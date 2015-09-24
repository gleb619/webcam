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
import org.test.webcam.model.domain.entity.Users;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.UsersService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.util.SObjectListner;

@Controller
public class UsersController implements Serializable {

	private static final long serialVersionUID = -2777616589562895L;

	@Autowired
	private UsersService usersService;
	@Autowired
	private SObjectListner sObjectListner;
	@Autowired
	private RestAuthentication restAuthentication;
	private Boolean debug = false;

	@CacheEvict(value = { 
		 "users_id"		, "users"		, "users_scrollable"
		,"usersview_id"	, "usersview"	, "usersview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/users", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> createRest(@RequestBody Users data, Principal principal) throws Exception {
		return createData(data, JsonOutput.readSasUser(principal));		
	}
	
	@CacheEvict(value = { 
		 "users_id"		, "users"		, "users_scrollable"
		,"usersview_id"	, "usersview"	, "usersview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/users", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'users')")
	public @ResponseBody Map<String, Object> createApi(@PathVariable String key, @RequestBody Users data) throws Exception {
		return createData(data, restAuthentication.readSasUser(key));		
	}
	
	@CacheEvict(value = { 
		 "users_id"		, "users"		, "users_scrollable"
		,"usersview_id"	, "usersview"	, "usersview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/users", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> updateRest(@RequestBody Users data, Principal principal) throws Exception {
		return updateData(data, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "users_id"		, "users"		, "users_scrollable"
		,"usersview_id"	, "usersview"	, "usersview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/users", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'users')")
	public @ResponseBody Map<String, Object> updateApi(@PathVariable String key, @RequestBody Users data) throws Exception {
		return updateData(data, restAuthentication.readSasUser(key));
	}
	
	@CacheEvict(value = { 
		 "users_id"		, "users"		, "users_scrollable"
		,"usersview_id"	, "usersview"	, "usersview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/users/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> deleteRest(@PathVariable Integer id, Principal principal) throws Exception {
		return deleteData(id, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "users_id"		, "users"		, "users_scrollable"
		,"usersview_id"	, "usersview"	, "usersview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/users/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'users')")
	public @ResponseBody Map<String, Object> deleteApi(@PathVariable String key, @PathVariable Integer id) throws Exception {
		return deleteData(id, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "users_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/users/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable Integer id, ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewByIdData(id, scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "users_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/users/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'users')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable String key, @PathVariable Integer id, ScrollableSettings scrollableSettings) throws Exception {
		return viewByIdData(id, scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "users", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/users", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "users", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/users", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'users')")
	public @ResponseBody Map<String, Object> viewApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "users_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/users/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollableRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewScrollableData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "users_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/users/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'users')")
	public @ResponseBody Map<String, Object> viewScrollableApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewScrollableData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@RequestMapping(value = "/data/users/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> totalRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		scrollableSettings.setSasUser(JsonOutput.readSasUser(principal));
		return totalData(scrollableSettings);
	}
	
	@RequestMapping(value = "/rest/{key}/users/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'users')")
	public @ResponseBody Map<String, Object> totalApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		scrollableSettings.setSasUser(restAuthentication.readSasUser(key));
		return totalData(scrollableSettings);
	}
	
//		#-------------------------  LOGIC -------------------------

	private Map<String, Object> createData(Users data, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preCreate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.create(scrollableSettings.getSasUser(), usersService.create(data.preInitList()));
			data = sObjectListner.postCreate(scrollableSettings.getSasUser(), data);
			
			return JsonOutput.map(data);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while creating users: " + e.getMessage());
		}
	}
	
	private Map<String, Object> updateData(Users data, SasUser sasUser){
	
		Users users = null;
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preUpdate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.update(scrollableSettings.getSasUser(), usersService.update(data.preInitList()));
			data = sObjectListner.postUpdate(scrollableSettings.getSasUser(), data);
			users = data;
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to update users: " + e.getMessage());
		}
		
		if (users == null) {
			return JsonOutput.mapError("Cant find data");
		} else {
			return JsonOutput.mapSingle(users);
		}
	}
	
	private Map<String, Object> deleteData(Object id, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			sObjectListner.preDelete(scrollableSettings.getSasUser(), Users.class, id);
			sObjectListner.delete(scrollableSettings.getSasUser(), usersService.delete(id));
			sObjectListner.postDelete(scrollableSettings.getSasUser(), Users.class, id);
			
			return JsonOutput.mapSuccess();
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to delete users: " + e.getMessage());
		}
	}
	
	private Map<String, Object> viewByIdData(Object id, ScrollableSettings scrollableSettings, SasUser sasUser){
		Users users = null;
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			scrollableSettings.setId(id);
			users = sObjectListner.viewById(scrollableSettings.getSasUser(), usersService.findById(scrollableSettings));
			users = sObjectListner.postViewById(scrollableSettings.getSasUser(), users);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewById users: " + e.getMessage());
		}
		
		if (users == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(users);
		}
	}

	private Map<String, Object> viewData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<Users> usersList = new ArrayList<Users>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			usersList = sObjectListner.view(scrollableSettings.getSasUser(), usersService.findAll(scrollableSettings));
			usersList = sObjectListner.postView(scrollableSettings.getSasUser(), usersList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to view users: " + e.getMessage());
		}
		
		if (usersList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (usersList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(usersList);
		}
	}
	
	private Map<String, Object> viewScrollableData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<Users> usersList = new ArrayList<Users>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			usersList = sObjectListner.viewScrollable(scrollableSettings.getSasUser(), usersService.findAllScrollable(scrollableSettings));
			usersList = sObjectListner.postViewScrollable(scrollableSettings.getSasUser(), usersList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewScrollable users: " + e.getMessage());
		}
		
		if (usersList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (usersList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(usersList);
		}
	}

	private Map<String, Object> totalData(ScrollableSettings scrollableSettings){
		try {
			return JsonOutput.mapSingle(usersService.total(scrollableSettings));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving total from database: " + e.getMessage());
		}
	}

}
