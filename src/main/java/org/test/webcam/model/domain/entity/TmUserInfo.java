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

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TmUserInfo generated by hbm2java, updated by voovee
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
@Table(name="tm_user_info")
public class TmUserInfo extends SEntity  {

	private static final long serialVersionUID = 2653827298628364L;

	@JsonProperty("id") private Integer id;
	@JsonProperty("browser") private String browser;
	@JsonProperty("browserversion") private String browserVersion;
	@JsonProperty("lastlogin") private Date lastLogin;
	@JsonProperty("platform") private String platform;
	@JsonProperty("platformversion") private String platformversion;
	@JsonProperty("proxycontent") private String proxyContent;
	@JsonProperty("remotehost") private String remoteHost;
	@JsonProperty("useragent") private String userAgent;
	@JsonProperty("useripaddress") private String userIpAddress;
	@JsonProperty("username") private String username;

	public TmUserInfo() {
	}

	public TmUserInfo(int id) {
		this.id = id;
	}

	public TmUserInfo(int id,

 String browser, String browserVersion,
			Date lastLogin, String platform, String platformversion,
			String proxyContent, String remoteHost, String userAgent,
			String userIpAddress, String username) {
		this.id = id;
		this.browser = browser;
		this.browserVersion = browserVersion;
		this.lastLogin = lastLogin;
		this.platform = platform;
		this.platformversion = platformversion;
		this.proxyContent = proxyContent;
		this.remoteHost = remoteHost;
		this.userAgent = userAgent;
		this.userIpAddress = userIpAddress;
		this.username=username;
	}

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SQ_TMUSERINFO")
	@SequenceGenerator(name = "SQ_TMUSERINFO", sequenceName = "SQ_TMUSERINFO", initialValue = 10, allocationSize = 1)
	@Id
	@Column(name="id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	

	

	

	

	

	@Column(name="browser")
	public String getBrowser() {
		return this.browser;
	}

	public void setBrowser(String browser) {
		this.browser = browser;
	}

	@Column(name="browser_version")
	public String getBrowserVersion() {
		return this.browserVersion;
	}

	public void setBrowserVersion(String browserVersion) {
		this.browserVersion = browserVersion;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_login", length = 29)
	public Date getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	@Column(name="platform")
	public String getPlatform() {
		return this.platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	@Column(name="platformversion")
	public String getPlatformversion() {
		return this.platformversion;
	}

	public void setPlatformversion(String platformversion) {
		this.platformversion = platformversion;
	}

	@Column(name="proxy_content")
	public String getProxyContent() {
		return this.proxyContent;
	}

	public void setProxyContent(String proxyContent) {
		this.proxyContent = proxyContent;
	}

	@Column(name="remote_host")
	public String getRemoteHost() {
		return this.remoteHost;
	}

	public void setRemoteHost(String remoteHost) {
		this.remoteHost = remoteHost;
	}

	@Column(name="user_agent")
	public String getUserAgent() {
		return this.userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	@Column(name="user_ip_address")
	public String getUserIpAddress() {
		return this.userIpAddress;
	}

	public void setUserIpAddress(String userIpAddress) {
		this.userIpAddress = userIpAddress;
	}

	@Column(name="username")
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username=username;
	}

	
// ------------------ Logic part ------------------
	
	@PreRemove
	public void preRemove() {

	}
	
	public TmUserInfo init() {
		initList();
		initDicts();
		
		return this;
	}
	
	public TmUserInfo preInitList() {

		return this;
	}
	
	public TmUserInfo initList() {

		return this;
	}
	
	public TmUserInfo initDicts() {

		return this;
	}
	
	
}