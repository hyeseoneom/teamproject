<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
<style>
#mpage {
	text-align: center;
	margin:20px 0px 0px 0px;
}
h1{
	text-align :center;
	color:#646369
}
body{
	background-color: #fff;
}
table {
	border:1px solid #fff;
	border-collapse:collapse;
   	margin:2% 0%; 
    width:100%;
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
}
form{
	margin:3%;
}
select{
	border:2px solid #000;
	border-radius:10px;
	padding:5px;
}
option{
	color:#fff;
	background-color:#000;
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

.left{
	max-height:300px;
	overflow:hidden;
}
.left img{
	width:100%;
	max-height:initial;
	margin-top:-17%;
}
</style>
</head>
<body>
<body>
<%@include file="../include/header.jsp" %>

<div class="left">
	<img id='updatememimg' src="../upload/member2.png">
</div>

<div id="center">
	<h1>"${msearch}"로 검색한 결과입니다.</h1>

<div id="msearch" align="center">
	<form action="membersearch">
		<select name="msearchn">
			<option value="0">아이디</option>
			<option value="1">이름</option>
			<option value="2">연락처</option>
		</select>
<input type="text" name="msearch" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
	</form>
</div>
		<c:if test="${count != 0 }">
			<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>주소</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>pet여부</th>
					<th>수정/삭제</th>
				</tr>
				<c:forEach items="${mList}" var="msearch">
					<tr>
						<td>${msearch.memberid}</td>	
						<td>${msearch.name}</td>
						<td>${msearch.phone}</td>
						<td>${msearch.address}</td>
						<td>${msearch.gender}</td>
						<td><fmt:formatDate value="${msearch.birthday}" dateStyle="short"/></td>
						<td>${msearch.email}</td>
						<td>${msearch.pet}</td>
						<td>
							<input type="button" value="수정" id="update" onclick="updatemember('${msearch.memberid}')">
							<input type="button" value="삭제" id="delete" onclick="deletemember('${msearch.memberid}')">
						</td>
					</tr>
				</c:forEach>
			</table>
			<div id="mpage">
				<c:if test="${begin > pageNum }">
					<a href="/member/membersearch?p=${begin-1}&msearch=${msearch}&msearchn=${msearchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="/member/membersearch?p=${i}&msearch=${msearch}&msearchn=${msearchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="/member/membersearch?p=${end+1}&msearch=${msearch}&msearchn=${msearchn}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	검색 조건에 맞는 회원이 없습니다.
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