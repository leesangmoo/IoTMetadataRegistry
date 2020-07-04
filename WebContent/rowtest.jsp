<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@page import="java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">

<%
	String id = (String) request.getParameter("id");
	System.out.println(id);
%>

<html>
<head>
<style>
table {
	width: 30%;
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
	<form name='myform5' action="JsonFileTest2.jsp" method="POST">
		<center>
			<p>
				디바이스 정보 추가 등록 - JSON <br>
				<button type="submit" id="changeBtn">JSON File 저장</button>
				<button type="button" onclick="goBack();">뒤로 가기</button>
			</p>

			ID : <input type="text" id="id" name="id" value="<%=id%>"><br>
			<input type="button" id="append_row" name="append_row" value="add_row" style='width: 150px; height: 30px'>
			<table id="example2" border="1px">
				<tr>
					<th>Key</th>
					<th>Value</th>
					<th>Delete</th>
				</tr>
				
				<tr>
					<td><input type='text' id='key1' name='key1' value='null' placeholder='입력' style='width: 300px; height: 30px'></td>
					<td><input type='text' id='value1' name='value1' value='null' placeholder='입력' style='width: 300px; height: 30px'></td>
					<td><input type="button" name="delRow" class="delRow" value="Delete"></td>
				
				</tr>
				</center>
					<tbody id="AddOption">
			    </tbody>
			<!--  	<%
					for (int i = 0; i < 1; i++) {
				%>
				<tr>
			
					<td><input type='text' id='key<%=(i + 1)%>' name='key<%=(i + 1)%>' value='null<%=(i + 1)%>' placeholder='입력' style='width: 300px; height: 30px'></td>
					<td><input type='text' id='value<%=(i + 1)%>' name='value<%=(i + 1)%>' value='null<%=(i + 1)%>' placeholder='입력' style='width: 300px; height: 30px'></td>
				<td><a href="#" class="delete-link">Delete</a></td>
				</tr>
				</center>
				<%
					}
				%>-->
		
			</table>
			<br> <br> <strong> :: 출력결과 :: </strong> <br> <br>
			<%--
	String str = "hello";
	out.write(str);
	--%>
			<div id="result"></div>

			<input type='hidden' name='jsonData'>

<!-- 동적 테이블  -->
<script type="text/javascript">
	key_index = 2;
	value_index = 2;
	
	dataArr = new Array();
	// 객체 생성
	dataObj = new Object();
	 dataObj.id = $("#id").val();
    $('#append_row').click(function(){
        //alert("aa");

        var contents = '';
      
        contents += '<tr>';

        contents += '<td><input type = "text" id = "key' + key_index + '" name = "key' +(key_index++) + '"  style = "width : 300px; height : 30px"/></td>';
		
        contents += '<td><input type = "text" id = "value' + value_index + '" name = "value' +(value_index++) + '" style = "width : 300px; height: 30px"/></td>';

        contents += '<td><input type="button" name="delRow" class="delRow" value="Delete"/></td>';

        contents += '</tr>';
        
        $('#AddOption').append(contents); // 추가기능
       
        $('.delRow').click(function(){ // 삭제기능
        	key_index--;
			value_index--;
            $(this).parent().parent().remove(); 
            //alert("aaa");
        });
       
    });

</script>
		<!-- json 입력 받기  -->
			<script>
				$("#changeBtn").click(function() {
							//alert(key_index);
							var dataArr = new Array();
							// 객체 생성
							var dataObj = new Object();
							
							dataObj.id = $("#id").val();
							// 객체에 input 값을 담는다.
							
							//선언 하면 무조건 값이 들어와야함 
							for(var i = 1; i <key_index; i++){

								dataObj[$("#key" + i).val()] = $("#value" + i).val();
						
							}
							dataArr.push(dataObj);
							//dataObj.value= $("#st" + i).val();
						
							// 배열 생성된 객체 삽입
							
							// json 형태의 문자열로 만든다.
							var jsonData = JSON.stringify(dataArr, null, "\t");
							
							myform5.jsonData.value = jsonData;
							
							$("#result").html(jsonData);
							//console.log(jsonData);
							//alert(jsonData);
						});
		</script>

			<script type="text/javascript">
				function goBack() {
					window.history.back();
				}
			</script>
			
	</form>
</body>
</html>
