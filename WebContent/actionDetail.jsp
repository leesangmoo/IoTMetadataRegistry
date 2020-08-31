<%@page import="java.sql.*" pageEncoding="UTF-8" 
import="java.util.*, webmodules.*, structures.*" %>
<%@page import="java.io.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
		<%
			int send_id = Integer.parseInt(request.getParameter("id"));
			System.out.println(send_id + " <-- 해당 id 삭제 ");
			request.setCharacterEncoding("utf-8");
			Connection conn = null;
			PreparedStatement pstmt = null;
			Class.forName("com.mysql.jdbc.Driver");
			try {
				String jdbcDriver = "jdbc:mysql://203.234.62.115:3306/MetadataRegistry?useUnicode=true&characterEncoding=utf8";
				String dbUser = "root";
				String dbPass = "1234";
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				pstmt = conn.prepareStatement("DELETE FROM global_metadata WHERE item_id=?");
				pstmt.setInt(1, send_id);
				pstmt.executeUpdate();
			} finally {
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
			}
		%>
		<%
			Connection conn2 = null;
			PreparedStatement pstmt2 = null;
			Class.forName("com.mysql.jdbc.Driver");
			try {
				String jdbcDriver = "jdbc:mysql://203.234.62.115:3306/MetadataRegistry?useUnicode=true&characterEncoding=utf8";
				String dbUser = "root";
				String dbPass = "1234";
				conn2 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				pstmt2 = conn2.prepareStatement("DELETE FROM specific_metadata WHERE item_id=?");
				pstmt2.setInt(1, send_id);
				pstmt2.executeUpdate();
			} finally {
				if (pstmt2 != null)
					try {
						pstmt2.close();
					} catch (SQLException ex) {
					}
				if (conn2 != null)
					try {
						conn2.close();
					} catch (SQLException ex) {
					}
			}

			// 자동 테이블 삭제 -- 보류
			// 
//			DBManager dbm = new DBManager();
				//dbm.connect();
//				DeviceInfo di = dbm.getDeviceInfo(send_id);
//				dbm.disconnect();

				//AutoDBConnector adb = new AutoDBConnector();
				//adb.deleteTable(di.gettable_name());
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
window.location.replace("deviceItemList.jsp?id=<%= send_id %> ");
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