/* #UPDATED */
/* #CLEARED */
package org.test.webcam.model.domain.entity;

// Generated 07.05.2015 16:26:32 by Hibernate Tools 4.3.1

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
import org.test.webcam.model.domain.SObject;

import javax.persistence.CascadeType;

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
 * Users generated by hbm2java, updated by voovee
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
@Table(name="users")
public class Users extends SObject  {

	private static final long serialVersionUID = 4232438944997939L;

	@JsonProperty("id") private Integer id;
	@JsonProperty("paymentpolytic") private PaymentPolytic paymentPolytic;
	@JsonProperty("activated") private Boolean activated;
	@JsonProperty("activationkey") private String activationkey;
	@JsonProperty("email") private String email;
	@JsonProperty("enabled") private Boolean enabled;
	@JsonProperty("firstname") private String firstname;
	@JsonProperty("landingpage") private String landingpage;
	@JsonProperty("langkey") private String langkey;
	@JsonProperty("lastname") private String lastname;
	@JsonProperty("password") private String password;
	@JsonProperty("username") private String username;
	@JsonProperty("token") private String token;
	private List<RelUserSettings> relUserSettingses = new LinkedList<RelUserSettings>();
	private List<UserRoles> userRoleses = new LinkedList<UserRoles>();

	public Users() {
	}

	public Users(int id, String username) {
		this.id = id;
		this.username=username;
	}

	public Users(int id,

 Boolean activated,
			String activationkey, String email, Boolean enabled,
			String firstname, String landingpage, String langkey,
			String lastname, String password, String username, String token,
			List<RelUserSettings> relUserSettingses, List<UserRoles> userRoleses) {
		this.id = id;
		this.paymentPolytic = paymentPolytic;
		this.activated = activated;
		this.activationkey = activationkey;
		this.email = email;
		this.enabled = enabled;
		this.firstname=firstname;
		this.landingpage = landingpage;
		this.langkey = langkey;
		this.lastname=lastname;
		this.password = password;
		this.username=username;
		this.token = token;
		this.relUserSettingses = relUserSettingses;
		this.userRoleses = userRoleses;
	}

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_USERS")
	@SequenceGenerator(name = "SQ_USERS", sequenceName = "SQ_USERS", initialValue = 10, allocationSize = 1)
	@Id
	@Column(name="id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="payment_polytic_id")
	public PaymentPolytic getPaymentPolytic() {
		return this.paymentPolytic;
	}

	public void setPaymentPolytic(PaymentPolytic paymentPolytic) {
		this.paymentPolytic = paymentPolytic;
	}

	

	

	

	

	@Column(name="activated")
	public Boolean getActivated() {
		return this.activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	@JsonIgnore
	@Column(name="activationkey")
	public String getActivationkey() {
		return this.activationkey;
	}

	public void setActivationkey(String activationkey) {
		this.activationkey = activationkey;
	}

	@JsonIgnore
	@Column(name="email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="enabled")
	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	@Column(name="firstname")
	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname=firstname;
	}

	@Column(name="landingpage")
	public String getLandingpage() {
		return this.landingpage;
	}

	public void setLandingpage(String landingpage) {
		this.landingpage = landingpage;
	}

	@Column(name="langkey")
	public String getLangkey() {
		return this.langkey;
	}

	public void setLangkey(String langkey) {
		this.langkey = langkey;
	}

	@Column(name="lastname")
	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname=lastname;
	}

	@JsonIgnore
	@Column(name="password")
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name="username", unique = true, nullable = false)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username=username;
	}

	@Column(name="token")
	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	@OneToMany(fetch=FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE }, mappedBy="users")
	public List<RelUserSettings> getRelUserSettingses() {
		return this.relUserSettingses;
	}

	public void setRelUserSettingses(List<RelUserSettings> relUserSettingses) {
		this.relUserSettingses = relUserSettingses;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="users")
	public List<UserRoles> getUserRoleses() {
		return this.userRoleses;
	}

	public void setUserRoleses(List<UserRoles> userRoleses) {
		this.userRoleses = userRoleses;
	}
// #SETTER_AND_GETTER

	@Transient
	public String getLabel() {
		return lastname + " " + firstname; 
	}

	public void setLabel(String label) {
		
	}
	
	
// ------------------ Logic part ------------------
	
	@PreRemove
	public void preRemove() {
		for (UserRoles arg0 : getUserRoleses()) {
			arg0.setUsers(null);
		}


	}
	
	public Users init() {
		initList();
		initDicts();
		
		return this;
	}
	
	public Users preInitList() {
		for (UserRoles arg0 : getUserRoleses()) {
			arg0.setUsers(this);
		}


		return this;
	}
	
	public Users initList() {
		initLists(relUserSettingses);
		initLists(userRoleses);

		return this;
	}
	
	public Users initDicts() {
		initSentity(getPaymentPolytic());

		return this;
	}
	
	
}