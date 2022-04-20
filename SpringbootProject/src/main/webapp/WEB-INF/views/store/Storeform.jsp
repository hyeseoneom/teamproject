<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점등록폼</title>
<style type="text/css">
textarea {
	width: 80%;
	height: 100px;
	margin:15px 15px 15px 0px;  	
 	border:2px solid #000;
  	outline-color: #F8932F;
  	background-color:#fff;
	}
textarea:focus{
	border-radius:2px solid #F8932F;
}
body{
	background-color: #fff;
}
table {
	border:1px solid #fff;
   	margin:0px 0px 0px 500px;
}        
tr{
	background:#fff;
	color: #000;
	width:100px; 
}
td{
	padding:5px;
	font-weight:bold;
}

#nic{
	text-align:center;
	color:#000;
	background-color:#E4E8E6;
	padding:20px 0px;
	font-size:30px;
	font-weight:bold;
}
input{
  	font-size:15px;
 	border: 0;
 	border-bottom:2px solid #000;
  	outline: none;
  	background-color: #fff;
  	padding:10px 0px;
}
input:focus{
	border-bottom:4px solid #000;
}
input[type="submit"]{
	border:1px solid #000;
	background-color:#000;
	color:white;
	border-radius:10px;
	width:20%;
	height:70%;
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
.preview img{
	margin-left:170%;
} 
</style>
</head>
<body>
<%@include file="../include/header.jsp" %>

<div class="left">
	<img id='foodimg' src="../upload/foodform..jpg">
</div>

<p id="nic">음식점등록</p>

<form action="Storeform" method="post" enctype="multipart/form-data" >
<table>
<tr>
	<tr class="preview">	
		<td><img id='imgbox' width="150px" height="auto" ></td>
	</tr>
	<tr>
	<td>상호명</td><td><input type="text" id="Storename" name="storename" placeholder="상호명을 입력하세요" required></td>
	</tr>
	<tr>
	<td>주소</td><td><input type="text" id="postcode" name="storeaddress" placeholder="우편번호">
		  <!-- <input type="text" id="postcode" name="storeaddress" placeholder="상세주소" required> -->
		  <input type="button" id="address" name="storeaddress" onclick="addPost()" value="우편번호 찾기"><br>
	</td>
	</tr>
	<tr>
	<td>연락처</td><td><input type="text" id="Storephone" name="storephone" placeholder="연락처를 입력하세요" required></td>
	</tr>
	<tr>
	<td>상세설명</td><td>
	<textarea id="Storecontent" name="storecontent" placeholder="상세내용을 입력하세요" required></textarea></td>
	</tr>
	<tr>
	<td>금액대</td><td><input type="text" id="Storeprice" name="storeprice" placeholder="금액을 입력하세요" required></td>
	</tr>
	<tr>
	<td>파일업로드</td><td><input type="file" id="file" name="file"  accept="image/*" onchange="openFile(event)" multiple required></td>
	</tr>
	<tr>
	<td>한줄소개</td><td><input type="text" id="Storecomm" name="storecomm" placeholder="간단하게 입력하세요" required></td>
	</tr>
	<tr>
	<td>등록일</td><td><input type="date" id="Storeregdate" name="storeregdate" required></td>
	</tr>
	<tr>
	<td></td><td><input type="submit" id="registerStore" value="등록">
		<input type="submit" id="cancelStore" value="취소"></td>
	
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

	var openFile = function(event) {
    var input = event.target;

    var reader = new FileReader();
    reader.onload = function(){
      var dataURL = reader.result;
      var imgbox = document.getElementById('imgbox');
      imgbox.src = dataURL;
    };
    reader.readAsDataURL(input.files[0]);
  };

</script>

<script>
	$("#registerStore").submit(function(){
			var result=confirm("등록하시겠습니까?")
			if(result){
				location.href="storelist";
			}else{
				
			}
	});
	
	$("#cancelStore").click(function(){
			var result=confirm("취소하시겠습니까?")
			if(result){
				location.href="storelist";
			}else{
				
			}
	});
</script>
</body>
<%@ include file="../include/footer.jsp" %>
</html>