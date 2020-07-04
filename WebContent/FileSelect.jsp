<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.*"%>
<%@page import="java.io.IOException"%>
<%@page import="org.json.simple.JSONArray"%>

<%@page import="org.json.simple.JSONObject"%>

<%@page import="org.json.simple.parser.*"%>
<!DOCTYPE html>

<html>

<head>
<style>
table {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 5px;
}
</style>
<style>
p {
	width: 1700px;
	height: 60px;
	background: orange;
	list-style: none;
	padding-top: 15px
}

p {
	float: center;
	margin-right: 10px
}

p {
	font-size: 20px;
	color: black;
	font-weight: bold;
	text-decoration: none
}
</style>
<meta charset="UTF-8">
</head>
<body>
	<center>
		<p>JSON_File_조회<br>
			<button type="button" onclick="goBack();">뒤로 가기</button>
		</p>
	</center>
	<table width="100%" border="1">

<tr>
	<th>Id</th>
	<th>Key</th>
	<th>Value</th>
	<th>Key</th>
	<th>Value</th>
	<th>Key</th>
	<th>Value</th>
	<th>Key</th>
	<th>Value</th>				
	<th>Detail</th>
	</tr>
	<%!
	String[]ar2;
	String[]ar;
	%>
<% 	  

File file = new File("C:/Users/Dsem/Desktop/jsontest/json9.json");
String text = "";
ArrayList<String> JSONArray_string = new ArrayList<String>();
if (file.exists()) {
	BufferedReader inFile = new BufferedReader(new FileReader(file));
	 String sLine = null;
	while ((sLine = inFile.readLine()) != null) {
		text = text + sLine;
		if (sLine.substring(0, 1).equals("]")) {
			JSONArray_string.add(text);
			text = "";
		}
	}
}

JSONParser jsonParser = new JSONParser();
JSONArray parse2;
JSONArray a = new JSONArray();

Iterator iterator;

ArrayList<JSONArray> parseArray = new ArrayList<JSONArray>();

/* 시작 */
for (int i = 0; i < JSONArray_string.size(); i++) {
	parse2 = (JSONArray) jsonParser.parse(JSONArray_string.get(i));
	parseArray.add(parse2);

}

for (int j = 0; j < parseArray.size(); j++) {

	for (Object o : parseArray.get(j)) {

		JSONObject parse = (JSONObject) o;
		String Id = (String) parse.get("id");
	
		Set<String> s = parse.keySet();
		Collection s2 = parse.values();
		
		String[] arr = s.toArray(new String[s.size()]);
		String[] arr2 = (String[]) s2.toArray(new String[s2.size()]);
		
		//System.out.println(arr2[0]);
		iterator = s.iterator();
		Iterator<String> iterator2 = s2.iterator();
		
		String str = "";
		String str2 ="";
		while (iterator.hasNext() && iterator2.hasNext()) {
			str = (String) iterator.next();
			str2 = (String) iterator2.next();
			if(str.equals("id") || str2.equals(Id)){
				iterator.remove();
				//iterator2.remove();
				
				break;
				}
			} 
		  for (String aq: s) {
			  Set<String> v = parse.keySet();   
			   ar = v.toArray(new String[v.size()]);
			    System.out.println("KEY === " + aq); 
				  System.out.println("ar key test = " + ar[0] +" "+ ar[1] +" "+ ar[2] +" "+ ar[3]); 
			 
				} 
			for(Object awa : s2) {
				Collection v2 = parse.values();
				ar2 = (String[]) v2.toArray(new String[v2.size()]);
				System.out.println("VALUE === "+ awa);
				System.out.println("ar2 value test = " + ar2[0] +" "+ ar2[1] +" "+ ar2[2] +" "+ ar2[3]);
				
				
			}	
		%>
	<tr>
	<td><%=Id %></td>
	<%for(int i=0; i<s.size(); i++){%>
	<td><%=ar[i]%></td>
	<td><%= ar2[i]%></td>
<%}%>
	<td><button type="button" onclick="location.href='Detailp.jsp?ID=<%=Id%>&key0=<%=ar[0]%>&value0=<%=ar2[0]%>&key1=<%=ar[1]%>&value1=<%=ar2[1]%>&key2=<%=ar[2]%>&value2=<%=ar2[2]%>&key3=<%=ar[3]%>&value3=<%=ar2[3]%>'">Confirm</button></td>
	</tr>
	 
<%}
}
%>

</body>

</html>

</table>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">   
        function goBack(){
        window.history.back();
        	}
    </script>
   