/*
 * 
 */
package org.test.webcam.model.domain;

import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

// TODO: Auto-generated Javadoc
/**
 * The Class SDict.
 */
@MappedSuperclass
public class SDict extends SView {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 7036352003135077022L;

	/** The label. */
	private String label;

	/**
	 * Instantiates a new s dict.
	 */
	public SDict() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Transient
	public String getLabel() {
		return label;
	}

	/**
	 * Sets the label.
	 *
	 * @param label
	 *            the new label
	 */
	public void setLabel(String label) {
		this.label = label;
	}

}
