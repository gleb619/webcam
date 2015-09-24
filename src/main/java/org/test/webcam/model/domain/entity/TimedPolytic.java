/* #UPDATED */
/* #CLEARED */
package org.test.webcam.model.domain.entity;

// Generated 07.05.2015 16:26:32 by Hibernate Tools 4.3.1

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.PreRemove;

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

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



/**
 * TimedPolytic generated by hbm2java, updated by voovee
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
@Table(name="timed_polytic")
public class TimedPolytic extends SEntity  {

	private static final long serialVersionUID = 4259832932197611L;

	@JsonProperty("id") private Integer id;
	@JsonProperty("name") private String name;
	@JsonProperty("numberofdays") private Integer numberOfDays;
	private List<PaymentPolytic> paymentPolytics = new LinkedList<PaymentPolytic>();

	public TimedPolytic() {
	}

	public TimedPolytic(int id) {
		this.id = id;
	}

	public TimedPolytic(int id, String name, Integer numberOfDays,


 List<PaymentPolytic> paymentPolytics) {
		this.id = id;
		this.name=name;
		this.numberOfDays = numberOfDays;
		this.paymentPolytics = paymentPolytics;
	}

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_TIMEDPOLYTIC")
	@SequenceGenerator(name = "SQ_TIMEDPOLYTIC", sequenceName = "SQ_TIMEDPOLYTIC", initialValue = 10, allocationSize = 1)
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

	@Column(name="number_of_days")
	public Integer getNumberOfDays() {
		return this.numberOfDays;
	}

	public void setNumberOfDays(Integer numberOfDays) {
		this.numberOfDays = numberOfDays;
	}

	

	

	

	

	

	@OneToMany(fetch=FetchType.LAZY, mappedBy="timedPolytic")
	public List<PaymentPolytic> getPaymentPolytics() {
		return this.paymentPolytics;
	}

	public void setPaymentPolytics(List<PaymentPolytic> paymentPolytics) {
		this.paymentPolytics = paymentPolytics;
	}

	
// ------------------ Logic part ------------------
	
	@PreRemove
	public void preRemove() {
		for (PaymentPolytic arg0 : getPaymentPolytics()) {
			arg0.setTimedPolytic(null);
		}


	}
	
	public TimedPolytic init() {
		initList();
		initDicts();
		
		return this;
	}
	
	public TimedPolytic preInitList() {
		for (PaymentPolytic arg0 : getPaymentPolytics()) {
			arg0.setTimedPolytic(this);
		}


		return this;
	}
	
	public TimedPolytic initList() {
		initLists(paymentPolytics);

		return this;
	}
	
	public TimedPolytic initDicts() {

		return this;
	}
	
	
}