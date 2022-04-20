<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
body{
	background-color: #fff;
}
table {
	float:center;
	border:1px solid #fff;
	margin:0px 0px 0px 470px;
	padding:15px 50px;
}
td{
	border:0;
	font-size:17px;
	font-weight:bold;
	padding: 5px;
}
h1{
	text-align:center;
	color:#000
}
input{
	margin:10px;
	width: 250px;
  	height: 30px;
  	font-size: 15px;
 	border: 0;
  	border-bottom:2px solid #000;
  	outline: none;
  	padding-left: 18px;
  	background-color: #fff;
  	display:center;
}
#postcode{
	width: 250px;
  	border: 0;
  	border-bottom:2px solid #000;
}
input:focus{
	border-bottom:4px solid #000;
}
input[type="submit"]{
	border:1px solid #fff;
	background-color:#000;
	color:white;
	border-radius:10px;
	width: 100px;
  	height: 30px;
  	font-size:12px;
  	padding:5px;  	
} 
input[type="submit"]:hover{
	color:#000;
	border:2px solid #000;
	background-color:#fff;
}
input[type="button"]{
	border:1px solid #fff;
	background-color:#000;
	color:white;
	border-radius:10px;
	width: 100px;
  	height: 30px;
  	font-size:12px;
  	padding:5px;  	
} 
input[type="button"]:hover{
	color:#000;
	border:2px solid #000;
	background-color:#fff;
}
.left{
	max-height:300px;
	overflow:hidden;
}
.left img{
	width:100%;
	max-height:initial;
	margin-top:-15%;
}
.right{
	float:left;
}
#nic{
	text-align:center;
	color:#000;
	background-color:#E4E8E6;
	padding:20px 0px;
	font-size:30px;
	font-weight:bold;
}
</style>
</head>
<body>
<%@include file="../include/header.jsp" %>

<div class="left">
	<img id='memberimg' src="../upload/member1.jpg">
</div>


<p id="nic">${Member.memberid}님 회원정보수정</p>
<form  action="/member/updatemember" method="post" >
<table>
	<tr>
		<td>id</td><td> &nbsp; &nbsp; ${Member.memberid}
		<input type="hidden" name="memberid" value="${Member.memberid}">
		</td>
	</tr>
	<tr>
		<td>pw</td><td><input type="password" id="pw" name="memberpw" value="${Member.memberpw}"></td>
	</tr>
	<tr>
		<td>name</td><td><input type="text" id="name" name="name" value="${Member.name}"></td>
	</tr>
	<tr>
		<td>phone</td><td><input type="text" id="phone" name="phone" value="${Member.phone}"></td>
	</tr>
	<tr>
		<td>address</td><td><input type="text" id="postcode" name="address" value="${Member.address}">
		  <!-- <input type="text" id="postcode" name="storeaddress" placeholder="상세주소" required> -->
		  <input type="button" id="address" name="storeaddress" onclick="addPost()" value="우편번호 찾기"><br>
	</td>
	</tr>	
	<tr>
		<td>gender</td><td><input type="text" id="gender" name="gender" value="${Member.gender}"></td>
	</tr>
	<tr>
		<td>birthday</td><td>&nbsp; &nbsp;<fmt:formatDate value="${Member.birthday}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<td>email</td><td><input type="text" id="email" name="email" value="${Member.email}"></td>
	</tr>
	<tr>
		<td>pet</td><td><input type="text" id="pet" name="pet" value="${Member.pet}"></td>
	</tr>
	<tr>
		<td></td><td><input type="submit" value="수정" id="updateok">
		<input type="button" value="취소" id="deleteok"></td>
	</tr>
</table>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>//파일업로드
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector('#postcode').value = data.address;

        }
    }).open();
}
</script>
<script>
	$("#updateok").submit(function(){
		alert("수정되었습니다.")
		location.href="memberAll";
	})
	
	$("#deleteok").click(function(){
		location.href="memberAll";
	})
</script>
</body>
<%@ include file="../include/footer.jsp" %>
</html>