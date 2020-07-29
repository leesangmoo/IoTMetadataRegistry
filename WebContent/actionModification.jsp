
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.*, java.util.*, structures.*, webmodules.*"%>
<%//actionModification.jsp %>

<!-- Global metadata 수정 -->
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)request.getParameter("id");
	System.out.println(id);
	String model_name = (String)request.getParameter("model_name");
	String device_type = (String)request.getParameter("device_type");
	String manufacturer = (String)request.getParameter("manufacturer");
	String category = (String)request.getParameter("category");


	%>
<!-- specific metadata 입력 -->	
	<%
	Connection conn2 = null;
	PreparedStatement pstmt2 = null;
	request.setCharacterEncoding("UTF-8");

	ArrayList<String> new_keylist = new ArrayList<String>();
	ArrayList<String> new_valuelist = new ArrayList<String>();
	
	String DSize = request.getParameter("Dsize"); //ID 값을 제외한 JSON 객체 수 
	String key [] = new String [Integer.valueOf(DSize)];
	String value [] = new String [Integer.valueOf(DSize)];

	System.out.println("size test = " + DSize);
	String mdkey= null;
	String mdvalue = null;
	for(int i = 0; i < Integer.valueOf(DSize); i++){
		mdkey = request.getParameter("Dkey" + i);
		mdvalue =  request.getParameter("Dvalue" + i);
		
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
	mongoDBManager mdb = new mongoDBManager();
	mdb.InsertDeviceSpecific(id, new_keylist, new_valuelist);
	
%>

<html>
<head>
<script type="text/javascript">   
		function goBack(){
			window.history.back();
		}
		window.location.replace("deviceDetail.jsp?id=<%= id %> ");
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Device metadata modification page</title>
</head>
<body>
수정 데이터 저장 페이지
</body>
</html>

