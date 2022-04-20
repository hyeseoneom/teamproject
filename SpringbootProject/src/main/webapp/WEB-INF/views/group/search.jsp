<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>공동구매</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords"
	content="RoomShare, Post 6 Headline, Post 6 Headline">
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/grlist.css" media="screen">
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
<meta property="og:title" content="grlist">
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
	<br>
	<h4 style="text-align: center;">${ search}검색 결과입니다</h4>
	<section class="u-align-center u-clearfix u-section-2" id="sec-06b0">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<a href="/groupbuying/write"
				style="margin-bottom: -3%; margin-top: 5%;"
				class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-1 u-btn-round u-radius-50">글쓰기</a>
			<a href="/groupbuying/myorder"
				class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-2 u-btn-round u-radius-50">내공동구매/주문</a>

			<div id="search" style="text-align:right;">
				<form id="searchform" action="/groupbuying/list/search" method="get">
					<select id="searchoption" name="searchn">
						<option value="0">제목</option>
						<option value="1">내용</option>
						<option value="2">아이디</option>
						<option value="3">제품</option>
					</select> <input id="search" name="search" type="text" placeholder="검색하세요"
						class="text_input" /> <input name="submit" type="submit"
						value="검색" />
				</form>
			</div>


			<c:if test="${count != 0 }">
				<c:forEach items="${gList}" var="gbs">
					<div class="u-expanded-width u-list u-list-1">
						<div class="u-repeater u-repeater-1">
							<div
								class="u-border-1 u-border-grey-60 u-container-style u-list-item u-repeater-item u-radius-20 u-shape-round"
								data-href="/groupbuying/list/${gbs[0].grno }">
								<div
									class="u-container-layout u-similar-container u-container-layout-1">

									<c:if test="${gbs[1].gimgsize == 0 }">
										<img src="/upload/noimages.png"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 339px; height: 192px; margin: 5px">
									</c:if>
									<c:if test="${gbs[1].gimgsize != 0 }">
										<img src="/upload/${gbs[1].gimgpath }"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 339px; height: 200px; margin: 10px">
									</c:if>
									<h4 class="u-text u-text-1">${gbs[0].grtitle}</h4>
									<p class="u-text u-text-grey-50 u-text-2">${gbs[0].memberid }
										|
										<fmt:formatDate value="${gbs[0].grregdate}"
											pattern="yyyy-MM-dd" />
									</p>
									<p class="u-text u-text-3">${gbs[0].grproduct }</p>
									<p class="u-text u-text-4">
										<fmt:formatDate value="${gbs[0].grdate}" pattern="yyyy-MM-dd" />
										까지 주문가능
									</p>
									<c:if test="${ gbs[0].grstate == 1}">
										<p class="u-text u-text-5" style="color: red;">주문불가</p>
									</c:if>
									<c:if test="${ gbs[0].grstate == 0}">
										<p class="u-text u-text-5" style="color: green;">주문가능</p>
									</c:if>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${count == 0 }">
				<p style="text-align: center;">아직 입력한 글이 없습니다.</p>
			</c:if>
		</div>
	</section>
	<section
		class="u-clearfix u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xs u-section-3"
		id="sec-8ca7">
		<c:if test="${count != 0 }">
			<div class="u-list u-list-1">
				<div class="u-repeater u-repeater-1">
					<c:if test="${begin>pageNum}">
						<div class="u-container-style u-list-item u-repeater-item">
							<div
								class="u-container-layout u-similar-container u-valign-middle u-container-layout-1">
								<a href="/groupbuying/list/search?p=${begin-1}"
									class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-1">&lt;</a>
							</div>
						</div>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<div class="u-container-style u-list-item u-repeater-item"
							style="text-align: center;">
							<div
								class="u-container-layout u-similar-container u-valign-middle u-container-layout-2">
								<a href="/groupbuying/list/search?p=${i}"
									class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-2">${i}</a>
							</div>
						</div>
					</c:forEach>

					<c:if test="${end<totalPages}">
						<div class="u-container-style u-list-item u-repeater-item">
							<div
								class="u-container-layout u-similar-container u-valign-middle u-container-layout-3">
								<a href="/groupbuying/list/search?p=${end+1}"
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
				<a href="/groupbuying/list" style="color: white; text-decoration: none;"><h1
						class="display-4 fst-italic">Group Buying</h1></a>
			</div>
		</div>

		<div class="container">
			<h1>공동구매</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/groupbuying/write">
					<button class="btn btn-outline-dark btn-sm" type="button">글쓰기</button>
				</a>
			</div>
			<hr>

			<c:if test="${count != 0 }">
			<p>${count}개가 검색되었습니다</p>
				<c:forEach items="${gList}" var="gbs">
					<a href="/groupbuying/list/${gbs[0].grno }"
						style="color: black; text-decoration: none;">
						<div class="card mb-3" style="max-width: 100%; height: 200px;">
							<div class="row g-0">
								<div class="col-md-3">
									<c:if test="${gbs[1].gimgsize == 0 }">
										<img src="/upload/noimages.png"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 100%; height: 190px; margin: 5px">
									</c:if>
									<c:if test="${gbs[1].gimgsize != 0 }">
										<img src="/upload/${gbs[1].gimgpath }"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 100%; height: 190px; margin: 5px">
									</c:if>
								</div>
								<div class="col-md-9">
									<div class="card-body">
										<h5 class="card-title">${gbs[0].grtitle}</h5>
										<p class="card-text">${gbs[0].memberid }</p>
										<h5 class="card-text text-primary"><fmt:formatDate
													value="${gbs[0].grdate}" pattern="yyyy-MM-dd" />까지 구매가능</h5>
										<c:if test="${ gbs[0].grstate == 1}">
											<p class="card-text text-danger">구매종료</p>
										</c:if>
										<c:if test="${ gbs[0].grstate == 0}">
											<p class="card-text text-success">구매가능</p>
										</c:if>
										<p class="card-text">
											<small class="text-muted"><fmt:formatDate
													value="${gbs[0].grregdate}" pattern="yyyy-MM-dd" /></small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</a>
					<hr>
				</c:forEach>

				<div></div>
				<div class="btn-toolbar d-md-flex justify-content-end" id="page">

					<c:if test="${begin>pageNum}">
						<a href="list?p=${begin-1}" class="btn btn-outline-secondary">이전</a>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<a href="list?p=${i}" class="btn btn-outline-secondary">${i}</a>
					</c:forEach>
					<c:if test="${end<totalPages}">
						<a href="list?p=${end+1}" class="btn btn-outline-secondary">다음</a>
					</c:if>

				</div>
			</c:if>
			<c:if test="${count == 0 }">
				<p style="text-align: center;">아직 입력한 글이 없습니다.</p>
			</c:if>

			<div class="d-flex justify-content-center">
				<form action="/groupbuying/list/search" method="get">
					<div class="input-group mb-3">
						<select class="form-select form-select-sm" name="searchn" id="inputGroupSelect01" style="width:90px;">
							<option value="0" selected>제목</option>
							<option value="1">내용</option>
							<option value="2">아이디</option>
							<option value="3">제품</option>
						</select> <input type="text" class="form-control"
							aria-label="Recipient's username"
							aria-describedby="button-addon2" name="search" style="width:200px;">
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