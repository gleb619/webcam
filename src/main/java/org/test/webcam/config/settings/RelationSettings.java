package org.test.webcam.config.settings;

import java.util.Map;
import java.util.LinkedHashMap;

import org.test.webcam.model.domain.entity.*;
import org.test.webcam.model.domain.entity.view.*;

public interface RelationSettings {

	public class Items {
		public static final Map<String, Class<?>> map = new LinkedHashMap<String, Class<?>>() {
			private static final long serialVersionUID = -9314595277874698L;
			{
				put("paymentpolytic", PaymentPolytic.class);
				put("photo", Photo.class);
				put("relusersettings", RelUserSettings.class);
				put("settings", Settings.class);
				put("sizedpolytic", SizedPolytic.class);
				put("timedpolytic", TimedPolytic.class);
				put("tmuserinfo", TmUserInfo.class);
				put("userroles", UserRoles.class);
				put("users", Users.class);
				put("paymentpolyticview", PaymentPolyticView.class);
				put("photoview", PhotoView.class);
				put("relusersettingsview", RelUserSettingsView.class);
				put("settingsview", SettingsView.class);
				put("sizedpolyticview", SizedPolyticView.class);
				put("timedpolyticview", TimedPolyticView.class);
				put("tmuserinfoview", TmUserInfoView.class);
				put("userrolesview", UserRolesView.class);
				put("usersview", UsersView.class);;
			}
		};
	}
	
}
