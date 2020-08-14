<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.*, java.util.*, structures.*, webmodules.*"%>
<%//actionModification.jsp %>

<!-- Device metadata 수정 -->
<%
	request.setCharacterEncoding("UTF-8");
	int device_id = Integer.parseInt(request.getParameter("device_id"));
	int item_id = Integer.parseInt(request.getParameter("item_id"));
	
	DBManager dbm = new DBManager();
	dbm.connect();
	DeviceCommon dc = dbm.getDeviceCommon(item_id);
	dbm.disconnect();
	
	System.out.println(item_id);
	String system_id = (String)request.getParameter("system_id");
	String model_name = dc.getmodel_name();
	String device_name = (String)request.getParameter("device_name");
	String deployment_time = (String)request.getParameter("deployment_time");
	String deployment_location = (String)request.getParameter("deployment_location");
	String latitude = (String)request.getParameter("latitude");
	String longitude = (String)request.getParameter("longitude");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	Class.forName("com.mysql.jdbc.Driver");

	try{
	String jdbcDriver = "jdbc:mysql://203.234.62.115:3306/MetadataRegistry?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser = "root";
	String dbPass = "1234";

	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

	pstmt = conn.prepareStatement("update device_register set item_id=?, system_id=?, device_name=?, deployment_time=?, deployment_location=?, latitude=?, longitude=? where device_id=?");
	pstmt.setInt(1, item_id);
	pstmt.setString(2, system_id);
	pstmt.setString(3, device_name);
	pstmt.setString(4, deployment_time);
	pstmt.setString(5, deployment_location);
	pstmt.setString(6, latitude);
	pstmt.setString(7, longitude);
	pstmt.setInt(8, device_id);
	pstmt.executeUpdate();
	//pstmt.setString(5, time);

	}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	 	}

	%>

<!-- 자동 테이블 생성 -->
<%
DBManager dbm2 = new DBManager();
dbm2.connect();
DeviceList dl = dbm2.getModifyDeviceList(item_id);
dbm2.disconnect();

AutoDBConnector adb = new AutoDBConnector();
adb.deleteTable(dl.gettable_name());	
adb.createTable(item_id, dl.gettable_name());
%>

<html>
<head>
<script type="text/javascript">   
		function goBack(){
			window.history.back();
		}
		window.location.replace("deviceList.jsp");
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Device metadata modification page</title>
</head>
<body>
수정 데이터 저장 페이지
</body>
</html>

