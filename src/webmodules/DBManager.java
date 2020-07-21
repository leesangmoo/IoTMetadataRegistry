package webmodules;

import java.sql.*;
import java.util.*;
import structures.*;

public class DBManager {
	public static String DB_DRIVERCLASS = "com.mysql.jdbc.Driver";
	public static String DEFAULT_IP = "localhost";
	public static String DEFAULT_DATABASE = "jsptest";
	public static String DEFAULT_ID = "jspid";
	public static String DEFAULT_PW = "jsppass";
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

	public ArrayList<DeviceCommon> getDeviceList() {
		ArrayList<DeviceCommon> devList = new ArrayList<DeviceCommon>(); 
		try {
			ResultSet rs = null;
			String sql = "select id, model_name, registration_time, device_type, manufacturer,"
						+ "category from device_register_table";
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
	
	public DeviceCommon getDeviceCommon(String device_id) {
		DeviceCommon dc = new DeviceCommon(); 
		try {
			ResultSet rs = null;
			String sql = "select id, model_name, registration_time, device_type, manufacturer,"
						+ "category from device_register_table"
						+ " where id = '" + device_id + "';";
			
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
	
	public DeviceSpecific getDeviceSpecific(String device_id) {
		DeviceSpecific ds = new DeviceSpecific(); 
		try {
			ResultSet rs = null;
			String sql = "select id, metadata_key,"
					+"metadata_value from specific_metadata"
					+" where id = '" + device_id + "';";
			
			System.out.println(sql);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ds.setId(rs.getString(1));
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
