<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점수정</title>
<style type="text/css">
textarea {
	width: 80%;
    height: 100px;
    border-radius:2px solid #000;
    margin:15px 15px 15px 0px;
}
body{
	background-color: #fff;
}
table {
	border:1px solid #fff;
	margin-left:550px;
}
td{
	font-weight:bold;
	padding:5px;
}
input{
	width: 250px;
  	height: 30px;
  	font-size: 15px;
 	border: 0;
  	border-bottom:2px solid #000;
  	outline: none;
  	padding-left: 18px;
  	background-color: #fff;
}
input:focus{
	border-bottom:4px solid #000;
}
#postcode{
	width: 250px;
  	border: 0;
  	border-bottom:2px solid #000;
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
	background-color:#fff	
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
#title{
	text-align:center;
	color:#000;
	background-color:#E4E8E6;
	padding:20px 0px;
	font-size:25px;
	font-weight:bold;
}
.left{
	max-height:300px;
	overflow:hidden;
}
.left img{
	width:100%;
	max-height:initial;
	margin-top:-30%;
}
</style>
</head>
<body>
<%@include file="../include/header.jsp" %>
<div class="left">
	<img id='updateimg' src="../upload/updatefood.jpg">
</div>

<p id="title">음식점수정<br>" ${Store.storename} "</p>

<form action="updateStore" method="post" enctype="multipart/form-data">
<table>
	<tr>
	<td><input type="hidden" name="storeid" value="${Store.storeid}">
	상호명</td><td><input type="text" id="Storename" name="Storename" value="${Store.storename}"></td>
	</tr>
	<tr>
	<td>주소</td><td><input type="text" id="postcode" name="Storeaddress" value="${Store.storeaddress}">
		  <!-- <input type="text" id="postcode" name="storeaddress" placeholder="상세주소"> -->
		  <input type="button" id="address" name="storeaddress" onclick="addPost()" value="우편번호 찾기"><br></td>
	</tr>
	<tr>
	<td>연락처</td><td><input type="text" id="Storephone" name="Storephone" value="${Store.storephone}"></td>
	</tr>
	<tr>
	<td>상세설명</td><td><textarea id="Storecontent" name="storecontent" placeholder="간단하게 입력하세요">${Store.storecontent}</textarea></td>
	</tr>
	<tr>
	<td>금액대</td><td><input type="text" id="Storeprice" name="Storeprice" value="${Store.storeprice}" ></td>
	</tr>
	<tr>
	<td>파일업로드</td><td><input type="file" id="file" name="file" value="${Store.storefilename}" multiple></td>
	</tr> 
	<tr>
	<td>파일경로</td><td><input type="text" id="Storepath" name="Storepath" value="${Store.storefilepath}" ></td>
	</tr>
	<tr>
	<td>파일사이즈</td><td><input type="text" id="Storefilesize" name="Storefilesize"value="${Store.storefilesize}"  ></td>
	</tr> 
	<tr>
	<td>한줄소개</td><td><input type="text" id="Storecomm" name="Storecomm" value="${Store.storecomm}"></td>
	</tr>
	<tr>
	<td>등록일</td><td><fmt:formatDate  value="${Store.foodregdate}" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
	<td></td><td><input class="next" type="submit" id="Storeupdate" value="수정">
		<input class="next" type="button" id="cancelStore" value="취소"></td>
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
		$("#Storeupdate").submit(function(){
		var result = confirm("정보를 수정하시겠습니까?");
		if (result){
			location.href="storelist";
		}else{
			
		}
		
	});
	
	$("#cancelStore").click(function(){
		var result=confirm("수정을 취소하시겠습니까?");
		if(result){
			location.href="storelist";
		}else{
			
		}
	});
</script>
</body>
<%@ include file="../include/footer.jsp" %>
</html>