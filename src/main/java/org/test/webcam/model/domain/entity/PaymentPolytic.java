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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



/**
 * PaymentPolytic generated by hbm2java, updated by voovee
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
@Table(name="payment_polytic")
public class PaymentPolytic extends SEntity  {

	private static final long serialVersionUID = 8639955435598541L;

	@JsonProperty("id") private Integer id;
	@JsonProperty("sizedpolytic") private SizedPolytic sizedPolytic;
	@JsonProperty("timedpolytic") private TimedPolytic timedPolytic;
	@JsonProperty("name") private String name;
	private List<Users> userses = new LinkedList<Users>();

	public PaymentPolytic() {
	}

	public PaymentPolytic(int id) {
		this.id = id;
	}

	public PaymentPolytic(int id, SizedPolytic sizedPolytic,
			TimedPolytic timedPolytic,

 List<Users> userses) {
		this.id = id;
		this.sizedPolytic = sizedPolytic;
		this.timedPolytic = timedPolytic;
		this.name=name;
		this.userses = userses;
	}

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_PAYMENTPOLYTIC")
	@SequenceGenerator(name = "SQ_PAYMENTPOLYTIC", sequenceName = "SQ_PAYMENTPOLYTIC", initialValue = 10, allocationSize = 1)
	@Id
	@Column(name="id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="sized_polytic_id")
	public SizedPolytic getSizedPolytic() {
		return this.sizedPolytic;
	}

	public void setSizedPolytic(SizedPolytic sizedPolytic) {
		this.sizedPolytic = sizedPolytic;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="timed_polytic_id")
	public TimedPolytic getTimedPolytic() {
		return this.timedPolytic;
	}

	public void setTimedPolytic(TimedPolytic timedPolytic) {
		this.timedPolytic = timedPolytic;
	}

	@Column(name="name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name=name;
	}

	

	

	

	

	

	@OneToMany(fetch=FetchType.LAZY, mappedBy="paymentPolytic")
	public List<Users> getUserses() {
		return this.userses;
	}

	public void setUserses(List<Users> userses) {
		this.userses = userses;
	}
// #SETTER_AND_GETTER
	
// ------------------ Logic part ------------------
	
	@PreRemove
	public void preRemove() {
		for (Users arg0 : getUserses()) {
			arg0.setPaymentPolytic(null);
		}


	}
	
	public PaymentPolytic init() {
		initList();
		initDicts();
		
		return this;
	}
	
	public PaymentPolytic preInitList() {
		for (Users arg0 : getUserses()) {
			arg0.setPaymentPolytic(this);
		}


		return this;
	}
	
	public PaymentPolytic initList() {
		initLists(userses);

		return this;
	}
	
	public PaymentPolytic initDicts() {
		initSentity(getSizedPolytic());
		initSentity(getTimedPolytic());

		return this;
	}
	
	
}