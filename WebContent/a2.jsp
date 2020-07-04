
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>

<%
	String id = (String)request.getParameter("id");
	System.out.println(id);

	request.setCharacterEncoding("UTF-8");
	String jsonIn = request.getParameter("jsonData");
	
	String dest = "C:/Users/Dsem/Desktop/jsontest/json9.json";
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

<html>
<head>
<meta charset="utf-8" />
<title>float</title>
<style>
	ul{width:1500px;height:30px;background:green;list-style:none;padding-top:15px}
	ul li{float:left;margin-right:10px}					
	ul li a{font-size:12px;color:yellow;font-weight:bold;text-decoration:none}
</style>
</head>
<body>
	<ul>
	<li><a href="#">메일</a></li>
	<li><a href="#">카페</a></li>
	<li><a href="#">블로그</a></li>
	<li><a href="#">지식iN</a></li>
	<li><a href="#">쇼핑</a></li>
	<li><a href="#">사전</a></li>
	<li><a href="#">뉴스</a></li>
	<li><a href="#">증권</a></li>
	<li><a href="#">부동산</a></li>
	<li><a href="#">지도</a></li>
	<li><a href="#">영화</a></li>
	<li><a href="#">뮤직</a></li>
	<li><a href="#">책</a></li>
	<li><a href="#">웹툰</a></li>
	</ul>
</body>
</html>
	
</body>

</html>

