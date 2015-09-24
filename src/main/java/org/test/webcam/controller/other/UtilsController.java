/*
 * 
 */
package org.test.webcam.controller.other;

import java.io.Serializable;
import java.security.Principal;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;






















import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.test.webcam.controller.data.types.JsonOutput;
import org.test.webcam.controller.data.types.Operation;
import org.test.webcam.controller.data.types.ScrollableSettings;
import org.test.webcam.controller.data.types.TimelineRequest;
import org.test.webcam.model.domain.entity.Settings;
import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.SettingsService;
import org.test.webcam.model.service.secure.RestAuthentication;
import org.test.webcam.model.service.secure.UserService;
import org.test.webcam.util.SObjectListner;
import org.test.webcam.util.listner.OperationListner;

// TODO: Auto-generated Javadoc
/**
 * The Class UtilsController.
 */
@Controller
public class UtilsController implements Serializable {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -809617992116533245L;
	
	/** The operation listner. */
	@Autowired
	private OperationListner operationListner;
	
	/** The message source. */
	@Autowired
    private MessageSource messageSource;
	
	/** The user service. */
	@Autowired
	private UserService userService;
	
	@Autowired
	private SObjectListner sObjectListner;
	
	@Autowired
	private RestAuthentication restAuthentication;
	
	@Autowired
	private SettingsService settingsService;
	
	@RequestMapping(value = "/api/{key}/access", method = RequestMethod.POST)
//	@RequestMapping(value = "/api/{key}/access", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	public @ResponseBody Map<String, Object> access(@PathVariable String key, @RequestBody(required = false) String data) throws Exception {
		System.out.println("UtilsController.access()#key: " + key);
		try {
			SasUser sasUser = restAuthentication.readSasUser(key);
			
			if (sasUser == null) {
				return JsonOutput.mapError("Access is denied");
			}
			else {
				return JsonOutput.mapSuccess();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while getting user: " + e.getLocalizedMessage());
		}
		
	}
	
	@RequestMapping(value = "/api/{key}/settings", method = RequestMethod.POST)
//	@RequestMapping(value = "/api/{key}/access", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	public @ResponseBody Map<String, Object> settings(@PathVariable String key, @RequestBody(required = false) String data) throws Exception {
		System.out.println("UtilsController.access()#key: " + key);
		try {
			SasUser sasUser = restAuthentication.readSasUser(key);
			List<Settings> settings = settingsService.findAll(new ScrollableSettings(sasUser));
			Map<String, String> mapSettings = new HashMap<String, String>();
			for (Settings setting : settings) {
				mapSettings.put(setting.getName(), setting.getValue());
			}
			
			
			if (sasUser == null) {
				return JsonOutput.mapError("Access is denied");
			}
			else {
				return JsonOutput.map(settings);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while getting user: " + e.getLocalizedMessage());
		}
		
	}
	
	/**
	 * Current user.
	 *
	 * @param data the data
	 * @param principal the principal
	 * @return the map
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/data/current-user", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> currentUser(@RequestBody String data, Principal principal) throws Exception {
		
		try {
			return JsonOutput.mapSingle(JsonOutput.readSasUser(principal).getUsername());
			
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while getting current user: "
					+ e.getLocalizedMessage());
		}
	}
	
	/**
	 * Operations.
	 *
	 * @param data the data
	 * @param principal the principal
	 * @return the map
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/data/operation", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@PreAuthorize(value = "hasRole('ROLE_USER')")
	public @ResponseBody Map<String, Object> operations(@RequestBody(required = false) Operation data,
			Principal principal) throws Exception {
		System.out.println("UtilsController.operations()#operation: " + data);
		try {

			return JsonOutput.mapSuccess();
			/*
			return JsonOutput.mapForOperationResult(
						operationListner.doOperation(data, JsonOutput.readSasUser(principal),
							ReqServHotel.class));
			 */
		} catch (Exception e) {
			e.printStackTrace();
			return JsonOutput.mapError("Error while executing operation: "
					+ e.getLocalizedMessage());
		}
	}
	
	/**
	 * Online users.
	 *
	 * @return the map
	 * @throws Exception the exception
	 */
	@RequestMapping(value = "/data/online-users", method = RequestMethod.GET)
	@PreAuthorize(value = "hasRole('ROLE_ADMIN')")
	public @ResponseBody Map<String, Object> onlineUsers() throws Exception {
		return JsonOutput.map(userService.getOnlineUsers());
	}
	
}
