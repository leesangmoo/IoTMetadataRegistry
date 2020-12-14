
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.*, java.util.*, structures.mysql.*, webmodules.mysql.*"%>
<%//actionModification.jsp %>

<!-- Global metadata 수정 -->
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id")); 
	
	DBManager dbm = new DBManager();
	dbm.connect();
	DeviceCommon dc = new DeviceCommon();
	
	dc.setId(id);
	dc.setmodel_name(request.getParameter("model_name"));
	dc.setDevice_type(request.getParameter("device_type"));
	dc.setManufacturer(request.getParameter("manufacturer"));
	dc.setCategory(request.getParameter("category"));
	dbm.updateGlobalList(dc);
	//dbm.disconnect();
%>

<!-- specific metadata 입력 -->	
<%
	Connection conn2 = null;
	PreparedStatement pstmt2 = null;
	request.setCharacterEncoding("UTF-8");

	ArrayList<String> new_keylist = new ArrayList<String>();
	ArrayList<String> new_valuelist = new ArrayList<String>();
	
	String DSize = request.getParameter("Dsize"); //동적 테이블 크기 가져오기
	String key [] = new String [Integer.valueOf(DSize)];
	String value [] = new String [Integer.valueOf(DSize)];

	System.out.println("size test = " + DSize);
	
	for(int i = 0; i < Integer.valueOf(DSize); i++){
		String mdkey = request.getParameter("Dkey" + i);
		String mdvalue =  request.getParameter("Dvalue" + i);
		
		System.out.print(i + " - key : " + mdkey + " |  value : " + mdvalue);
		
		if ( !(mdkey=="" || mdkey==null 
			|| mdvalue == "" || mdvalue==null)) {
			if (!(mdkey.equals("null") && mdvalue.equals("null"))) {
				new_keylist.add(mdkey);
				new_valuelist.add(mdvalue);
				
				System.out.print("  added");	
			}
		}
		System.out.println();
	}
    
     dbm.deleteSpecificTable(id);
     dbm.insertSpecificList(id, new_keylist, new_valuelist);
     dbm.disconnect();
    
%>
<!-- Specific metadta 수정할시 테이블 자동 변경 -->
<%
//	DBManager dbm = new DBManager();
//dbm.connect();

//DeviceInfo dl = dbm.getDeviceInfo(id);
//dbm.disconnect();

//AutoDBConnector adb = new AutoDBConnector();
//adb.deleteTable(dl.gettable_name());
//adb.createTable(id, dl.gettable_name());
%>
<html>
<head>
<script type="text/javascript">   
		function goBack(){
			window.history.back();
		}
		window.location.replace("deviceDetail.jsp?id=<%=id %>");
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Device metadata modification page</title>
</head>
<body>
수정 데이터 저장 페이지
</body>
</html>
