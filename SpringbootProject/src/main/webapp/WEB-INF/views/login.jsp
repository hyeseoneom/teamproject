<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#btn").click(function(){
		let id = $("#memberid").val();
		let pw = $("#memberpw").val();
		if(!id&&!pw){
			alert("아이디나 패스워드를 정확하게 입력해주세요.");
			return false;
		}else{
			return true;
		}
	})
})
</script>
<style type="text/css">


</style>
</head>
<body>
	
	<div class="log-form">
  <h2>Login to your account</h2>
  <form:form action="login" method="post" modelAttribute="command">
  <form:errors element="div" />
    <input type="text" title="username" placeholder="id" name="memberid" id="memberid" />
    <input type="password" title="username" placeholder="password" name="memberpw" id="memberpw" />
    <button type="submit" class="btn" name ="btn" id="btn">로그인</button>
    <a class="forgot" href="#">아이디를 잊어버리셨나요?</a>
 </form:form>

</div><!--end log form -->
</body>
</html>