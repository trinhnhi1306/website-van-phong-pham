package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="district")
public class District {

	@Id
	@Column(name="district_id")
	private Integer id;
	
	@Column(name="district_name")
	private String name;
	
	@Column(name="district_prefix")
	private String prefix;

	@ManyToOne
	@JoinColumn(name="province_id")
	private Province province;
	
	@OneToMany(mappedBy = "district", fetch = FetchType.EAGER)
	private Collection<Ward> wards;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public Collection<Ward> getWards() {
		return wards;
	}

	public void setWards(Collection<Ward> wards) {
		this.wards = wards;
	}

	
}
