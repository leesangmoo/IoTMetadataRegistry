package webmodules;

import java.sql.*;
import java.util.*;
import structures.*;

public class DBManager {
	public static String DB_DRIVERCLASS = "com.mysql.jdbc.Driver";
	public static String DEFAULT_IP = "203.234.62.115";
	public static String DEFAULT_DATABASE = "MetadataRegistry";
	public static String DEFAULT_ID = "root";
	public static String DEFAULT_PW = "1234";
	
	public static ArrayList<String> kl = new ArrayList<String>();
	public Connection conn;
	public String jdbcDriver; 
	public String dbUser;
	public String dbPwd;
	
	public DBManager() {
		this.conn = null;
		
		this.dbUser = DBManager.DEFAULT_ID;
		this.dbPwd = DBManager.DEFAULT_PW;
		this.jdbcDriver = "jdbc:mysql://" + DBManager.DEFAULT_IP + ":3306/" 
				+ DBManager.DEFAULT_DATABASE + "?useUnicode=true&characterEncoding=utf8";

	}

	public boolean connect() {
		try {
			Class.forName(DBManager.DB_DRIVERCLASS);
			conn = DriverManager.getConnection(this.jdbcDriver, this.dbUser, this.dbPwd);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean disconnect() {
		try {
			
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	public ArrayList<DeviceCommon> getGlobalList() {
		ArrayList<DeviceCommon> devList = new ArrayList<DeviceCommon>(); 
		try {
			ResultSet rs = null;
			String sql = "select item_id, model_name, registration_time, device_type, manufacturer,"
						+ "category from global_metadata";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				DeviceCommon dc = new DeviceCommon();
				dc.setId(rs.getInt(1));
				dc.setmodel_name(rs.getString(2));
				dc.setregistration_time(rs.getString(3));
				dc.setDevice_type(rs.getString(4));
				dc.setManufacturer(rs.getString(5));
				dc.setCategory(rs.getString(6));
				
				System.out.println(dc.toString());
				
				devList.add(dc);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return devList;
	}
	
	public ArrayList<DeviceList> getDeviceList() {
		ArrayList<DeviceList> devList = new ArrayList<DeviceList>(); 
		try {
			ResultSet rs = null;
			String sql = "select device_id, item_id, system_id, device_name, table_name, deployment_time, deployment_location, latitude, longitude from device_register";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				DeviceList dc = new DeviceList();
				dc.setdevice_id(rs.getInt(1));
				dc.setitem_id(rs.getInt(2));
				dc.setsystem_id(rs.getString(3));
				dc.setdevice_name(rs.getString(4));
				dc.settable_name(rs.getString(5));
				dc.setdeployment_time(rs.getString(6));
				dc.setdeployment_location(rs.getString(7));
				dc.setlatitude(rs.getString(8));
				dc.setlongitude(rs.getString(9));
				System.out.println(dc.toString());
				
				devList.add(dc);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return devList;
	}
	
	public DeviceCommon getDeviceCommon(int item_id) {
		DeviceCommon dc = new DeviceCommon(); 
		try {
			ResultSet rs = null;
			String sql = "select item_id, model_name, registration_time, device_type, manufacturer,"
						+ "category from global_metadata"
						+ " where item_id = '" + item_id + "';";
			
			System.out.println(sql);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				dc.setId(rs.getInt(1));
				dc.setmodel_name(rs.getString(2));
				dc.setregistration_time(rs.getString(3));
				dc.setDevice_type(rs.getString(4));
				dc.setManufacturer(rs.getString(5));
				dc.setCategory(rs.getString(6));
				System.out.println(dc.toString());
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return dc;
	}
	
	public DeviceList getModifyDeviceList(int item_id){
		DeviceList dl = new DeviceList(); 
		try {
			ResultSet rs = null;
			String sql = "select device_id, item_id, system_id, device_name, table_name, deployment_time, deployment_location, latitude, longitude"
					+" from device_register" 
					+ " where item_id = '" + item_id + "';";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dl.setdevice_id(rs.getInt(1));
				dl.setitem_id(rs.getInt(2));
				dl.setsystem_id(rs.getString(3));
				dl.setdevice_name(rs.getString(4));
				dl.settable_name(rs.getString(5));
				dl.setdeployment_time(rs.getString(6));
				dl.setdeployment_location(rs.getString(7));
				dl.setlatitude(rs.getString(8));
				dl.setlongitude(rs.getString(9));
				System.out.println(dl.toString());
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return dl;
	}
	public DeviceList getModifyDeviceIdList(int device_id){
		DeviceList dl = new DeviceList(); 
		try {
			ResultSet rs = null;
			String sql = "select device_id, item_id, system_id, device_name, table_name, deployment_time, deployment_location, latitude, longitude"
					+" from device_register" 
					+ " where device_id = '" + device_id + "';";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dl.setdevice_id(rs.getInt(1));
				dl.setitem_id(rs.getInt(2));
				dl.setsystem_id(rs.getString(3));
				dl.setdevice_name(rs.getString(4));
				dl.settable_name(rs.getString(5));
				dl.setdeployment_time(rs.getString(6));
				dl.setdeployment_location(rs.getString(7));
				dl.setlatitude(rs.getString(8));
				dl.setlongitude(rs.getString(9));
				System.out.println(dl.toString());
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return dl;
	}
	
	public DeviceSpecific getDeviceSpecific(int item_id) {
		DeviceSpecific ds = new DeviceSpecific(); 
		try {
			ResultSet rs = null;
			String sql = "select item_id, metadata_key,"
					+"metadata_value from specific_metadata"
					+" where item_id = '" + item_id + "';";
			
			System.out.println(sql);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ds.setId(rs.getInt(1));
				ds.add(rs.getString(2), rs.getString(3));
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return ds;
	}
}
