<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script><!-- 최신버전 제이쿼리 -->




<table cellpadding='2' cellspacing='0' border="1" width="500">

    <thead>

        <tr>

            <th>상품명</th>

            <th>가격</th>

            <th>개수</th>

            <th>합계</th>

            <th><input type="button" value="추가" onclick="inRowLast()"/></th>

        </tr>

    </thead>

    <tbody id="inRowLast()">

    

    </tbody>

</table>






<script>

 

// 동적테이블을 삭제 해 주는 함수

  function delRow()
    {

   tb1.deleteRow(tb1.clickedRowIndex); // 테이블의 행번호를 받아 동적테이블을 삭제 한다.
   alert(tb1.clickedRowIndex);    

    }

 

// 동적테이블을 추가 해 주는 함수
 function inRowLast()
    {
        if(fNum > 5000) { return false; }
        else {
          if(document.getElementById){
                var tbl = document.getElementById('tb1');
            }
            else
            {
                var tbl = document.all['tb1'];
            }
 
            var tRow = tbl.insertRow();   
// 이번소스의 제일 중요한 부분이다.

// 마우스가 동적테이블 위에 있으면 그 동적 테이블에 행 번호를 부여해 주는 함수이다.

// 삭제 버튼을 위해서 필요~
    tRow.onmouseover=function(){
     tb1.clickedRowIndex = this.rowIndex
    }
    

// 넣고 싶은 테이블 소스를 넣자.
    var uploadOBJ = "<TABLE cellSpacing=5 cellPadding=5 border=0 align=center>

    var uploadOBJ += "<TR><td><input type="text" name="test" value="$list[id]"></td></tr>";

    var uploadOBJ = "</TABLE>";
  

// 동적테이블 추가하기.

// 정확히 말하면 테이블 안의 셀 안에 테이블을 추가시켜주고있다.
   tRow.insertCell().innerHTML = uploadOBJ

 

   fNum++;
        }
    }

</script>



</body>
</html>