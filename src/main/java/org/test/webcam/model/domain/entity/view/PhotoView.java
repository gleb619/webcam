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
 * PhotoView generated by hbm2java, updated by voovee
 */
@JsonIdentityInfo(generator = JSOGGenerator.class)
@JsonIgnoreProperties({
			 
			  "firmid"
			, "firm"
			, "serieskey" 
})
@Entity
@Table(name="photo_view")
public class PhotoView extends SView  {

	private static final long serialVersionUID = 3321148241475959L;

	private Integer id;
	private Integer version;
	private String name;
	private String path;
	private String createdby;
	private Date createon;
	private Integer firm;
	private String lastmodifiedby;
	private Date modifyon;
	private String serieskey;
	private String label;

	public PhotoView() {
	}

	public PhotoView(Integer id, Integer version, String name, String path,
			String createdby, Date createon, Integer firm,
			String lastmodifiedby, Date modifyon, String serieskey, String label) {
		this.id = id;
		this.version = version;
		this.name=name;
		this.path = path;
		this.createdby = createdby;
		this.createon = createon;
		this.firm = firm;
		this.lastmodifiedby = lastmodifiedby;
		this.modifyon = modifyon;
		this.serieskey = serieskey;
		this.label = label;
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

	@Column(name="path")
	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
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

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof PhotoView))
			return false;
		PhotoView castOther = (PhotoView) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())))
				&& ((this.getVersion() == castOther.getVersion()) || (this
						.getVersion() != null && castOther.getVersion() != null && this
						.getVersion().equals(castOther.getVersion())))
				&& ((this.getName() == castOther.getName()) || (this.getName() != null
						&& castOther.getName() != null && this.getName()
						.equals(castOther.getName())))
				&& ((this.getPath() == castOther.getPath()) || (this.getPath() != null
						&& castOther.getPath() != null && this.getPath()
						.equals(castOther.getPath())))
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
						.getLabel().equals(castOther.getLabel())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result
				+ (getVersion() == null ? 0 : this.getVersion().hashCode());
		result = 37 * result
				+ (getName() == null ? 0 : this.getName().hashCode());
		result = 37 * result
				+ (getPath() == null ? 0 : this.getPath().hashCode());
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
		return result;
	}
// #SETTER_AND_GETTER
	
// ------------------ Logic part ------------------
	
	public PhotoView init() {
		initList();
		initDicts();
		
		return this;
	}
	
	public PhotoView customInitList(List<String> list) {
		
		return this;
	}
	
	public PhotoView initList() {

		return this;
	}
	
	public PhotoView initDicts() {
		return this;
	}
	
	
}