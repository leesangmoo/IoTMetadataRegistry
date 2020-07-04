
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>

<%
	String id = (String)request.getParameter("id");
	System.out.println(id);
	String c1 = (String)request.getParameter("cate1");
	System.out.println(c1);
	String v1 = (String)request.getParameter("st1");
	System.out.println(v1);
	String c2 = (String)request.getParameter("cate2");
	System.out.println(c2);
	String v2 = (String)request.getParameter("st2");
	System.out.println(v2);
	String c3 = (String)request.getParameter("cate3");
	System.out.println(c3);
	String v3 = (String)request.getParameter("st3");
	System.out.println(v3);
	String c4 = (String)request.getParameter("cate4");
	System.out.println(c4);
	String v4 = (String)request.getParameter("st4");
	System.out.println(v4);
	
%>

<html>

<head>

<script type="text/javascript">
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

</head>

<body>


	<button type="button" onclick="location.href='DbJson.jsp'">뒤로가기</button>
	<table id="example4" border="1px">
		<tr>
			<th>json 출력  // jsp 값 넘기기 test</th>

		</tr>
		<tr>
			<td><%= id %></td>
		</tr>
		<tr>
			<td><%= c1 %></td>
		</tr>
		<tr>
			<td><%= v1 %></td>
		</tr>		
		<tr>
			<td><%= c2 %></td>
		</tr>		
		<tr>
			<td><%= v2 %></td>
		</tr>		
		<tr>
			<td><%= c3 %></td>
		</tr>		
		<tr>
			<td><%= v3 %></td>
		</tr>		
		<tr>
			<td><%= c4 %></td>
		</tr>		
		<tr>
			<td><%= v4 %></td>
		</tr>		
	</table>
</body>

</html>

