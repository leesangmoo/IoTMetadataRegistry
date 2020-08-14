<%@page import="structures.DeviceList"%>
<%@page import="webmodules.AutoDBConnector"%>
<%@page import="structures.DeviceCommon"%>
<%@page import="webmodules.DBManager"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , java.util.*"%>
<%//actionRegistration.jsp %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style>
  table {
    width:20%;

    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 5px;
  }
 
</style>
<style>
	p{width:1700px;height:60px;background:orange;list-style:none;padding-top:15px}
		p{float:center;margin-right:10px}					
	p{font-size:20px;color:black;font-weight:bold;text-decoration:none}	
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">   
        function check(no){
        	if (no == 1){
        	document.myform.action = "DbJson.jsp";
        	}
        	else if (no == 2){
        		document.myform.action = "db2.jsp";
        	}
        	else if (no == 3){
        		document.myform.action = "db3.jsp";
        	}
        	else if (no == 4){
        		document.myform.action = "db4.jsp";
            	}
        	else{
        	return;
        	}
        	document.myform.submit();
        	}
    </script>
     <script type="text/javascript">   
        function goBack(){
        window.history.back();
        	}
        window.location.replace("deviceList.jsp");
    </script>
</head>

<body>
 <form name='myform' action="db2.jsp" method="post">
<center>
<p>디바이스 등록 페이지<br>
		<button  type="button" class="back" onclick="check(1)">재등록</button>
		<button type="button" onclick="goBack();">뒤로가기</button>
		<button type="button" onclick="location.href='DbSelect.jsp'">디바이스 목록 보기</button></p>
	</center>
	</form>
</body>
</html>

<%
	request.setCharacterEncoding("UTF-8");
	int item_id = Integer.parseInt(request.getParameter("item_id"));

	DBManager dbm = new DBManager();
	dbm.connect();
	DeviceCommon dc = dbm.getDeviceCommon(item_id);
	dbm.disconnect();
	
	String system_id = request.getParameter("system_id");
	String model_name = dc.getmodel_name();
	String device_name = request.getParameter("device_name");
	String table_name = "table_name";
	String time = request.getParameter("deployment_time");
	String location = request.getParameter("deployment_location");
	String lat = request.getParameter("lat");
	String lon = request.getParameter("lon");
	
	Connection conn=null;
 	PreparedStatement pstmt = null;
 	String str="";

  try{
     
        String jdbcUrl= "jdbc:mysql://203.234.62.115:3306/MetadataRegistry";
        String dbId="root";
        String dbPass= "1234";
 
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl ,dbId ,dbPass );
        
        String sql = "insert into device_register (item_id, system_id, device_name, table_name, deployment_time, deployment_location, latitude, longitude) values (?,?,?,?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
       
        pstmt.setInt(1, item_id);
        pstmt.setString(2, system_id);
        pstmt.setString(3, device_name);
        pstmt.setString(4, table_name);
        pstmt.setString(5, time);
        pstmt.setString(6, location);
        pstmt.setString(7, lat);
        pstmt.setString(8, lon);
        
        pstmt.executeUpdate();
        
        out.println("----------------------------------->>> 디바이스 등록 완료");
        
  }catch(Exception e){
           e.printStackTrace();
           out.println("----------------------------------->>> 디바이스 등록 실패");
  }finally{ //리소스 해제
	  if(pstmt != null)
		  try{
			  pstmt.close();
		  }catch(SQLException sqle){}
  	if(conn != null){
  		try{
  			conn.close();
  		}catch(SQLException sqle){}
  	}
  }

%>
<!-- 테이블 이름 잘라서 생성 -->
<%
	request.setCharacterEncoding("UTF-8");
	DBManager dbm2 = new DBManager();
	dbm2.connect();
	DeviceList dl = dbm2.getModifyDeviceList(item_id);
	dbm2.disconnect();
	//select 로 device_id 최신 값 받아오기
	int device_id = dl.getdevice_id();

	//table_name 생성 device / 0000 + device_id
	String tableno = "0000" + device_id;
	String table_name2 = "device" + tableno.substring(tableno.length() - 4);

	//update로 device id 의 테이블 name을 수정할 것.
	Connection conn2 = null;
	PreparedStatement pstmt2 = null;

	Class.forName("com.mysql.jdbc.Driver");

try{
	String jdbcDriver2 = "jdbc:mysql://203.234.62.115:3306/MetadataRegistry?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser2 = "root";
	String dbPass2 = "1234";

	conn2 = DriverManager.getConnection(jdbcDriver2, dbUser2, dbPass2);
	pstmt2 = conn2.prepareStatement("update device_register set table_name=? where device_id=?");
	pstmt2.setString(1, table_name2);
	pstmt2.setInt(2, device_id);
	pstmt2.executeUpdate();

}finally{
	if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException ex) {}
	if (conn2 != null) try { conn2.close(); } catch(SQLException ex) {}
 	}

%>

<!-- 자동 생성 테이블 -->
<%
	AutoDBConnector adb = new AutoDBConnector();
	adb.createTable(item_id,table_name2);
%>