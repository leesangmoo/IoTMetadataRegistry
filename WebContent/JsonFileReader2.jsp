<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.BufferedReader"%>

<%@page import="java.io.FileReader"%>

<%@page import="java.io.IOException"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>파일 출력</title>
<button type="button" onclick="location.href='DbJson.jsp'">뒤로가기</button>
<br>
</head>

<body>



	<%
		BufferedReader br = null;

		try {

			br = new BufferedReader(new FileReader("C:\\Users\\Dsem\\Desktop\\jsontest\\json5"));

			String line = "";

			while ((line = br.readLine()) != null) {

				out.println(line + "<br />");

			}

		} catch (Exception e) {

			out.println(e.getMessage());

		} finally {

			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
				}

		}
	%>





</body>

</html>
