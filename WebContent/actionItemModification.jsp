
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.*, java.util.*, structures.*, webmodules.*"%>
<%//actionModification.jsp %>

<!-- Global metadata 수정 -->
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(id);
	String model_name = (String)request.getParameter("model_name");
	String device_type = (String)request.getParameter("device_type");
	String manufacturer = (String)request.getParameter("manufacturer");
	String category = (String)request.getParameter("category");

	Connection conn = null;
	PreparedStatement pstmt = null;

	Class.forName("com.mysql.jdbc.Driver");

	try{
	String jdbcDriver = "jdbc:mysql://203.234.62.115:3306/MetadataRegistry?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser = "root";
	String dbPass = "1234";

	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

	pstmt = conn.prepareStatement("update global_metadata set model_name=?, device_type=?, manufacturer=?, category=? where item_id=?");
	pstmt.setString(1, model_name);
	pstmt.setString(2, device_type);
	pstmt.setString(3, manufacturer);
	pstmt.setString(4, category);
	pstmt.setInt(5, id);
	pstmt.executeUpdate();
	//pstmt.setString(5, time);

	}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	 	}

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
	DeviceSpecific new_ds = new DeviceSpecific();
	
	try{
	 //DBManager dbm = new DBManager();
	 //String jdbcUrl= "jdbc:mysql://localhost:3306/jsptest" ;
	 //String dbId="jspid";
     //String dbPass= "jsppass";
     String jdbcUrl= "jdbc:mysql://203.234.62.115:3306/MetadataRegistry" ;
     String dbId="root";
     String dbPass= "1234";

     Class.forName("com.mysql.jdbc.Driver");
     conn2=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	
     pstmt2 = conn2.prepareStatement("DELETE FROM specific_metadata WHERE item_id=?");
	 pstmt2.setInt(1, id);
	 pstmt2.executeUpdate();
     
     String sql = "insert into specific_metadata (item_id, metadata_key, metadata_value) values (?,?,?) ON DUPLICATE KEY UPDATE item_id=?, metadata_key=?, metadata_value=?";

     pstmt2 = conn2.prepareStatement(sql);
    
     for(int i = 0; i < new_keylist.size();i++){
    		 pstmt2.setInt(1, id);
             pstmt2.setString(2, new_keylist.get(i));
             pstmt2.setString(3, new_valuelist.get(i));
             pstmt2.setInt(4, id);
             pstmt2.setString(5, new_keylist.get(i));
             pstmt2.setString(6, new_valuelist.get(i));
             pstmt2.executeUpdate();    		 
     }
        System.out.println("----------------------------------->>> 디바이스 등록 완료");
     
}catch(Exception e){
        e.printStackTrace();
        System.out.println("----------------------------------->>> 디바이스 등록 실패");
}finally{ //리소스 해제
	  if(pstmt2 != null)
		  try{
			  pstmt2.close();
		  }catch(SQLException sqle){}
	if(conn2 != null){
		try{
			conn2.close();
		}catch(SQLException sqle){}
	}
}	
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
		window.location.replace("deviceDetail.jsp?id=<%= id %> ");
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Device metadata modification page</title>
</head>
<body>
수정 데이터 저장 페이지
</body>
</html>

