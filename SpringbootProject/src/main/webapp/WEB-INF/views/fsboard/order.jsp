<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$("#order").click(function() {
			
			let fsno = $("#fsno").val();
			let memberid = $("#memberid").val();
			let food = $("#food").val();
			let tel = $("#tel").val();

			if ($("#tel").val() == "") {
				$("#tel_chk").empty();
				$("#tel_chk").text("연락처를 입력해주세요");
				$("#tel").focus();
				return false;
			} 
			$.post("/fsboard/order",{"fsno":fsno,"memberid":memberid,"food":food,"tel":tel},function(data){
				opener.location.reload();
				window.close();
			})
	
		})

	})
</script>
</head>
<body>
	<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
		<div class="col-md-6 px-0">
			<h1 class="display-4 fst-italic">배달비 쉐어</h1>
		</div>
	</div>
	<div class="container">
		<form>
			<div>
				<label for="tel">연락처</label><br> <input type="tel" id="tel"
					name="tel">
				<p class="text-danger" id="tel_chk"></p>
				<br>
			</div>
			<div>
				<input type="hidden" id="memberid" name="memberid"
					value="${user.memberid }"> <input type="hidden" id="fsno"
					name="fsno" value="${dto.fsno}"> <input type="hidden"
					id="food" name="food" value="${dto.fsfood}">
			</div>
			<input type="button" id="order" value="주문">
		</form>
	</div>
</body>
</html>