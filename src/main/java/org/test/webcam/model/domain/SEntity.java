/*
 * 
 */
package org.test.webcam.model.domain;

import java.util.Collection;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

import org.test.webcam.model.domain.entity.listner.SEntityListner;

// TODO: Auto-generated Javadoc
/**
 * The Class SEntity.
 */
@MappedSuperclass
@EntityListeners({ SEntityListner.class })
public class SEntity extends SObject {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -5366429587777894184L;

	/** The label. */
	private String label;
	private Boolean sync = true;

	/**
	 * Instantiates a new s entity.
	 */
	public SEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * Gets the label.
	 *
	 * @return the label
	 */
//	@Transient
	public String getLabel() {
		return label;
	}

	/**
	 * Sets the label.
	 *
	 * @param label the new label
	 */
	public void setLabel(String label) {
		this.label = label;
	}

	/* (non-Javadoc)
	 * @see kz.taimax.tourism.model.domain.SObject#initLists(java.util.Collection)
	 */
	protected Boolean initLists(Collection<?> arg0) {
		for (Object arg1 : arg0) {
			initSentity(arg1);
		}

		return false;
	}

	/**
	 * Inits the dicts.
	 *
	 * @return the s entity
	 */
	protected SEntity initDicts() {

		return this;
	}

	/* (non-Javadoc)
	 * @see kz.taimax.tourism.model.domain.SObject#initSentity(java.lang.Object)
	 */
	protected Boolean initSentity(Object arg0) {
		return initSObject(arg0);
	}

}
