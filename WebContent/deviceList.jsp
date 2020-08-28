<%@page import="java.util.*, webmodules.*, structures.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//DBManager dbm = new DBManager();
	DBManager dbm = new DBManager();
	dbm.connect();

	ArrayList<DeviceList> dcList = dbm.getDeviceList();
	
	dbm.disconnect();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
 	h1 	  {
  	  	border-collapse: collapse; 
    }
	table {
		width: 103%;
		margin-left: auto;
		margin-right: auto;
		border: 1px solid #444444;
		border-collapse: collapse;
	}
	th, td {
		border: 1px solid #444444;
		padding: 5px;
		text-align : center;
	}
    .MainContent {
  		position: absolute; left: 50%;
  		width: 1024px; margin-left: -512px;
  		text-align:center;
  	}
  	.MenuBar {
  		width:100%; height:100%; background:blue;
  		float:center; padding:15px;
  		font-size:20px; color:white; font-weight:bold; text-decoration:none;
  		text-align:center;
  	}
  	.InputText {
  		width: 95%;
  		text-align : center;
  	}
  
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script location.href="./test?params="
	+encodeURI(params); 
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function check(no) {
		if (no == 1) {
			document.myform.action = "DbJson.jsp";
		} else if (no == 2) {
			document.myform.action = "FileSelect.jsp";
		} else if (no == 3) {
			document.myform.action = "db3.jsp";
		} else if (no == 4) {
			document.myform.action = "db4.jsp";
		} else {
			return;
		}
		document.myform.submit();
	}
</script>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
<title>Device List</title>
</head>

<body>
	<div class="MainContent">
	<form name='myform' action="db2.jsp" method="post">
	<div class="MenuBar">
			 <h1>Device List</h1>
			 <button type="button" onclick="location.href='itemRegistration.jsp'">아이템 등록</button>
			 <button type="button" onclick="location.href='deviceItemList.jsp'">아이템 목록</button>&nbsp;&nbsp;
			 <button type="button" onclick="location.href='deviceRegistration.jsp'">디바이스 등록</button>
			 <button type="button" onclick="location.href='deviceList.jsp'">디바이스 목록</button>
	</div>
		<table id="tb1" width="100%" border="1">
				<tr>
					<th>Device id</th>
					<th>Device name</th>
					<th>System id</th>
					<th>Item id</th>
					<th>Model name</th>
					<th>Table name</th>
					<th>Deployment time</th>
					<th>Deployment location</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Modify</th>
					<th>Delete list</th>
					<th>Delete list and table</th>
				</tr>
			<tbody>
				<%
				
					for(int i=0; i<dcList.size(); i++) {
						DeviceList dc = dcList.get(i); 
				%>
				<tr>
					<td><%=dc.getdevice_id()%></td>
					<td><%= dc.getdevice_name()%></td>
					<td><%= dc.getsystem_id() %></td>
					<td><%= dc.getitem_id() %></td>
					<%
					DBManager dbm2 = new DBManager();
					dbm2.connect();
					DeviceCommon dc2 = dbm2.getDeviceCommon(dc.getitem_id());
					dbm2.disconnect();
					%>
					<td><%=dc2.getmodel_name() %></td>
					<td><%= dc.gettable_name() %></td>
					<td><%= dc.getdeployment_time() %></td>
					<td><%= dc.getdeployment_location() %></td>
					<td><%= dc.getlatitude()%></td>
					<td><%= dc.getlongitude() %></td>
					<td>
						<button type="button" onclick="location.href='deviceModification.jsp?id=<%=dc.getitem_id()%>'" target="_blank" width=" 600px";>modify</button>
					</td>
					<td>
						<button type="button" onclick="location.href='actionDeviceList2.jsp?id=<%=dc.getdevice_id()%>&item_id=<%=dc.getitem_id() %>'" target="_blank" width=" 600px";>delete</button>
					</td>
					<td>
						<button type="button" onclick="location.href='actionDeviceList.jsp?id=<%=dc.getdevice_id()%>&item_id=<%=dc.getitem_id() %>'" target="_blank" width=" 600px";>delete</button>
					</td>
				</tr>

				<%
					}
				%>
					

			</tbody>
		</table>
		</div>
</body>
</html>
