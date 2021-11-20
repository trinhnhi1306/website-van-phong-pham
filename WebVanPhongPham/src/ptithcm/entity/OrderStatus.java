package ptithcm.entity;

import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="order_status")
public class OrderStatus {

	@Id
	@GeneratedValue
	@Column(name="status_id")
	private Integer id;
	
	@Column(name="description")
	private String description;

	@OneToMany(mappedBy = "status", fetch = FetchType.EAGER)
	private Collection<Order> orders;
	
	public OrderStatus() {
		super();
	}

	public OrderStatus(Integer id, String description, Collection<Order> orders) {
		super();
		this.id = id;
		this.description = description;
		this.orders = orders;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Collection<Order> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Order> orders) {
		this.orders = orders;
	}
	
}
