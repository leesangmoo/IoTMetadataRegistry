
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
	String device_type = (String)request.getParameter("device_type");
	String manufacturer = (String)request.getParameter("manufacturer");
	String category = (String)request.getParameter("category");

	Connection conn = null;
	PreparedStatement pstmt = null;

	Class.forName("com.mysql.jdbc.Driver");

	try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/jsptest?"+"useUnicode=true&characterEncoding=euckr";
	String dbUser = "jspid";
	String dbPass = "jsppass";

	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

	pstmt = conn.prepareStatement("update device_register_table set device_type=?, manufacturer=?, category=? where id=?");
	pstmt.setString(1, device_type);
	pstmt.setString(2, manufacturer);
	pstmt.setString(3, category);
	pstmt.setString(4, id);
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
	
	String DSize = request.getParameter("Dsize"); //ID 값을 제외한 JSON 객체 수 ㅇ
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
	 DBManager dbm = new DBManager();
	 String jdbcUrl= "jdbc:mysql://localhost:3306/jsptest" ;
     String dbId="jspid";
     String dbPass= "jsppass";

     Class.forName("com.mysql.jdbc.Driver");
     conn2=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
 	
     pstmt2 = conn2.prepareStatement("DELETE FROM specific_metadata WHERE id=?");
	 pstmt2.setString(1, id);
	 pstmt2.executeUpdate();
     
     String sql = "insert into specific_metadata (id, metadata_key, metadata_value) values (?,?,?) ON DUPLICATE KEY UPDATE id=?, metadata_key=?, metadata_value=?";

     pstmt2 = conn2.prepareStatement(sql);
    
     for(int i = 0; i < new_keylist.size();i++){
    		 pstmt2.setString(1, id);
             pstmt2.setString(2, new_keylist.get(i));
             pstmt2.setString(3, new_valuelist.get(i));
             pstmt2.setString(4, id);
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

