package structures;

public class DeviceCommon {
	private String id;
	private String now_timestamp;
	private String device_type;
	private String manufacturer;
	private String category;

	public DeviceCommon() {
		this("","","","","");
	}
	
	public DeviceCommon(String id, String now_timestamp, String device_type, String manufacturer,String category) {
		this.id = id;
		this.now_timestamp = now_timestamp;
		this.device_type = device_type;
		this.manufacturer = manufacturer;
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getNowtimestamp() {
		return now_timestamp;
	}

	public void setNowtimestamp(String now_timestamp) {
		this.now_timestamp = now_timestamp;
	}

	public String getDevice_type() {
		return device_type;
	}

	public void setDevice_type(String device_type) {
		this.device_type = device_type;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String toString() {
		return this.id + " / " + this.now_timestamp + " / " + this.device_type + " / " + this.manufacturer + " / " 
				+ this.category + " / ";
	}
	
}
