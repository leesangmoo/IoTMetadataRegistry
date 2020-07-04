
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>

<%
	String id = (String)request.getParameter("id");
	System.out.println(id);

	request.setCharacterEncoding("UTF-8");
	String jsonIn = request.getParameter("jsonData");
	
	String dest = "C:/Users/Dsem/Desktop/기타 프로그램/jsontest/json10.json";
	// String jsonIn = request.getParameter("jsonData");
	System.out.println("test : " + jsonIn);

	String message = ""; // 결과 메시지
	String script = ""; // 결과 후 실행할 javascript 
	message = "성공";

	StringWriter str = new StringWriter();
	PrintWriter pw = new PrintWriter(str);

	pw.println(jsonIn);

	StringReader strReader = new StringReader(str.toString());
	FileWriter file = new FileWriter(dest, true);
	//System.out.println(strReader);
	file.append(str.toString());

	file.close();
%>

<html>

<head>

<script type="text/javascript">
	
</script>
<style>
  table {
    width: 100%;

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
 <script type="text/javascript">   
        function goBack(){
        window.history.back();
        	}
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

</head>

<body>


<center>
	<p><button type="button" onclick="goBack();">뒤로가기</button>
	<button type="button" onclick="location.href='DbSelect.jsp'">디바이스 목록 보기</button></p>
	<table id="example4" border="1px">
		<tr>
			<th>저장된 JSON형식 확인 </th>

		</tr>
		<tr>
			<tr>
			<td><%= jsonIn %></td>
			
		</tr>
			
		</tr>
		
	</table></center>
</body>

</html>

