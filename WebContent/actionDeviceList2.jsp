<%@page import="java.sql.*" pageEncoding="UTF-8" 
import="java.util.*, webmodules.*, structures.*" %>
<%@page import="java.io.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- device list만 삭제하는 페이지 -->
		<%
			int device_id = Integer.parseInt(request.getParameter("id"));
			int item_id = Integer.parseInt(request.getParameter("item_id"));
			
			DBManager dbm2 = new DBManager();
			dbm2.connect();
			DeviceList dl = dbm2.getModifyDeviceList(item_id);
			dbm2.disconnect();
			
			System.out.println(device_id + " <-- 해당 id 삭제 ");
			System.out.println(item_id + " <-- item_id 확인 ");
			request.setCharacterEncoding("utf-8");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			Class.forName("com.mysql.jdbc.Driver");
			
			try {
				String jdbcDriver = "jdbc:mysql://203.234.62.115:3306/MetadataRegistry?useUnicode=true&characterEncoding=utf8";
				String dbUser = "root";
				String dbPass = "1234";
			
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				
				pstmt = conn.prepareStatement("DELETE FROM device_register WHERE device_id=?");
				pstmt.setInt(1, device_id);
				pstmt.executeUpdate();
			} finally {
				if (pstmt != null) try { pstmt.close();} catch (SQLException ex) {}
				if (conn != null) try { conn.close(); } catch (SQLException ex) {}
			}
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
table {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 5px;
}
</style>
<style>
p {
	width: 1700px;
	height: 60px;
	background: orange;
	list-style: none;
	padding-top: 15px
}

p {
	float: center;
	margin-right: 10px
}

p {
	font-size: 20px;
	color: black;
	font-weight: bold;
	text-decoration: none
}
</style>
<head>

<script type="text/javascript">
window.location.replace("deviceList.jsp?id=<%= device_id %> ");
</script>

<title>삭제 m_delete.jsp</title>
</head>

<body>
	<form name='myform' action="DbSelect.jsp" method="get">
		<center>
			<p>
				<caption>테이블 삭제 </caption><br>
				<button type="button" class="back" onclick="check(1)">뒤로가기</button>
				<button type="button" onclick="location.href='deviceList.jsp'">디바이스 목록 보기</button>
			</p>
		</center>
	
	</form>
</body>
</html>