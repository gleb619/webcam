package org.test.webcam.config.settings;

import java.util.LinkedList;

public interface CacheSettings {

	public class Items {
		public static final LinkedList<String> list = new LinkedList<String>() {
			private static final long serialVersionUID = 7602621465003622263L;
			{

				add("photo");
				add("photo_id");
				add("photo_scrollable");

				add("relusersettings");
				add("relusersettings_id");
				add("relusersettings_scrollable");

				add("settings");
				add("settings_id");
				add("settings_scrollable");

				add("tmuserinfo");
				add("tmuserinfo_id");
				add("tmuserinfo_scrollable");

				add("userroles");
				add("userroles_id");
				add("userroles_scrollable");

				add("users");
				add("users_id");
				add("users_scrollable");

				add("photoview");
				add("photoview_id");
				add("photoview_scrollable");

				add("relusersettingsview");
				add("relusersettingsview_id");
				add("relusersettingsview_scrollable");

				add("settingsview");
				add("settingsview_id");
				add("settingsview_scrollable");

				add("tmuserinfoview");
				add("tmuserinfoview_id");
				add("tmuserinfoview_scrollable");

				add("userrolesview");
				add("userrolesview_id");
				add("userrolesview_scrollable");

				add("usersview");
				add("usersview_id");
				add("usersview_scrollable");
;
			}
		};

	}

}
