<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>공동구매</title>
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

<script type="text/javascript" src="/js/write2.js"></script>

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
			<form method="post" id="writeform" action="/groupbuying/write" enctype="multipart/form-data">
				<h3 style="margin-left: 18%; margin-top: 1%;">
					<b>공동구매 등록</b>
				</h3>
				<table border="1">
				<colgroup>
					<col style="width:20%">
					<col style="width:80%">
					
					</colgroup>
					<tr>
						<td class="orange" >제목<span style="color: red">*</span></td>
						<td><input name="grtitle" class="grtitle"  placeholder="제목을 적어주세요"style="width:100%;" />
						<p class="text-danger" id="title_chk" ></p></td>
					</tr>
					<tr>
						<td class="orange">작성자<span style="color: red">*</span></td>
						<td><input name="memberid" class="noborder"
							value="${user.memberid}" readonly></td>
					</tr>
					<tr>
						<td class="orange">구매물품<span style="color: red">*</span></td>
						<td><input name="grproduct" class="grproduct"  placeholder="제품의 정확한 이름을 적어주세요" style="width:100%;"/></td>
					</tr>
					<tr>
						<td class="orange">구매가격<span style="color: red">*</span></td>
						<td><input name="grprice" class="grprice"  placeholder="제품 하나당 가격을 적어주세요" style="width:100%;"/>
						<p class="text-danger" id="product_chk"></p>
						</td>
					</tr>
					
					<tr>
						<td class="orange">연락처<span style="color: red">*</span></td>
						<td><input name="grphone"
							placeholder="연락처 또는 카카오톡ID를 기재해주세요." class="pp" style="width:100%;">
						<p class="text-danger" id="phone_chk"></p></td>
					</tr>
					<tr>
						<td class="orange">주문기한날짜<span style="color: red">*</span></td>
						<td><input type="date"  id="grdate"
							name="grdate"><p class="text-danger" id="date_chk"></p></td>
					</tr>
					<tr>
						<td class="orange">계좌번호<span style="color: red; ">*</span></td>
						<td><select  id="banknum"
						aria-label="Example select with button addon" name="banknum">
						<option value="" id="non_sel" selected>은행명을 선택하세요</option>
                        <option value="35" id="_35">경남은행</option>
                        <option value="29" id="_29">광주은행</option>
                        <option value="7" id="_7">국민은행</option>
                        <option value="5" id="_5">기업은행</option>
                        <option value="15" id="_15">농협중앙회</option>
                        <option value="17" id="_17">농협회원조합</option>
                        <option value="25" id="_25">대구은행</option>
                        <option value="47" id="_47">도이치은행</option>
                        <option value="27" id="_27">부산은행</option>
                        <option value="3" id="_3">산업은행</option>
                        <option value="41" id="_41">상호저축은행</option>
                        <option value="37" id="_37">새마을금고</option>
                        <option value="11" id="_11">수협중앙회</option>
                        <option value="36" id="_36">신한금융투자</option>
                        <option value="60" id="_60">신한은행</option>
                        <option value="39" id="_39">신협중앙회</option>
                        <option value="9" id="_9">외환은행</option>
                        <option value="19" id="_19">우리은행</option>
                        <option value="56" id="_56">우체국</option>
                        <option value="33" id="_33">전북은행</option>
                        <option value="31" id="_31">제주은행</option>
                        <option value="68" id="_68">카카오뱅크</option>
                        <option value="67" id="_67">케이뱅크</option>
                        <option value="59" id="_59">하나은행</option>
                        <option value="23" id="_23">한국씨티은행</option>
                        <option value="45" id="_45">HSBC은행</option>
                        <option value="21" id="_21">SC제일은행</option>
					</select>
					<input type="text"   id="accountnum" placeholder="계좌번호 (해당 정보는 등록한 글에선 보이지 않습니다)" name="accountnum" style="width:75%;">
					<p class="text-danger" id="account_chk"></p>
					</td>
					</tr>
					<tr>
						<td class="orange">사진</td>
						<td><input type="file"  id="grpic" name="grpic"
						aria-describedby="inputGroupFileAddon04" aria-label="Upload"
						multiple="multiple" accept="image/*">
						<div id="preview"></div>
				<script type="text/javascript" src="/js/uploadimg.js"></script>
						</td>
					</tr>
					<tr>
						<td class="orange">상세내용<span style="color: red">*</span></td>
						<td><textarea name="grcontent" cols="40" rows="10"
								placeholder="400자 이내" class="pp" style="width:100%;"></textarea></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="새글 등록" id="btn"> <input type="reset" value="초기화"
							id="btn"></td>
					</tr>
				</table>

			</form>

		</div>
	</section>

<!--  
	<main>
		<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
			<div class="col-md-6 px-0">
				<a href="/groupbuying/list"
					style="color: white; text-decoration: none;"><h1
						class="display-4 fst-italic">GroupBuying</h1></a>
			</div>
		</div>

		<div class="container">
			<h1>공동구매 등록</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/groupbuying/list">
					<button class="btn btn-outline-dark btn-sm" type="button">목록</button>
				</a>
			</div>
			<hr>
			<form action="/groupbuying/write" method="post"
				enctype="multipart/form-data" id="writeform">
				<div class="row">
					<div class="col-sm-9">
						<div class="mb-3">
							<label for="grtitle" class="form-label">제목</label> <input
								class="form-control" id="grtitle" name="grtitle"
								placeholder="제목">
						</div>
						<p class="text-danger" id="title_chk"></p>
					</div>
					<div class="col-sm-3">
						<div class="mb-3">
							<label for="roomtitle" class="form-label">아이디</label> <input
								class="form-control" id="memberid" name="memberid"
								value="${user.memberid }" readonly>
						</div>
					</div>
				</div>
				<hr>
				<div class="input-group">
					<input type="file" class="form-control" id="grpic" name="grpic"
						aria-describedby="inputGroupFileAddon04" aria-label="Upload"
						multiple="multiple" accept="image/*">
				</div>
				<div id="preview"></div>
				<script type="text/javascript" src="/js/uploadimg.js"></script>
				<hr>

				<div class="mb-3">
					<label for="grphone" class="form-label">연락처</label> <input
						class="form-control" id="grphone" name="grphone"
						placeholder="ex)000-0000-0000 또는 카카오톡 아이디">
				</div>
				<p class="text-danger" id="phone_chk"></p>
				<hr>
				<div class="mb-3">
					<label for="grdate" class="form-label">공동구매 기한</label> <input
						type="date" class="form-control" id="grdate" name="grdate">
				</div>
				<p class="text-danger" id="date_chk"></p>
				<hr>
				<div class="row">
					<div class="col-sm-6">
						<label for="grproduct" class="form-label">제품</label> <input
							type="text" class="form-control" id="grproduct" name="grproduct">
					</div>
					<div class="col-sm-6">
						<label for="grprice" class="form-label">가격</label> <input
							class="form-control" id="grprice" name="grprice">
					</div>
					

				</div>
				<p class="text-danger" id="product_chk"></p>
				<hr>
				<p>계좌번호</p>
				<div class="input-group mb-3">
					<select class="form-control" id="banknum"
						aria-label="Example select with button addon" name="banknum">
						<option value="" id="non_sel" selected>은행명을 선택하세요</option>
                        <option value="35" id="_35">경남은행</option>
                        <option value="29" id="_29">광주은행</option>
                        <option value="7" id="_7">국민은행</option>
                        <option value="5" id="_5">기업은행</option>
                        <option value="15" id="_15">농협중앙회</option>
                        <option value="17" id="_17">농협회원조합</option>
                        <option value="25" id="_25">대구은행</option>
                        <option value="47" id="_47">도이치은행</option>
                        <option value="27" id="_27">부산은행</option>
                        <option value="3" id="_3">산업은행</option>
                        <option value="41" id="_41">상호저축은행</option>
                        <option value="37" id="_37">새마을금고</option>
                        <option value="11" id="_11">수협중앙회</option>
                        <option value="36" id="_36">신한금융투자</option>
                        <option value="60" id="_60">신한은행</option>
                        <option value="39" id="_39">신협중앙회</option>
                        <option value="9" id="_9">외환은행</option>
                        <option value="19" id="_19">우리은행</option>
                        <option value="56" id="_56">우체국</option>
                        <option value="33" id="_33">전북은행</option>
                        <option value="31" id="_31">제주은행</option>
                        <option value="68" id="_68">카카오뱅크</option>
                        <option value="67" id="_67">케이뱅크</option>
                        <option value="59" id="_59">하나은행</option>
                        <option value="23" id="_23">한국씨티은행</option>
                        <option value="45" id="_45">HSBC은행</option>
                        <option value="21" id="_21">SC제일은행</option>
					</select>
					<input type="text" class="form-control" style="width:800px" id="accountnum" placeholder="계좌번호 (해당 정보는 등록한 글에선 보이지 않습니다)" name="accountnum">
				</div>
				<p class="text-danger" id="account_chk"></p>
				<hr>
				<div class="mb-3">
					<label for="grcontent" class="form-label">상세내용</label>
					<textarea class="form-control" id="grcontent" name="grcontent"
						rows="15" placeholder="상세내용을 적어주세요"></textarea>
				</div>

				<hr>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button class="btn btn-primary me-md-2" type="reset">다시쓰기</button>
					<button class="btn btn-primary" type="submit">등록</button>
				</div>
			</form>
		</div>
	</main>
-->
	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>