<%@page import="java.sql.*" pageEncoding="UTF-8" 
import="java.util.*, webmodules.*, structures.*" %>
<%@page import="java.io.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- device list와 자동 생성 테이블 삭제하는 페이지 -->
<%
	int device_id = Integer.parseInt(request.getParameter("id"));
	int item_id = Integer.parseInt(request.getParameter("item_id"));
	
	DBManager dbm = new DBManager();
	dbm.connect();
	
	DeviceInfo dl = dbm.getModifyDeviceIdList(device_id);
	dbm.deleteDevice(device_id);
	// 자동 생성 테이블 삭제 코드 
	dbm.deleteMeasurementTable(dl.gettable_name());
	dbm.disconnect();

	// 자동 생성 테이블 삭제 코드
//	AutoDBConnector adb = new AutoDBConnector();
	//adb.deleteTable(dl.gettable_name());	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
window.location.replace("deviceList.jsp?id=<%= device_id %> ");
</script>

<title>삭제 m_delete.jsp</title>
</head>

<body>
</body>
</html>