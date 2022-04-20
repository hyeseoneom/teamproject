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
</head>
<body>
	<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
		<div class="col-md-6 px-0">
			<h1 class="display-4 fst-italic">주문하기</h1>
		</div>
	</div>
	<div class="container">
		<form method="post">
		<table>
			<colgroup>
					<col style="width:20%">
					<col style="width:80%">
			</colgroup>
			<tr>
				<td><label>주소</label></td>
				<td>
				<div style="margin-bottom:10px;">
				<input type="text" id="postcode" name="postcode" placeholder="우편번호"
					readonly> <input type="button"
					onclick="findpostcode()" class="btn btn-outline-secondary" value="우편번호 찾기" style="height:35px;"></div>
					<div>
				<input type="text" id="address" placeholder="주소" name="address"
					readonly> <input type="text" id="extraddress"
					name="extraddress" placeholder="상세주소">
					</div>
				<p class="text-danger" id="address_chk"></p>
			
			</tr>
			<tr>
				<td><label>연락처</label></td>
				<td><input type="tel" id="tel"name="tel">
			</tr>
		</table>
		<div>
				<input type="hidden" id="memberid" name="memberid"
					value="${user.memberid }"> <input type="hidden" id="grno"
					name="grno" value="${detail.grno}"> <input type="hidden"
					id="product" name="product" value="${detail.grproduct}"> <input
					type="hidden" id="price" name="price" value="${detail.grprice}">
					<input type="hidden" id="email" name="email" value="${user.email }">
			</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<br>
  <button class="btn btn-secondary" id="order" type="button">주문</button>
</div>

		</form>
	</div>
	<script>
	function findpostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("extraddress").focus();
			}
		}).open();
	}
	
	</script>
	<script type="text/javascript">
	$(function() {
		$("#order").click(function() {
			if ($("#postcode").val() == "") {
				$("#address_chk").empty();
				$("#tel_chk").empty();
				$("#address_chk").text("우편번호찾기를 눌러주세요");
				return false;
			} else if ($("#extraddress").val() == "") {
				$("#address_chk").empty();
				$("#tel_chk").empty();
				$("#address_chk").text("상세주소를 입력해주세요");
				$("#extraddress").focus();
				return false;
			} else if ($("#tel").val() == "") {
				$("#address_chk").empty();
				$("#tel_chk").empty();
				$("#tel_chk").text("연락처를 입력해주세요");
				$("#tel").focus();
				return false;
			} else {
				let grno = $("#grno").val();
				let product = $("#product").val();
				let price = $("#price").val();
				let memberid = $("#memberid").val();
				let postcode = $("#postcode").val();
				let address = $("#address").val();
				let extraddress = $("#extraddress").val();
				let tel = $("#tel").val();
				let email = $("#email").val();
				//가맹점 식별코드
				IMP.init('imp67152957');
				IMP.request_pay({
					pg : 'kcp',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : product, //결제창에서 보여질 이름
					amount : price, //실제 결제되는 가격
					buyer_name : memberid,
					buyer_tel : tel,
					buyer_addr : address,
					buyer_postcode : postcode,
					buyer_email : email
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						$.post('/order', {
							"grno" : grno,
							"memberid" : memberid,
							"product" : product,
							"price" : price,
							"tel" : tel,
							"postcode" : postcode,
							"address" : address,
							"extraddress" : extraddress
						}, function(data) {
							
							self.close();
						})
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			}

		})

	})
	</script>
</body>
</html>