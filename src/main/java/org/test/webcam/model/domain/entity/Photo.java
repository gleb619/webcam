/* #UPDATED */
/* #CLEARED */
package org.test.webcam.model.domain.entity;

// Generated 07.05.2015 16:26:32 by Hibernate Tools 4.3.1

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.PreRemove;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.voodoodyne.jackson.jsog.JSOGGenerator;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.OptimisticLockType;
import org.hibernate.annotations.OptimisticLocking;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.test.webcam.model.domain.SEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



/**
 * Photo generated by hbm2java, updated by voovee
 */
@DynamicInsert(true)
@DynamicUpdate(true)
@SelectBeforeUpdate(false)
@OptimisticLocking(type = OptimisticLockType.VERSION)
@JsonIdentityInfo(generator = JSOGGenerator.class)
@JsonIgnoreProperties({
			 
			  "firmid"
			, "firm"
			, "serieskey" 
})
@Entity
@Table(name="photo")
public class Photo extends SEntity  {

	private static final long serialVersionUID = 1687639875241436L;

	@JsonProperty("id") private Integer id;
	@JsonProperty("name") private String name;
	@JsonProperty("path") private String path;

	public Photo() {
	}

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_PHOTO")
	@SequenceGenerator(name = "SQ_PHOTO", sequenceName = "SQ_PHOTO", initialValue = 10, allocationSize = 1)
	@Id
	@Column(name="id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	@Column(name="name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name=name;
	}

	@Column(name="path")
	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	

	

	

	

	

	
// ------------------ Logic part ------------------
	
	@PreRemove
	public void preRemove() {

	}
	
	public Photo init() {
		initList();
		initDicts();
		
		return this;
	}
	
	public Photo preInitList() {

		return this;
	}
	
	public Photo initList() {

		return this;
	}
	
	public Photo initDicts() {

		return this;
	}
	
	
}