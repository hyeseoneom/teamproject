<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>룸쉐어</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords"
	content="RoomShare, It&amp;apos;s That Design Feeling">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="/js/update.js"></script>

<link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/roomwrite.css" media="screen">

<script class="u-script" type="text/javascript" src="/js/nicepage.js"
	defer=""></script>
<script class="u-script" type="text/javascript" src="/js/jquery.js"
	defer=""></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="generator" content="Nicepage 4.6.5, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">


<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="roomwrite">
<meta property="og:type" content="website">
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />





	<section class="u-align-center u-clearfix u-section-1" id="sec-cc67">
		<div class="u-align-left u-clearfix u-sheet u-sheet-1">
			<form method="post" id="writeform" enctype="multipart/form-data" action="/room/update">
				<input type="hidden" name="roomno" value="${room.roomno}">
				<h3 style="margin-left: 18%; margin-top: 1%;">
					<b>룸쉐어 수정</b>
				</h3>
				<center>

					<div id="map" class="${room.roomaddress }"
						style="width: 70%; height: 350px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>

					<script type="text/javascript" src="/js/map2.js"></script>
				</center>
				<table border="1">
					<tr>
						<td class="orange">제목<span style="color: red">*</span></td>
						<td><input name="roomtitle" class="roomtitle"
							style="width: 50%;" value="${room.roomtitle }" />
							<p class="text-danger" id="title_chk"></p></td>
					</tr>
					<tr>
						<td class="orange">작성자<span style="color: red">*</span></td>
						<td><input name="memberid" class="noborder"
							value="${room.memberid }" readonly></td>
					</tr>
					<tr>
						<td class="orange">주소<span style="color: red">*</span></td>
						<td><input name="roomaddress" id="roomaddress" class="pp"
							value="${room.roomaddress }">
							<button type="button" onclick="sample6_execDaumPostcode()"
								id="adr_search">주소찾기</button>
							<button type="button" id="mapsearch" name="mapsearch">검색</button>
							<p class="text-danger" id="address_chk"></p></td>
					</tr>
					<tr>
						<td class="orange">연락처<span style="color: red">*</span></td>
						<td><input name="roomphone"
							placeholder="연락처 또는 카카오톡ID를 기재해주세요." class="pp"
							value="${room.roomphone }">
							<p class="text-danger" id="phone_chk"></p></td>
					</tr>
					<tr>
						<td class="orange">입주가능날짜<span style="color: red">*</span></td>
						<td><input type="date" id="roomdate" name="roomdate">
							<p class="text-danger" id="date_chk"></p></td>
					</tr>
					<tr>
						<td class="orange">기간<span style="color: red">*</span></td>
						<td><div id="selectgroup">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under3m" value="3개월 미만" checked> <label
										class="form-check-label" for="under3m"> 3개월 미만 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under6m" value="3개월 ~ 6개월"> <label
										class="form-check-label" for="under6m"> 3 ~ 6개월 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under1y" value="6개월 ~ 1년"> <label
										class="form-check-label" for="under1y"> 6개월 ~ 1년 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under2y" value="1년 ~ 2년"> <label
										class="form-check-label" for="under2y"> 1 ~ 2년 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="over2y" value="2년 이상"> <label
										class="form-check-label" for="over2y"> 2년 이상 </label>
								</div>
							</div></td>
					</tr>
					<tr>
						<td class="orange">사진</td>
						<td><input type="file" id="roompic" name="roompic"
							aria-describedby="inputGroupFileAddon04" aria-label="Upload"
							multiple="multiple" accept="image/*">
							<div id="preview"></div> <script type="text/javascript"
								src="/js/uploadimg.js"></script></td>
					</tr>
					<tr>
						<td class="orange">상세내용<span style="color: red">*</span></td>
						<td><textarea name="roomcontent" cols="40" rows="10"
								placeholder="400자 이내" class="pp" >${room.roomcontent }</textarea></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="수정" id="btn"> <input type="reset" value="초기화"
							id="btn"></td>
					</tr>
				</table>
				<p class="d-none" id="fmtdate"><fmt:formatDate value="${room.roomdate}" pattern="yyyy-MM-dd" /></p>
				<p class="d-none" id="period">${room.roomperiod }</p>
			</form>

		</div>
	</section>


<script type="text/javascript">
$(function(){
	var date = $("#fmtdate").text();
	$("#roomdate").val(date);
	
	var period = $("#period").text();
	if(period == "3개월 미만"){
		$("#under3m").prop("checked",true);
	} else if(period == "3개월 ~ 6개월"){
		$("#under6m").prop("checked",true);
	} else if(period == "6개월 ~ 1년"){
		$("#under1y").prop("checked",true);
	}else if(period == "1년 ~ 2년"){
		$("#under2y").prop("checked",true);
	}else{
		$("#over2y").prop("checked",true);
	}
})
</script>







<!-- 



	<main>

		<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
			<div class="col-md-6 px-0">
				<h1 class="display-4 fst-italic">Room Share</h1>
			</div>
		</div>

		<div class="container">
			<h1>룸쉐어 글쓰기</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/room/list">
					<button class="btn btn-outline-dark btn-sm" type="button">목록</button>
				</a>
			</div>
			<hr>
			<form action="/room/update" method="post"
				enctype="multipart/form-data" id="updateform">
				<input type="hidden" name="roomno" value="${room.roomno}">
				<div class="row">
					<div class="col-sm-9">
						<div class="mb-3">
							<label for="roomtitle" class="form-label">제목</label> <input
								class="form-control" id="roomtitle" name="roomtitle"
								placeholder="제목" value="${room.roomtitle }">
						</div>
						<p class="text-danger" id="title_chk"></p>
					</div>
					<div class="col-sm-3">
						<div class="mb-3">
							<label for="memberid" class="form-label">아이디</label> <input
								class="form-control" id="memberid" name="memberid"
								placeholder="아이디" value="${room.memberid }" readonly>
						</div>
					</div>
				</div>
				<hr>
				<div class="input-group">
					<input type="file" class="form-control" id="roompic" name="roompic"
						aria-describedby="inputGroupFileAddon04" aria-label="Upload"
						multiple="multiple" accept="image/*">
				</div>
				<div id="preview"></div>
				<script type="text/javascript" src="/js/uploadimg.js"></script>
				<hr>
				<div class="row">
					<div class="col-sm-6">
						<p>주소</p>
						<div class="input-group mb-3">
							<input class="form-control" id="roomaddress" name="roomaddress"
								placeholder="주소찾기를 눌러주세요" readonly value="${room.roomaddress }">
							<button type="button" onclick="sample6_execDaumPostcode()"
								class="btn btn-outline-secondary" id="adr_search">주소찾기</button>
							<button type="button" id="mapsearch" name="mapsearch"
								class="btn btn-outline-primary">검색</button>
						</div>
						<p class="text-danger" id="address_chk"></p>
					
						<div id="map" class="${room.roomaddress }"
							style="width: 100%; height: 350px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>

						<script type="text/javascript" src="/js/map2.js"></script>
					</div>
					<div class="col-sm-6">
						<div class="mb-3">
							<label for="roomphone" class="form-label">연락처</label> <input
								class="form-control" id="roomphone" name="roomphone"
								placeholder="ex)000-0000-0000 또는 카카오톡 아이디"
								value="${room.roomphone }">
						</div>
						<p class="text-danger" id="phone_chk"></p>
						<hr>
						<div class="mb-3">
							<label for="roomdate" class="form-label"> 입주가능날짜 </label> <input
								type="date" class="form-control" id="roomdate" name="roomdate"
								value="">
						</div>
						<p class="d-none" id="fmtdate">
							<fmt:formatDate value="${room.roomdate}" pattern="yyyy-MM-dd" />
						</p>
						<p class="text-danger" id="date_chk"></p>
						<hr>

						<fieldset>
							<legend class="col-form-label">룸쉐어 기간</legend>
							<div id="selectgroup">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under3m" value="3개월 미만" checked> <label
										class="form-check-label" for="under3m"> 3개월 미만 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under6m" value="3개월 ~ 6개월"> <label
										class="form-check-label" for="under6m"> 3 ~ 6개월 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under1y" value="6개월 ~ 1년"> <label
										class="form-check-label" for="under1y"> 6개월 ~ 1년 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="under2y" value="1년 ~ 2년"> <label
										class="form-check-label" for="under2y"> 1 ~ 2년 </label>
								</div>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="roomperiod"
										id="over2y" value="2년 이상"> <label
										class="form-check-label" for="over2y"> 2년 이상 </label>
								</div>
							</div>
							<p class="d-none" id="period">${room.roomperiod }</p>
						</fieldset>
					</div>
				</div>
				<hr>
				<div class="mb-3">
					<label for="roomcontent" class="form-label">상세내용</label>
					<textarea class="form-control" id="roomcontent" name="roomcontent"
						rows="15" placeholder="상세내용을 적어주세요">${room.roomcontent }</textarea>
				</div>

				<hr>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button class="btn btn-primary" type="submit">수정</button>
				</div>
			</form>
		</div>
	</main>
 -->
	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>