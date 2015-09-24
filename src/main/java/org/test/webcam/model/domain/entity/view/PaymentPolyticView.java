/* #LAST_VIEW_OBJECT */
/* #UPDATED */
package org.test.webcam.model.domain.entity.view;

// Generated 07.05.2015 16:26:32 by Hibernate Tools 4.3.1

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.voodoodyne.jackson.jsog.JSOGGenerator;

import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Id;

import java.util.Date;

import javax.persistence.Column;

import org.test.webcam.model.domain.SView;


/**
 * PaymentPolyticView generated by hbm2java, updated by voovee
 */
@JsonIdentityInfo(generator = JSOGGenerator.class)
@JsonIgnoreProperties({
			 
			  "firmid"
			, "firm"
			, "serieskey"
			, "sizedpolyticid"
			, "timedpolyticid" 
})
@Entity
@Table(name="payment_polytic_view")
public class PaymentPolyticView extends SView  {

	private static final long serialVersionUID = 9918633399764943L;

	private Integer id;
	private Integer version;
	private String name;
	private String createdby;
	private Date createon;
	private Integer firm;
	private String lastmodifiedby;
	private Date modifyon;
	private String serieskey;
	private String label;
	private String sizedpolytic;
	private Integer sizedpolyticid;
	private String timedpolytic;
	private Integer timedpolyticid;

	public PaymentPolyticView() {
	}

	public PaymentPolyticView(Integer id, Integer version, String name,
			String createdby, Date createon, Integer firm,
			String lastmodifiedby, Date modifyon, String serieskey,
			String label, String sizedpolytic, Integer sizedpolyticid,
			String timedpolytic, Integer timedpolyticid) {
		this.id = id;
		this.version = version;
		this.name=name;
		this.createdby = createdby;
		this.createon = createon;
		this.firm = firm;
		this.lastmodifiedby = lastmodifiedby;
		this.modifyon = modifyon;
		this.serieskey = serieskey;
		this.label = label;
		this.sizedpolytic = sizedpolytic;
		this.sizedpolyticid = sizedpolyticid;
		this.timedpolytic = timedpolytic;
		this.timedpolyticid = timedpolyticid;
	}

	@Id
	@Column(name="id")
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="version")
	public Integer getVersion() {
		return this.version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	@Column(name="name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name=name;
	}

	@Column(name="createdby")
	public String getCreatedby() {
		return this.createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	@Column(name="createon", length = 29)
	public Date getCreateon() {
		return this.createon;
	}

	public void setCreateon(Date createon) {
		this.createon = createon;
	}

	@Column(name="firm")
	public Integer getFirm() {
		return this.firm;
	}

	public void setFirm(Integer firm) {
		this.firm = firm;
	}

	@Column(name="lastmodifiedby")
	public String getLastmodifiedby() {
		return this.lastmodifiedby;
	}

	public void setLastmodifiedby(String lastmodifiedby) {
		this.lastmodifiedby = lastmodifiedby;
	}

	@Column(name="modifyon", length = 29)
	public Date getModifyon() {
		return this.modifyon;
	}

	public void setModifyon(Date modifyon) {
		this.modifyon = modifyon;
	}

	@Column(name="serieskey")
	public String getSerieskey() {
		return this.serieskey;
	}

	public void setSerieskey(String serieskey) {
		this.serieskey = serieskey;
	}

	@Column(name="label")
	public String getLabel() {
		return this.label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@Column(name="sizedpolytic")
	public String getSizedpolytic() {
		return this.sizedpolytic;
	}

	public void setSizedpolytic(String sizedpolytic) {
		this.sizedpolytic = sizedpolytic;
	}

	@Column(name="sizedpolyticid")
	public Integer getSizedpolyticid() {
		return this.sizedpolyticid;
	}

	public void setSizedpolyticid(Integer sizedpolyticid) {
		this.sizedpolyticid = sizedpolyticid;
	}

	@Column(name="timedpolytic")
	public String getTimedpolytic() {
		return this.timedpolytic;
	}

	public void setTimedpolytic(String timedpolytic) {
		this.timedpolytic = timedpolytic;
	}

	@Column(name="timedpolyticid")
	public Integer getTimedpolyticid() {
		return this.timedpolyticid;
	}

	public void setTimedpolyticid(Integer timedpolyticid) {
		this.timedpolyticid = timedpolyticid;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof PaymentPolyticView))
			return false;
		PaymentPolyticView castOther = (PaymentPolyticView) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())))
				&& ((this.getVersion() == castOther.getVersion()) || (this
						.getVersion() != null && castOther.getVersion() != null && this
						.getVersion().equals(castOther.getVersion())))
				&& ((this.getName() == castOther.getName()) || (this.getName() != null
						&& castOther.getName() != null && this.getName()
						.equals(castOther.getName())))
				&& ((this.getCreatedby() == castOther.getCreatedby()) || (this
						.getCreatedby() != null
						&& castOther.getCreatedby() != null && this
						.getCreatedby().equals(castOther.getCreatedby())))
				&& ((this.getCreateon() == castOther.getCreateon()) || (this
						.getCreateon() != null
						&& castOther.getCreateon() != null && this
						.getCreateon().equals(castOther.getCreateon())))
				&& ((this.getFirm() == castOther.getFirm()) || (this.getFirm() != null
						&& castOther.getFirm() != null && this.getFirm()
						.equals(castOther.getFirm())))
				&& ((this.getLastmodifiedby() == castOther.getLastmodifiedby()) || (this
						.getLastmodifiedby() != null
						&& castOther.getLastmodifiedby() != null && this
						.getLastmodifiedby().equals(
								castOther.getLastmodifiedby())))
				&& ((this.getModifyon() == castOther.getModifyon()) || (this
						.getModifyon() != null
						&& castOther.getModifyon() != null && this
						.getModifyon().equals(castOther.getModifyon())))
				&& ((this.getSerieskey() == castOther.getSerieskey()) || (this
						.getSerieskey() != null
						&& castOther.getSerieskey() != null && this
						.getSerieskey().equals(castOther.getSerieskey())))
				&& ((this.getLabel() == castOther.getLabel()) || (this
						.getLabel() != null && castOther.getLabel() != null && this
						.getLabel().equals(castOther.getLabel())))
				&& ((this.getSizedpolytic() == castOther.getSizedpolytic()) || (this
						.getSizedpolytic() != null
						&& castOther.getSizedpolytic() != null && this
						.getSizedpolytic().equals(castOther.getSizedpolytic())))
				&& ((this.getSizedpolyticid() == castOther.getSizedpolyticid()) || (this
						.getSizedpolyticid() != null
						&& castOther.getSizedpolyticid() != null && this
						.getSizedpolyticid().equals(
								castOther.getSizedpolyticid())))
				&& ((this.getTimedpolytic() == castOther.getTimedpolytic()) || (this
						.getTimedpolytic() != null
						&& castOther.getTimedpolytic() != null && this
						.getTimedpolytic().equals(castOther.getTimedpolytic())))
				&& ((this.getTimedpolyticid() == castOther.getTimedpolyticid()) || (this
						.getTimedpolyticid() != null
						&& castOther.getTimedpolyticid() != null && this
						.getTimedpolyticid().equals(
								castOther.getTimedpolyticid())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result
				+ (getVersion() == null ? 0 : this.getVersion().hashCode());
		result = 37 * result
				+ (getName() == null ? 0 : this.getName().hashCode());
		result = 37 * result
				+ (getCreatedby() == null ? 0 : this.getCreatedby().hashCode());
		result = 37 * result
				+ (getCreateon() == null ? 0 : this.getCreateon().hashCode());
		result = 37 * result
				+ (getFirm() == null ? 0 : this.getFirm().hashCode());
		result = 37
				* result
				+ (getLastmodifiedby() == null ? 0 : this.getLastmodifiedby()
						.hashCode());
		result = 37 * result
				+ (getModifyon() == null ? 0 : this.getModifyon().hashCode());
		result = 37 * result
				+ (getSerieskey() == null ? 0 : this.getSerieskey().hashCode());
		result = 37 * result
				+ (getLabel() == null ? 0 : this.getLabel().hashCode());
		result = 37
				* result
				+ (getSizedpolytic() == null ? 0 : this.getSizedpolytic()
						.hashCode());
		result = 37
				* result
				+ (getSizedpolyticid() == null ? 0 : this.getSizedpolyticid()
						.hashCode());
		result = 37
				* result
				+ (getTimedpolytic() == null ? 0 : this.getTimedpolytic()
						.hashCode());
		result = 37
				* result
				+ (getTimedpolyticid() == null ? 0 : this.getTimedpolyticid()
						.hashCode());
		return result;
	}
// #SETTER_AND_GETTER
	
// ------------------ Logic part ------------------
	
	public PaymentPolyticView init() {
		initList();
		initDicts();
		
		return this;
	}
	
	public PaymentPolyticView customInitList(List<String> list) {
		
		return this;
	}
	
	public PaymentPolyticView initList() {

		return this;
	}
	
	public PaymentPolyticView initDicts() {
		return this;
	}
	
	
}