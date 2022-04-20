<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
#mpage{text-align: center;}
 .chart{
	display: flex;
	justify-content:center;
	margin:20px;
}
.allcount{
	font-size:20px;
	font-weight:bold;
}
body{
	background-color: #fff;
}
table {
	border:1px solid #fff;
	border-collapse:collapse;  
   	width:100%;  
   	margin-top:20px;
    }
th{
	border:1px solid white;
	background: #000;
	color:#fff;
	width: 150px;
    }
td{
	border-bottom:1px solid lightgrey;
	text-align:center;
	padding: 5px;
}
tr:hover{
	border-collapse: collapse;
	background-color: lightgrey;
    color: black;	
}
h1{
	text-align: center;
	color:#000;
	border-top:2px solid #000;
	border-bottom:2px solid #000;
}
#main{
	float:right;
	font-size:17px;
	margin:0px 20px 0px -10px;
}
form{
	margin:auto;
}

input[type="button"]{
	border:1px solid #000;
	background-color:#000;
	color:#fff;
	border-radius: 10px;	
}
#update:hover{
	color:#fff;
	border:1px solid #02B1FB;
	background-color:#02B1FB;	
}
#delete:hover{
	color:#fff;
	border:1px solid #F81032;
	background-color:#F81032;	
}
input[type="submit"]{
	border:1px solid #fff;
	background-color:#000;
	color:#fff;
	border-radius:10px;
	padding:5px;
} 
input[type="submit"]:hover{
	color:#000;
	border:1px solid #000;
	background-color:white;
}
input[type="text"]{
	 width:200px;
 	 height:20px;
  	 font-size:15px;
  	 background-color:#fff;  	 
  	 border-right:0px; 
  	 border-top:0px; 
  	 border-left:0px;
  	 border-bottom:2px solid #000;
  	 text-align:center; 
}
input[type="text"]:focus {outline:none;}
select{
	border:2px solid #000;
	border-radius:10px;
	padding:5px;
}
option{
	color:#fff;
	background-color:#000;
}
</style>
</head>
<body>
<%@include file="../include/header.jsp" %>
<div>
<h1>회원목록</h1>
</div>


<div class="allcount">
	<p>전체회원수 ${count}명</p>
</div>

<div class="chart">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<canvas id="pie-chart" width="250" height="250"></canvas>
<script>




let dtos = ${dto};
console.log(dtos);// [{"gender":"여","count":11},{"gender":"남","count":2}];

let w;
let m;
for(index in dtos){
	if(index == 0){
		m = dtos[index].count;
	}else{
		w = dtos[index].count;
	}
}
new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["남","여"],
      datasets: [{
        label: "Gender",
        backgroundColor: ["skyblue","pink"],
        data: [m,w]
      }]
    },
    options: {
    	responsive:false,
      title: {
        display: true,
        text: '성별비율',
        
      }
    }
});

</script>
</div>
<div id="msearch" align="center" >
<form action="membersearch">
<select name="msearchn">
	<option value="0">아이디</option>
	<option value="1">이름</option>
	<option value="2">연락처</option>
</select>
<input type="text" name="msearch" size="20" maxlength="50" placeholder="검색어를 입력하세요"/>
<input type="submit" value="검색"/>
</form>
</div>

<c:if test="${count != 0 }">

<table>
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>연락처</th>
			<th>주소</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>이메일</th>
			<th>pet유무</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${mList}" var="memberAll">
		<tr>
			<td>${memberAll.memberid}</td>	
			<td>${memberAll.name}</td>
			<td>${memberAll.phone}</td>
			<td>${memberAll.address}</td>
			<td>${memberAll.gender}</td>
			<td><fmt:formatDate value="${memberAll.birthday}" dateStyle="short"/></td>
			<td>${memberAll.email}</td>
			<td>${memberAll.pet}</td>
			<td><input type="button" id="update" value="수정" onclick="updatemember('${memberAll.memberid}')">
			<input type="button" id="delete" value="삭제" onclick="deletemember('${memberAll.memberid}')"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div id="mpage">
		<c:if test="${begin > pageNum}">
		<a href="memberAll?p=${begin-1}">[이전]</a>
		</c:if>
		<c:forEach begin="${begin}" end="${end}" var="i">
			<a href="memberAll?p=${i}">${i}</a>
		</c:forEach>
		<c:if test="${end < totalPages }">
		<a href="memberAll?p=${end +1}">[다음]</a>
		</c:if>
	</div>
	</c:if>
<div align="center">
	<c:if test="${count ==0}">
		회원이 없습니다.
	</c:if>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function updatemember(id){
		var result =confirm("회원정보를 수정 하시겠습니까?");
		if(result){
			location.href="updatemember?id="+id;
		}else{
		
		}
		
	};
	
	function deletemember(id){
		var result =confirm("회원정보를 삭제 하시겠습니까?");
		if(result){
			location.href="deletemember?id="+id;
		}else{
		
		}
		
	};

</script>
</body>
<%@ include file="../include/footer.jsp" %>
</html>