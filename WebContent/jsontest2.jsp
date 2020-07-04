<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
    <head>
        <meta charset="utf-8">
        <title>JSON 오브젝트 만들기</title>
    </head>
    <body>
        <textarea id="jText" cols="40" rows="10">
        {
            "employee":[
                {"firstName":"kim", "lastName":"hoon"}, 
                {"firstName":"hong", "lastName":"gil"}, 
                {"firstName":"dool", "lastName":"li"}  
            ]    
        }
        </textarea>
        <!--http://json.parser.online.fr-->
        <input type="button" value="json변환" onclick="jsonp()"/>
        <br/>
        <input id="num" type="text"/>번째 사원 이름<br/>
        <input type="button" value="추출" onclick="jPrint()"/>
    </body>
    <script>
        
        var jObj;
        
        function jsonp(){
            var txt = document.getElementById("jText").value;
            //console.log(txt);            
            jObj = JSON.parse(txt);
            //console.log(jObj);
        }
        
        function jPrint(){
            //console.log(jObj);            
            var i = document.getElementById("num").value;
            console.log(jObj.employee[i-1]);
            var fn = jObj.employee[i-1].firstName;
            var ln = jObj.employee[i-1].lastName;
            alert(fn+", "+ln);
            
        }
    </script>
</html>
 
</body>
</html>


