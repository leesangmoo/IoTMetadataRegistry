package structures;

public class DeviceCommon {
	private int id;
	private String model_name;
	private String registration_time;
	private String device_type;
	private String manufacturer;
	private String category;

	public DeviceCommon() {
		this(0,"","","","","");
	}
	
	public DeviceCommon(int id, String model_name, String registration_time, String device_type, String manufacturer,String category) {
		this.id = id;
		this.model_name = model_name;
		this.registration_time = registration_time;
		this.device_type = device_type;
		this.manufacturer = manufacturer;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getmodel_name() {
		return model_name;
	}

	public void setmodel_name(String model_name) {
		this.model_name = model_name;
	}
	public String getregistration_time() {
		return registration_time;
	}

	public void setregistration_time(String registration_time) {
		this.registration_time = registration_time;
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
		return   this.id + " / "+this.model_name + " / "+ this.registration_time + " / " + this.device_type + " / " + this.manufacturer + " / " 
				+ this.category + " / ";
	}
	
}
