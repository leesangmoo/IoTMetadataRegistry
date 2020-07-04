
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*, java.util.*, structures.*, webmodules.*"%>
<%//actionModification.jsp %>
<%
	String id = (String)request.getParameter("id");
	System.out.println(id);
	ArrayList<String> new_keylist = new ArrayList<String>();
	ArrayList<String> new_valuelist = new ArrayList<String>();
	
	
	// parameter로 모든 key value를 받아 arraylist로 넣기
	
	// String id = (String)request.getParameter("id");
	// String device_type = (String)request.getParameter("device_type");
	// String manufacturer = (String)request.getParameter("manufacturer");
	// String category = (String)request.getParameter("category");
	
	
	//그냥 싹다 받아온다.
	
	
	String DSize = request.getParameter("Dsize"); //ID 값을 제외한 JSON 객체 수 
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
//		key [i] = request.getParameter("Dkey" + i);
//		value [i]= request.getParameter("Dvalue" + i);
//		new_keylist.add(key[i]);
//		new_valuelist.add(value[i]);
		
		System.out.println();
	}
	
	DeviceSpecific new_ds = new DeviceSpecific();
	new_ds.setId(id);
	new_ds.setKeyList(new_keylist);
	new_ds.setValueList(new_valuelist);
	
	JsonManager jm = new JsonManager();
	jm.replaceJSONFile(new_ds);
	
	//FileManager fm = new FileManager();
	//ArrayList<DeviceSpecific> dslist = fm.getAllDeviceSpecific();
	//dslist = fm.replaceDeviceSpecific(dslist, new_ds);
	//fm.storeAllDeviceSpecific(dslist);
	
	request.setCharacterEncoding("UTF-8");
	//String jsonIn = request.getParameter("jsonData2");
	
	//String dest = "C:/Users/Dsem/Desktop/기타 프로그램/jsontest/json9.json";
	// String jsonIn = request.getParameter("jsonData");
	//System.out.println("test : " + jsonIn);

	//StringWriter str = new StringWriter();
	//PrintWriter pw = new PrintWriter(str);
	//pw.println(jsonIn);

	//StringReader strReader = new StringReader(str.toString());
	//FileWriter file = new FileWriter(dest, true);
	//file.append(str.toString());
	//file.close();
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

