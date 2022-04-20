<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>공동구매 리스트</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords"
	content="RoomShare, Post 6 Headline, Post 6 Headline">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>order</title>
<link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/order.css" media="screen">
<script class="u-script" type="text/javascript" src="/js/jquery.js"
	defer=""></script>
<script class="u-script" type="text/javascript" src="/js/nicepage.js"
	defer=""></script>
<meta name="generator" content="Nicepage 4.6.5, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">





<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/default-logo.png"
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="order">
<meta property="og:type" content="website">
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />


	<section class="u-align-center u-clearfix u-valign-middle u-section-1"
		id="carousel_ae3f">
		<img src="/images/pexels-photo-6647119.jpeg" alt=""
			class="u-expanded-width u-image u-image-default u-image-1"
			data-image-width="1125" data-image-height="750"
			data-href="/groupbuying/list">
		<div class="u-clearfix u-layout-wrap u-layout-wrap-1">
			<div class="u-layout">
				<div class="u-layout-row">
					<div
						class="u-container-style u-layout-cell u-right-cell u-size-60 u-layout-cell-1"
						data-href="#">
						<div class="u-container-layout u-container-layout-1">
							<h1 class="u-text u-text-body-alt-color u-title u-text-1">
								<span style="font-weight: 700;">공동구매 </span>
							</h1>
							<h3 class="u-text u-text-body-alt-color u-text-default u-text-2">
								<span style="font-size: 1.25rem;">다양한 물건들을 여러 사람들과 함께
									구매하세요</span>&nbsp;<span style="font-size: 1.25rem;"></span>
							</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="u-align-center u-clearfix u-section-2" id="sec-06b0">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<a href="/groupbuying/list"
				style="margin-bottom: -3%; margin-top: 5%;"
				class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-1 u-btn-round u-radius-50">목록</a>

			<a href="/groupbuying/myorder"
				class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-2 u-btn-round u-radius-50">내공동구매</a>

			<div id="search" style="text-align:right;">
				<form id="searchform" action="/groupbuying/orders/search/${grno}"
					method="get">
					<select id="searchoption" name="searchn">
						<option value="0">구매자</option>
						<option value="1">주소</option>
						<option value="2">구매날짜</option>
					</select> <input id="search" name="search" type="text" placeholder="검색하세요"
						class="text_input" /> <input name="submit" type="submit"
						value="검색" />
				</form>
			</div>


		</div>
	</section>




	<section class="u-align-center u-clearfix u-section-3" id="sec-b9e6">
		<div class="u-clearfix u-sheet u-sheet-1">
			<h3 class="u-text u-text-default u-text-1">${grno }번글의 주문</h3>
			<div class="u-expanded-width u-table u-table-responsive u-table-1">
				<c:if test="${count != 0 }">
					<table class="u-table-entity u-table-entity-1">
						<colgroup>
							<col width="10%">
							<col width="13%">
							<col width="13%">
							<col width="25%">
							<col width="18%">
							<col width="13%">
						</colgroup>
						<thead class="u-black u-table-header u-table-header-1">
							<tr style="height: 21px;">
								<th class="u-border-1 u-border-black u-table-cell">번호</th>
								<th class="u-border-1 u-border-black u-table-cell">아이디</th>
								<th class="u-border-1 u-border-black u-table-cell">우편번호</th>
								<th class="u-border-1 u-border-black u-table-cell">주소</th>
								<th class="u-border-1 u-border-black u-table-cell">연락처</th>
								<th class="u-border-1 u-border-black u-table-cell">주문날짜</th>
							</tr>
						</thead>
						<tbody class="u-table-body">
							<c:forEach items="${orders}" var="order" varStatus="status">

								<tr style="height: 75px;">
									<td class="u-border-1 u-border-grey-30 u-table-cell">${order.orderno}</td>
									<td class="u-border-1 u-border-grey-30 u-table-cell">${order.memberid }</td>
									<td class="u-border-1 u-border-grey-30 u-table-cell">${order.postcode }</td>
									<td class="u-border-1 u-border-grey-30 u-table-cell">${order.address} ${order.extraddress }</td>
									<td class="u-border-1 u-border-grey-30 u-table-cell">${order.tel }</td>
									<td class="u-border-1 u-border-grey-30 u-table-cell"><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd" /></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</c:if>
				<c:if test="${count == 0 }">
					<p style="text-align: center;">주문글이 없습니다.</p>

				</c:if>

			</div>
		</div>
	</section>


	<section
		class="u-clearfix u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xs u-section-4"
		id="sec-8ca7">
		<c:if test="${count != 0 }">
			<div class="u-list u-list-1">
				<div class="u-repeater u-repeater-1">
					<c:if test="${begin>pageNum}">
						<div class="u-container-style u-list-item u-repeater-item">
							<div
								class="u-container-layout u-similar-container u-valign-middle u-container-layout-1">
								<a href="/groupbuying/myorder/${grno}?p=${begin-1}"
									class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-1">&lt;</a>
							</div>
						</div>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<div class="u-container-style u-list-item u-repeater-item"
							style="text-align: center;">
							<div
								class="u-container-layout u-similar-container u-valign-middle u-container-layout-2">
								<a href="/groupbuying/myorder/${grno}?p=${i}"
									class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-2">${i}</a>
							</div>
						</div>
					</c:forEach>

					<c:if test="${end<totalPages}">
						<div class="u-container-style u-list-item u-repeater-item">
							<div
								class="u-container-layout u-similar-container u-valign-middle u-container-layout-3">
								<a href="/groupbuying/myorder/${grno}?p=${end+1}"
									class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-3">
									&gt;</a>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</c:if>
	</section>



<!--  



	<main>
		<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
			<div class="col-md-6 px-0">
				<a href="/groupbuying/list"
					style="color: white; text-decoration: none;"><h1
						class="display-4 fst-italic">Group Buying</h1></a>
			</div>
		</div>

		<div class="container">
			<h1>공동구매</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/groupbuying/list">
					<button class="btn btn-outline-dark btn-sm" type="button">목록</button>
				</a>
			</div>
			<hr>
			<h4>${dto.grproduct }</h4>
			<p>\ ${dto.grprice }</p>
			<c:if test="${count != 0 }">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">아이디</th>
							<th scope="col">우편번호</th>
							<th scope="col">주소</th>
							<th scope="col">상세주소</th>
							<th scope="col">연락처</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order" varStatus="status">
							<tr>
								<th scope="row">${status.count}</th>
								<td>${order.memberid }</td>
								<td>${order.postcode }</td>
								<td>${order.address}</td>
								<td>${order.extraddress }</td>
								<td>${order.tel }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="btn-toolbar d-md-flex justify-content-end" id="page">

					<c:if test="${begin>pageNum}">
						<a href="${grno }?p=${begin-1}" class="btn btn-outline-secondary">이전</a>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<a href="${grno }?p=${i}" class="btn btn-outline-secondary">${i}</a>
					</c:forEach>
					<c:if test="${end<totalPages}">
						<a href="${grno }?p=${end+1}" class="btn btn-outline-secondary">다음</a>
					</c:if>

				</div>
			</c:if>
			<c:if test="${count == 0 }">
				<p style="text-align: center;">주문글이 없습니다.</p>

			</c:if>
			<div class="d-flex justify-content-center">
				<form action="/groupbuying/orders/search/${grno}" method="get">
					<div class="input-group mb-3">
						<select class="form-select form-select-sm" name="searchn"
							id="inputGroupSelect01" style="width: 90px;">
							<option value="0" selected>구매자</option>
							<option value="1">주소</option>
							<option value="2">구매날짜</option>
						</select> <input type="text" class="form-control"
							aria-label="Recipient's username"
							aria-describedby="button-addon2" name="search"
							style="width: 200px;">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">검색</button>
					</div>
				</form>
			</div>
		</div>
	</main>

-->
	<c:import url="/WEB-INF/views/include/bottom.jsp" />

</body>
</html>