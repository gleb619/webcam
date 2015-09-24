package org.test.webcam.util;

import org.apache.commons.codec.digest.DigestUtils;

public class SecurityUtils {

	public static String hash(String text) {
		return DigestUtils.sha256Hex(text);
	}
	
}
