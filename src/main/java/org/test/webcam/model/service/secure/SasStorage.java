package org.test.webcam.model.service.secure;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope("session")
public class SasStorage {

	private Integer firmid;

	public Integer getFirmid() {
		return firmid;
	}

	public void setFirmid(Integer firmid) {
		this.firmid = firmid;
	}
	
}
