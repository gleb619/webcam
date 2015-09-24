package org.test.webcam.util.task;

public enum DateCompare {

	GREATER("%s.%s >= :%s"),
	EQUALS("%s.%s = :%s"),
	LESS("%s.%s <= :%s");
	
	private final String value;

	private DateCompare(String value) {
		this.value = value;
	}

	public String value() {
		return value;
	}
	
}
