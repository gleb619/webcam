package org.test.webcam.util;

import java.text.SimpleDateFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.List;
import java.util.LinkedList;
import java.util.LinkedHashMap;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.test.webcam.model.domain.SDict;
import org.test.webcam.model.domain.SEntity;
import org.test.webcam.model.domain.SObject;
import org.test.webcam.model.domain.entity.*;
import org.test.webcam.model.service.*;
import org.test.webcam.util.data.types.FilesSettings;

import com.github.javafaker.Faker;

@Component
public class MockupUtil {

	private Map<String, List<?>> listStorage = new LinkedHashMap<String, List<?>>();
	private String defaultDocumentsPath = "D:/TEST_DOCUMENTS";
	private String defaultImagePath = "D:/HOTELS_IMAGE";
	private Map<Class<?>, String> staticListConfig = new HashMap<Class<?>, String>();
	private Map<Class<?>, List<String>> staticList = new HashMap<Class<?>, List<String>>();
	private List<Path> documents = new LinkedList<Path>();
	private List<Path> images = new LinkedList<Path>(); 
	private String output = "";
	private int itemCount = 10;
	public Integer firmid = 1;
	private Boolean traceFlag = true;
	private Boolean sync = true;
	private String serieskey = UUID.randomUUID().toString();

	@Autowired
	private UsersService _usersService;
	@Autowired
	private FilesSettings imageSettings;
	@Autowired
	private MessageSource messageSource;

	public MockupUtil() {
		super();
		
		Thread staticListThread = new Thread(() -> {
			staticListConfig.forEach((key, value) -> {
				try {
					staticList.put(key, readStaticList(value));
				} catch (Exception e) {
					e.printStackTrace();
				}
			});
		});
		
		staticListThread.start();
		
		Thread thread = new Thread(() -> {
			try {
				images = getFileList(defaultImagePath);
			} catch (IOException e) {
				System.err.println("Cannot find: " + defaultImagePath + ", error: " + e.getLocalizedMessage());
			}
			
			try {
				documents = getFileList(defaultDocumentsPath);
			} catch (IOException e) {
				System.err.println("Cannot find: " + defaultDocumentsPath + ", error: " + e.getLocalizedMessage());
			}
		});
		
		thread.start();
	}

	private List<Path> getFileList(String path) throws IOException {
		List<Path> list = new LinkedList<Path>();
		
		Files.walk(Paths.get(path)).forEach(filePath -> {
		    if (Files.isRegularFile(filePath)) {
		        list.add(filePath);
		    }
		});
		
		return list;
	}

	private List<String> readStaticList(String path) throws IOException {
		String content = new String(Files.readAllBytes(Paths.get(path)), "UTF-8");
		return new ArrayList(Arrays.asList(content.split("\n")));
	}

	private Date randomDate() {
		GregorianCalendar gc = new GregorianCalendar();
		int year = randBetween(1900, 2010);
		gc.set(Calendar.YEAR, year);
		int dayOfYear = randBetween(1, gc.getActualMaximum(Calendar.DAY_OF_YEAR));
		gc.set(Calendar.DAY_OF_YEAR, dayOfYear);
		return gc.getTime();
	}
	
	public int randBetween(int start, int end) {
		return start + (int) Math.round(Math.random() * (end - start));
	}
	
	public BigDecimal randBetweenDecimal (Integer start, Integer end) {
		return new BigDecimal(start + (int) Math.round(Math.random() * (end - start))); 
	}
	
	public Boolean randomBoolean() {
		if ((randBetween(1, 100) % 2) == 0) {
			return true;
		}
		else{
			return false;
		}
	}

	private synchronized String randomStringStaticValue(Class<?> clazz) {
		if(staticList.containsKey(clazz)){
			String element = readRandom(staticList.get(clazz));
			if (element != null) {
				staticList.get(clazz).remove(element);
				return element;
			}
			else {
				if (randomBoolean()) {
					return new Faker().name().lastName() + new Faker().address().cityPrefix();
				}
				
				return new Faker().lorem().fixedString(randBetween(10, 30));
			}
		}
		
		return new Faker().lorem().fixedString(randBetween(10, 30));
	}
	
	private synchronized <T> T readRandom(List<T> list) {
		if (list.size() > 0) {
			return (T) list.get(randBetween(0, list.size() - 1));
		}
		
		return null;
	}

	private synchronized List checkListStorage(String arg0) {
		if(listStorage.containsKey(arg0)){
			List<?> result = new LinkedList<>();
			result = listStorage.get(arg0);
			listStorage.remove(arg0);
			return result;
		}
		
		return new LinkedList<>();
	}

	private synchronized List addListStorage(String arg0, List arg1) {
		listStorage.put(arg0, arg1);
		return arg1;
	}

	private <T> T postCheck(T object, Faker faker) {
		
		
		return (T) object;
	}
	
	public String randomCityName(Faker faker){
		String cityName = "";
		if (randomBoolean()) {
			cityName = faker.address().cityPrefix();
		}
		
		if (randomBoolean()) {
			cityName += faker.address().firstName();
		}
		else {
			cityName += faker.address().lastName();
		}
		
		if (randomBoolean()) {
			cityName += faker.address().citySuffix();
		}
		
		return cityName;
	}

	public Object checkForSentity(Object arg, Faker faker) {
		if (arg instanceof SObject) {
			((SObject) arg).setCreateon(randomDate());	
			((SObject) arg).setFirmid(firmid);	
			((SObject) arg).setModifyon(randomDate());	
			((SObject) arg).setSerieskey(serieskey);
		}
		
		if (arg instanceof SEntity) {
			((SEntity) arg).setLabel(faker.lorem().fixedString(randBetween(10, 30)));
		}
		
		if (arg instanceof SDict) {
			((SDict) arg).setLabel(faker.lorem().fixedString(randBetween(10, 30)));
		}
		
		return arg;
	}

	public int getItemCount() {
		return itemCount;
	}
	
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	
	public synchronized String getOutput() {
		return output;
	}

	public synchronized void setOutput(String output) {
		this.output = getOutput() + output;
	}

	public void reset() {

		PaymentPolyticFlag = false;
		PhotoFlag = false;
		RelUserSettingsFlag = false;
		SettingsFlag = false;
		SizedPolyticFlag = false;
		TimedPolyticFlag = false;
		TmUserInfoFlag = false;

	}

	private Boolean PaymentPolyticFlag = false;
	private Boolean PhotoFlag = false;
	private Boolean RelUserSettingsFlag = false;
	private Boolean SettingsFlag = false;
	private Boolean SizedPolyticFlag = false;
	private Boolean TimedPolyticFlag = false;
	private Boolean TmUserInfoFlag = false;

	@Autowired
	private PaymentPolyticService paymentpolyticService;

	public String mockupForPaymentPolytic() {
		if(traceFlag){
			System.out.println("MockupUtil.mockupForPaymentPolytic()");
		}
	
		if(PaymentPolyticFlag){
			return ", { \"text\":\"Data for PaymentPolytic already generated\" }";
		}
		Faker faker = new Faker();
			try {
				PaymentPolytic paymentpolytic = new PaymentPolytic();
				checkForSentity(paymentpolytic, faker);
	
			//SizedPolytic mockup start
			List<SizedPolytic> list_1067047906_53 = checkListStorage("SizedPolytic");
			SizedPolytic sizedpolytic = null;
			if(list_1067047906_53.size() == 0){
				mockupForSizedPolytic();
				list_1067047906_53 = addListStorage("SizedPolytic", sizedpolyticService.findAll());
			}
			if(list_1067047906_53.size() > 0){
				sizedpolytic = list_1067047906_53.get(randBetween(0, list_1067047906_53.size() - 1));
			}
			//SizedPolytic mockup end

			paymentpolytic.setSizedPolytic(sizedpolytic);	
			//TimedPolytic mockup start
			List<TimedPolytic> list_2020335690_9040 = checkListStorage("TimedPolytic");
			TimedPolytic timedpolytic = null;
			if(list_2020335690_9040.size() == 0){
				mockupForTimedPolytic();
				list_2020335690_9040 = addListStorage("TimedPolytic", timedpolyticService.findAll());
			}
			if(list_2020335690_9040.size() > 0){
				timedpolytic = list_2020335690_9040.get(randBetween(0, list_2020335690_9040.size() - 1));
			}
			//TimedPolytic mockup end

			paymentpolytic.setTimedPolytic(timedpolytic);	
			paymentpolytic.setName(faker.lorem().fixedString(randBetween(10, 30)));
	
				paymentpolyticService.create(postCheck(paymentpolytic, faker));
			} catch (Exception e) {
				e.printStackTrace();
				return ", { \"text\":\"Exception wile creating PaymentPolytic: " + 
						e.getLocalizedMessage() + " \" }";
			}
	
		PaymentPolyticFlag = true;
	
		return ", { \"text\":\"Generation data for PaymentPolytic is done\" }";
	}

	@Autowired
	private PhotoService photoService;

	public String mockupForPhoto() {
		if(traceFlag){
			System.out.println("MockupUtil.mockupForPhoto()");
		}
	
		if(PhotoFlag){
			return ", { \"text\":\"Data for Photo already generated\" }";
		}
		Faker faker = new Faker();
			try {
				Photo photo = new Photo();
				checkForSentity(photo, faker);
	
			photo.setName(faker.lorem().fixedString(randBetween(10, 30)));	
			photo.setPath(faker.lorem().fixedString(randBetween(10, 30)));
	
				photoService.create(postCheck(photo, faker));
			} catch (Exception e) {
				e.printStackTrace();
				return ", { \"text\":\"Exception wile creating Photo: " + 
						e.getLocalizedMessage() + " \" }";
			}
	
		PhotoFlag = true;
	
		return ", { \"text\":\"Generation data for Photo is done\" }";
	}

	@Autowired
	private RelUserSettingsService relusersettingsService;

	public String mockupForRelUserSettings() {
		if(traceFlag){
			System.out.println("MockupUtil.mockupForRelUserSettings()");
		}
	
		if(RelUserSettingsFlag){
			return ", { \"text\":\"Data for RelUserSettings already generated\" }";
		}
		Faker faker = new Faker();
			try {
				RelUserSettings relusersettings = new RelUserSettings();
				checkForSentity(relusersettings, faker);
	
			//Settings mockup start
			List<Settings> list1571350886_91 = checkListStorage("Settings");
			Settings settings = null;
			if(list1571350886_91.size() == 0){
				mockupForSettings();
				list1571350886_91 = addListStorage("Settings", settingsService.findAll());
			}
			if(list1571350886_91.size() > 0){
				settings = list1571350886_91.get(randBetween(0, list1571350886_91.size() - 1));
			}
			//Settings mockup end

			relusersettings.setSettings(settings);	
			//Users mockup start
			List<Users> list207708448_6529 = _usersService.findAll();
			Users users = null;
			if(list207708448_6529.size() > 0){
				users = list207708448_6529.get(randBetween(0, list207708448_6529.size() - 1));
			}
			//Users mockup end

			relusersettings.setUsers(users);
	
				relusersettingsService.create(postCheck(relusersettings, faker));
			} catch (Exception e) {
				e.printStackTrace();
				return ", { \"text\":\"Exception wile creating RelUserSettings: " + 
						e.getLocalizedMessage() + " \" }";
			}
	
		RelUserSettingsFlag = true;
	
		return ", { \"text\":\"Generation data for RelUserSettings is done\" }";
	}

	@Autowired
	private SettingsService settingsService;

	public String mockupForSettings() {
		if(traceFlag){
			System.out.println("MockupUtil.mockupForSettings()");
		}
	
		if(SettingsFlag){
			return ", { \"text\":\"Data for Settings already generated\" }";
		}
		Faker faker = new Faker();
			try {
				Settings settings = new Settings();
				checkForSentity(settings, faker);
	
			settings.setName(faker.lorem().fixedString(randBetween(10, 30)));	
			settings.setValue(faker.lorem().fixedString(randBetween(10, 30)));
	
				settingsService.create(postCheck(settings, faker));
			} catch (Exception e) {
				e.printStackTrace();
				return ", { \"text\":\"Exception wile creating Settings: " + 
						e.getLocalizedMessage() + " \" }";
			}
	
		SettingsFlag = true;
	
		return ", { \"text\":\"Generation data for Settings is done\" }";
	}

	@Autowired
	private SizedPolyticService sizedpolyticService;

	public String mockupForSizedPolytic() {
		if(traceFlag){
			System.out.println("MockupUtil.mockupForSizedPolytic()");
		}
	
		if(SizedPolyticFlag){
			return ", { \"text\":\"Data for SizedPolytic already generated\" }";
		}
		Faker faker = new Faker();
			try {
				SizedPolytic sizedpolytic = new SizedPolytic();
				checkForSentity(sizedpolytic, faker);
	
			sizedpolytic.setName(faker.lorem().fixedString(randBetween(10, 30)));	
			sizedpolytic.setSize(randBetween(1, itemCount));
	
				sizedpolyticService.create(postCheck(sizedpolytic, faker));
			} catch (Exception e) {
				e.printStackTrace();
				return ", { \"text\":\"Exception wile creating SizedPolytic: " + 
						e.getLocalizedMessage() + " \" }";
			}
	
		SizedPolyticFlag = true;
	
		return ", { \"text\":\"Generation data for SizedPolytic is done\" }";
	}

	@Autowired
	private TimedPolyticService timedpolyticService;

	public String mockupForTimedPolytic() {
		if(traceFlag){
			System.out.println("MockupUtil.mockupForTimedPolytic()");
		}
	
		if(TimedPolyticFlag){
			return ", { \"text\":\"Data for TimedPolytic already generated\" }";
		}
		Faker faker = new Faker();
			try {
				TimedPolytic timedpolytic = new TimedPolytic();
				checkForSentity(timedpolytic, faker);
	
			timedpolytic.setName(faker.lorem().fixedString(randBetween(10, 30)));	
			timedpolytic.setNumberOfDays(randBetween(1, itemCount));
	
				timedpolyticService.create(postCheck(timedpolytic, faker));
			} catch (Exception e) {
				e.printStackTrace();
				return ", { \"text\":\"Exception wile creating TimedPolytic: " + 
						e.getLocalizedMessage() + " \" }";
			}
	
		TimedPolyticFlag = true;
	
		return ", { \"text\":\"Generation data for TimedPolytic is done\" }";
	}

	@Autowired
	private TmUserInfoService tmuserinfoService;

	public String mockupForTmUserInfo() {
		if(traceFlag){
			System.out.println("MockupUtil.mockupForTmUserInfo()");
		}
	
		if(TmUserInfoFlag){
			return ", { \"text\":\"Data for TmUserInfo already generated\" }";
		}
		Faker faker = new Faker();
			try {
				TmUserInfo tmuserinfo = new TmUserInfo();
				checkForSentity(tmuserinfo, faker);
	
			tmuserinfo.setBrowser(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setBrowserVersion(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setLastLogin(randomDate());	
			tmuserinfo.setPlatform(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setPlatformversion(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setProxyContent(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setRemoteHost(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setUserAgent(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setUserIpAddress(faker.lorem().fixedString(randBetween(10, 30)));	
			tmuserinfo.setUsername(faker.lorem().fixedString(randBetween(10, 30)));
	
				tmuserinfoService.create(postCheck(tmuserinfo, faker));
			} catch (Exception e) {
				e.printStackTrace();
				return ", { \"text\":\"Exception wile creating TmUserInfo: " + 
						e.getLocalizedMessage() + " \" }";
			}
	
		TmUserInfoFlag = true;
	
		return ", { \"text\":\"Generation data for TmUserInfo is done\" }";
	}


	public String init(Integer itemCount) {
		this.itemCount = itemCount;
		String output = "";
		
		setOutput(mockupForPaymentPolytic());
		setOutput(mockupForPhoto());
		setOutput(mockupForRelUserSettings());
		setOutput(mockupForSettings());
		setOutput(mockupForSizedPolytic());
		setOutput(mockupForTimedPolytic());
		setOutput(mockupForTmUserInfo());

		
		if (output.length() > 1) {
			return "[ " + output.substring(1) + " ]";
		}
		return "[ Please wait ]";
	}

}