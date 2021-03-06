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
import org.test.webcam.model.domain.entity.PaymentPolytic;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.PaymentPolyticService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.util.SObjectListner;

@Controller
public class PaymentPolyticController implements Serializable {

	private static final long serialVersionUID = -1769288725913146L;

	@Autowired
	private PaymentPolyticService paymentpolyticService;
	@Autowired
	private SObjectListner sObjectListner;
	@Autowired
	private RestAuthentication restAuthentication;
	private Boolean debug = false;

	@CacheEvict(value = { 
		 "paymentpolytic_id"		, "paymentpolytic"		, "paymentpolytic_scrollable"
		,"paymentpolyticview_id"	, "paymentpolyticview"	, "paymentpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/paymentpolytic", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> createRest(@RequestBody PaymentPolytic data, Principal principal) throws Exception {
		return createData(data, JsonOutput.readSasUser(principal));		
	}
	
	@CacheEvict(value = { 
		 "paymentpolytic_id"		, "paymentpolytic"		, "paymentpolytic_scrollable"
		,"paymentpolyticview_id"	, "paymentpolyticview"	, "paymentpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/paymentpolytic", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'paymentpolytic')")
	public @ResponseBody Map<String, Object> createApi(@PathVariable String key, @RequestBody PaymentPolytic data) throws Exception {
		return createData(data, restAuthentication.readSasUser(key));		
	}
	
	@CacheEvict(value = { 
		 "paymentpolytic_id"		, "paymentpolytic"		, "paymentpolytic_scrollable"
		,"paymentpolyticview_id"	, "paymentpolyticview"	, "paymentpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/paymentpolytic", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> updateRest(@RequestBody PaymentPolytic data, Principal principal) throws Exception {
		return updateData(data, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "paymentpolytic_id"		, "paymentpolytic"		, "paymentpolytic_scrollable"
		,"paymentpolyticview_id"	, "paymentpolyticview"	, "paymentpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/paymentpolytic", method = RequestMethod.PUT, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'paymentpolytic')")
	public @ResponseBody Map<String, Object> updateApi(@PathVariable String key, @RequestBody PaymentPolytic data) throws Exception {
		return updateData(data, restAuthentication.readSasUser(key));
	}
	
	@CacheEvict(value = { 
		 "paymentpolytic_id"		, "paymentpolytic"		, "paymentpolytic_scrollable"
		,"paymentpolyticview_id"	, "paymentpolyticview"	, "paymentpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/data/paymentpolytic/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> deleteRest(@PathVariable Integer id, Principal principal) throws Exception {
		return deleteData(id, JsonOutput.readSasUser(principal));
	}
	
	@CacheEvict(value = { 
		 "paymentpolytic_id"		, "paymentpolytic"		, "paymentpolytic_scrollable"
		,"paymentpolyticview_id"	, "paymentpolyticview"	, "paymentpolyticview_scrollable" 
	}, allEntries = true)
	@RequestMapping(value = "/rest/{key}/paymentpolytic/{id}", method = RequestMethod.DELETE, produces = "application/json")
	@PreAuthorize(value = "hasPermission(#key, 'paymentpolytic')")
	public @ResponseBody Map<String, Object> deleteApi(@PathVariable String key, @PathVariable Integer id) throws Exception {
		return deleteData(id, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "paymentpolytic_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/paymentpolytic/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable Integer id, ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewByIdData(id, scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "paymentpolytic_id", key = "T(java.util.Objects).hash(#root.methodName, #id, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/paymentpolytic/{id}", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'paymentpolytic')")
	public @ResponseBody Map<String, Object> viewById(@PathVariable String key, @PathVariable Integer id, ScrollableSettings scrollableSettings) throws Exception {
		return viewByIdData(id, scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "paymentpolytic", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/paymentpolytic", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "paymentpolytic", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/paymentpolytic", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'paymentpolytic')")
	public @ResponseBody Map<String, Object> viewApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@Cacheable(value = "paymentpolytic_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/data/paymentpolytic/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> viewScrollableRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		return viewScrollableData(scrollableSettings, JsonOutput.readSasUser(principal));
	}
	
	@Cacheable(value = "paymentpolytic_scrollable", key = "T(java.util.Objects).hash(#root.methodName, #principal, #scrollableSettings)")
	@RequestMapping(value = "/rest/{key}/paymentpolytic/scrollable", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'paymentpolytic')")
	public @ResponseBody Map<String, Object> viewScrollableApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		return viewScrollableData(scrollableSettings, restAuthentication.readSasUser(key));
	}
	
	@RequestMapping(value = "/data/paymentpolytic/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> totalRest(ScrollableSettings scrollableSettings, Principal principal) throws Exception {
		scrollableSettings.setSasUser(JsonOutput.readSasUser(principal));
		return totalData(scrollableSettings);
	}
	
	@RequestMapping(value = "/rest/{key}/paymentpolytic/total", method = RequestMethod.GET)
	@PreAuthorize(value = "hasPermission(#key, 'paymentpolytic')")
	public @ResponseBody Map<String, Object> totalApi(@PathVariable String key, ScrollableSettings scrollableSettings) throws Exception {
		scrollableSettings.setSasUser(restAuthentication.readSasUser(key));
		return totalData(scrollableSettings);
	}
	
//		#-------------------------  LOGIC -------------------------

	private Map<String, Object> createData(PaymentPolytic data, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preCreate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.create(scrollableSettings.getSasUser(), paymentpolyticService.create(data.preInitList()));
			data = sObjectListner.postCreate(scrollableSettings.getSasUser(), data);
			
			return JsonOutput.map(data);
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while creating paymentpolytic: " + e.getMessage());
		}
	}
	
	private Map<String, Object> updateData(PaymentPolytic data, SasUser sasUser){
	
		PaymentPolytic paymentpolytic = null;
		try {
			if (debug) {
				return JsonOutput.map(data);
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			data = sObjectListner.preUpdate(scrollableSettings.getSasUser(), data);
			data = sObjectListner.update(scrollableSettings.getSasUser(), paymentpolyticService.update(data.preInitList()));
			data = sObjectListner.postUpdate(scrollableSettings.getSasUser(), data);
			paymentpolytic = data;
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to update paymentpolytic: " + e.getMessage());
		}
		
		if (paymentpolytic == null) {
			return JsonOutput.mapError("Cant find data");
		} else {
			return JsonOutput.mapSingle(paymentpolytic);
		}
	}
	
	private Map<String, Object> deleteData(Object id, SasUser sasUser){
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			ScrollableSettings scrollableSettings = new ScrollableSettings(sasUser);
			sObjectListner.preDelete(scrollableSettings.getSasUser(), PaymentPolytic.class, id);
			sObjectListner.delete(scrollableSettings.getSasUser(), paymentpolyticService.delete(id));
			sObjectListner.postDelete(scrollableSettings.getSasUser(), PaymentPolytic.class, id);
			
			return JsonOutput.mapSuccess();
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to delete paymentpolytic: " + e.getMessage());
		}
	}
	
	private Map<String, Object> viewByIdData(Object id, ScrollableSettings scrollableSettings, SasUser sasUser){
		PaymentPolytic paymentpolytic = null;
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			scrollableSettings.setId(id);
			paymentpolytic = sObjectListner.viewById(scrollableSettings.getSasUser(), paymentpolyticService.findById(scrollableSettings));
			paymentpolytic = sObjectListner.postViewById(scrollableSettings.getSasUser(), paymentpolytic);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewById paymentpolytic: " + e.getMessage());
		}
		
		if (paymentpolytic == null) {
			return JsonOutput.mapError("Error, Cant find data for " + id);
		} else {
			return JsonOutput.mapSingle(paymentpolytic);
		}
	}

	private Map<String, Object> viewData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<PaymentPolytic> paymentpolyticList = new ArrayList<PaymentPolytic>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			paymentpolyticList = sObjectListner.view(scrollableSettings.getSasUser(), paymentpolyticService.findAll(scrollableSettings));
			paymentpolyticList = sObjectListner.postView(scrollableSettings.getSasUser(), paymentpolyticList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to view paymentpolytic: " + e.getMessage());
		}
		
		if (paymentpolyticList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (paymentpolyticList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(paymentpolyticList);
		}
	}
	
	private Map<String, Object> viewScrollableData(ScrollableSettings scrollableSettings, SasUser sasUser){
		List<PaymentPolytic> paymentpolyticList = new ArrayList<PaymentPolytic>();
		try {
			if (debug) {
				return JsonOutput.mapSuccess();
			}

			scrollableSettings.setSasUser(sasUser);
			paymentpolyticList = sObjectListner.viewScrollable(scrollableSettings.getSasUser(), paymentpolyticService.findAllScrollable(scrollableSettings));
			paymentpolyticList = sObjectListner.postViewScrollable(scrollableSettings.getSasUser(), paymentpolyticList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error, trying to viewScrollable paymentpolytic: " + e.getMessage());
		}
		
		if (paymentpolyticList == null) {
			return JsonOutput.mapError("Error, Cant find data");
		} else if (paymentpolyticList.size() == 0) {
			return JsonOutput.mapWarning("Warning, Cant find data");
		} else {
			return JsonOutput.map(paymentpolyticList);
		}
	}

	private Map<String, Object> totalData(ScrollableSettings scrollableSettings){
		try {
			return JsonOutput.mapSingle(paymentpolyticService.total(scrollableSettings));
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while retrieving total from database: " + e.getMessage());
		}
	}

}
