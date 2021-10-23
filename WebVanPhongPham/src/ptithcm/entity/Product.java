package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
	@Id
	@GeneratedValue
	@Column(name = "product_id")
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;

	@Column(name = "image")
	private String image;

	@Column(name = "price")
	private Double price;

	@Column(name = "specification")
	private String specification;

	@Column(name = "calculation_unit")
	private String calculation_unit;

	@Column(name = "discount")
	private Integer discount;

	@Column(name = "sold_quantity")
	private Integer sold_quantity;

	@Column(name = "quantity")
	private Integer quantity;

	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brands;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category categories;

	@Column(name = "status")
	private Boolean status;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Collection<Feedback> feedback;
	
	@OneToMany(mappedBy = "products", fetch = FetchType.EAGER)
	private Collection<Cart> carts;
	
	@OneToMany(mappedBy = "products", fetch = FetchType.EAGER)
	private Collection<OrderDetail> orderDetails;
	
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getCalculation_unit() {
		return calculation_unit;
	}

	public void setCalculation_unit(String calculation_unit) {
		this.calculation_unit = calculation_unit;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getSold_quantity() {
		return sold_quantity;
	}

	public void setSold_quantity(Integer sold_quantity) {
		this.sold_quantity = sold_quantity;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Brand getBrands() {
		return brands;
	}

	public void setBrands(Brand brands) {
		this.brands = brands;
	}

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Collection<Feedback> getFeedback() {
		return feedback;
	}

	public void setFeedback(Collection<Feedback> feedback) {
		this.feedback = feedback;
	}

	public Collection<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Collection<Cart> carts) {
		this.carts = carts;
	}

	public Collection<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Collection<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
}
