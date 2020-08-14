package webmodules;

import java.sql.*;
import java.util.ArrayList;

public class AutoDBConnector {
	private String driver;
	private String url;
	private String userid;
	private String password;

	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	
	public AutoDBConnector() {		
		this.driver = "com.mysql.jdbc.Driver";
		this.url = "jdbc:mysql://203.234.62.115:3306/MetadataRegistry?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Seoul&useSSL=false";
		this.userid = "root";
		this.password = "1234";
	}
	
	public boolean connectDB() {
		this.conn = null;
		try {
			Class.forName(this.driver);
			this.conn = DriverManager.getConnection(this.url, this.userid, this.password);
			System.out.println("Connection Successed  -- mysql --");
			this.stmt = this.conn.createStatement();
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		} 
		return true;
	}

	public boolean disconnectDB() {
		try {
			if (this.stmt != null)
				this.stmt.close();
			if (this.pstmt != null)
				this.pstmt.close();
			if (this.conn != null)
				this.conn.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}
	
	public ResultSet executeQuery(String sql) throws SQLException {
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		return rs;
	}
		
	public void executeUpdate(String sql) throws SQLException {
		Statement stmt = this.conn.createStatement();
		stmt.executeUpdate(sql);
	}
	
	public void createTable(int item_id, String table_Name) {
		ArrayList<String> keyList = new ArrayList<String>();
		
		connectDB();			
		try {
			// specific_metadata 컬럼 받아오기
				String sql_column = "select * from MetadataRegistry.specific_metadata where item_id = " + item_id
						+ " and (metadata_key like 'sensor-%' or metadata_key like 'actuator-%')";
				ResultSet rs = executeQuery(sql_column);
				while (rs.next()) {
					String key = rs.getString("metadata_value");
					keyList.add(key);
				}
			
			// 테이블 생성
				String createSql = "CREATE TABLE MetadataRegistry." + table_Name + "("
						+ "id INT AUTO_INCREMENT,"
						+ "timestamp DATETIME,"
						+ "PRIMARY KEY(id))";
				stmt.execute(createSql);
				
				for (int j=0;j<keyList.size();j++) {
					String alterSql = "alter table MetadataRegistry." + table_Name
							+ " add " + keyList.get(j) + " varchar(200)";
					stmt.execute(alterSql);
				}
			}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		disconnectDB();
	}
	
	// 테이블 삭제
	public void deleteTable(String table_name) {
		connectDB();
		try {
			String deleteSql = "drop table MetadataRegistry." + table_name;
			stmt.executeUpdate(deleteSql);
			System.out.println(table_name + " 테이블 삭제");
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		disconnectDB();
	}
	
	public static void main(String[] args) {
//		AutoDBConnector db = new AutoDBConnector();
//		db.createTable();
//		db.deleteTable(5);
	}
	
}
