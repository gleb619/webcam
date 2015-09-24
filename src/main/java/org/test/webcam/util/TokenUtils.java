package org.test.webcam.util;

import org.test.webcam.model.domain.entity.secure.SasUser;
import org.test.webcam.model.service.secure.TokenUserService;

public class TokenUtils {

	public SasUser readToken(String token, TokenUserService tokenUserService) throws Exception {
		SasUser sasUser = null;
		
		try {
			sasUser = (SasUser) tokenUserService.loadUserByToken(token);
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		return sasUser;
	}
	
}
