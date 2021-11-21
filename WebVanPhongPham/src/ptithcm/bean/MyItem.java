package ptithcm.bean;

public class MyItem {
	
	private String name;
	private Long value;
	
	public MyItem() {
		super();
	}
	public MyItem(String name, Long value) {
		super();
		this.name = name;
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getValue() {
		return value;
	}
	public void setValue(Long value) {
		this.value = value;
	}

}
