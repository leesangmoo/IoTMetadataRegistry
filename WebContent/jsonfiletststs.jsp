<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.FileReader"%>

<%@page import="java.io.IOException"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import="org.json.simple.JSONObject"%>

<%@page import="org.json.simple.parser.*"%>
<table width="100%" border="1">
<th>name</th>
<th>age</th>
<th>msg</th>
<th>name</th>
<th>age</th>
<th>msg</th>
<%

	JSONParser parser = new JSONParser();
	 
	try {
 
		Object obj = parser.parse(new FileReader("c:\\json2.json"));
	
		JSONObject jsonObject = (JSONObject)obj;
		

		String Id = (String)jsonObject.get("Id");
		System.out.println(Id);
		String Device_name = (String)jsonObject.get("Device_name");
		String Model = (String)jsonObject.get("Model");
		String Category = (String)jsonObject.get("Category");
		String Datatype = (String)jsonObject.get("Datatype");
		String Unit = (String)jsonObject.get("Unit");
		//system.out.println(Model);
		//JSONArray msg = (JSONArray) jsonObject.get("Id");
		//JSONArray Device_name = (JSONArray) jsonObject.get("Device_name");
		//JSONArray Model = (JSONArray) jsonObject.get("Model");
		//JSONArray Category = (JSONArray) jsonObject.get("Category");
		//JSONArray Datatype = (JSONArray) jsonObject.get("Datatype");
		//JSONArray Unit = (JSONArray) jsonObject.get("Unit");
		// loop array
		//JSONArray msg = (JSONArray) jsonObject.get("messages");
		//Iterator<String> iterator = msg.iterator();
			%>	
			<tr>
			<td><%= String.valueOf(jsonObject.get("Id"))%></td>
			<td><%= String.valueOf(jsonObject.get("Device_name"))%></td>
			<td><%= String.valueOf(jsonObject.get("Model")) %></td>
			<td><%= String.valueOf(jsonObject.get("Category"))%></td>
			<td><%= String.valueOf(jsonObject.get("Datatype"))%></td>
			<td><%= String.valueOf(jsonObject.get("Unit")) %></td>							
		</tr>
		
		<%
		
 
	} catch (IOException e) {
		e.printStackTrace();
	} 
 
%>
</table>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<!DOCTYPE html>

<html>

<head>
 
<meta charset="UTF-8">


</head>

<body>


	<div id="animal-info"></div>

	

	</body>

</html>
