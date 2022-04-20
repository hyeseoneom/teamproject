<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>룸쉐어</title>
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
<link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/roomlist.css" media="screen">
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
<meta property="og:title" content="list">
<meta property="og:type" content="website">
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />


	<section class="u-clearfix u-image u-shading u-section-1"
		id="carousel_ebd5">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-clearfix u-layout-wrap u-layout-wrap-1">
				<div class="u-layout">
					<div class="u-layout-row">
						<div
							class="u-container-style u-layout-cell u-right-cell u-size-60 u-layout-cell-1"
							data-href="/room/list">
							<div class="u-container-layout u-container-layout-1">
								<h1 class="u-text u-title u-text-1">
									<span style="font-weight: 700;">룸쉐어</span> <span
										style="font-weight: 700;"></span>
								</h1>
								<h3 class="u-text u-text-default u-text-2">
									<span style="font-size: 1.25rem; font-weight:bold">당신의 집을 여러 사람과 함께 쉐어하세요</span>&nbsp;<span
										style="font-size: 1.25rem;"></span>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<div class="container">
	<section class="u-align-center u-clearfix u-section-2" id="sec-06b0">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<a href="/room/write"
				style="margin-bottom: -3%; margin-top: 5%;"
				class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-round u-btn-1 u-btn-round u-radius-50">글쓰기</a>

			<div id="search" style="text-align:right;">
				<form id="searchform" action="/room/list/search" method="get">
					<select id="searchoption" name="searchn" >
						<option value="0">제목</option>
						<option value="1">내용</option>
						<option value="2">아이디</option>
						<option value="3">주소</option>
					</select> <input id="search" name="search" type="text" placeholder="검색하세요"
						class="text_input" /> <input name="submit" type="submit"
						value="검색" />
				</form>
			</div>
<hr>

			<c:if test="${count != 0 }">
				<c:forEach items="${rList}" var="rooms">
					<div class="u-expanded-width u-list u-list-1">
						<div class="u-repeater u-repeater-1">
							<div
								class="u-border-1 u-border-grey-60 u-container-style u-list-item u-repeater-item u-radius-20 u-shape-round"
								data-href="/room/list/${rooms[0].roomno }">
								<div
									class="u-container-layout u-similar-container u-container-layout-1">

									<c:if test="${rooms[1].rimgsize == 0 }">
										<img src="/upload/noimages.png"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 339px; height: 192px; margin: 5px">
									</c:if>
									<c:if test="${rooms[1].rimgsize != 0 }">
										<img src="/upload/${rooms[1].rimgpath }"
											class="img-fluid rounded-start"
											onerror="this.src='/upload/noimages.png'"
											style="width: 339px; height: 200px; margin: 10px">
									</c:if>
									<h4 class="u-text u-text-1">${rooms[0].roomtitle}</h4>
									<p class="u-text u-text-grey-50 u-text-2">${rooms[0].memberid }
										|
										<fmt:formatDate value="${rooms[0].roomregdate}"
											pattern="yyyy-MM-dd" />
									</p>
									<p class="u-text u-text-3">${rooms[0].roomaddress }</p>
									<p class="u-text u-text-4">
										<fmt:formatDate value="${rooms[0].roomdate}"
											pattern="yyyy-MM-dd" />
										입주가능
									</p>
									<c:if test="${ rooms[0].roomstate == 1}">
										<p class="u-text u-text-5" style="color: red;">룸쉐어 불가</p>
									</c:if>
									<c:if test="${ rooms[0].roomstate == 0}">
										<p class="u-text u-text-5" style="color: green;">룸쉐어 가능</p>
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
							<a href="/room/list?p=${begin-1}"
								class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-1 u-btn-round u-radius-50">&lt;</a>
						</div>
					</div>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var="i">
				<div class="u-container-style u-list-item u-repeater-item" style="text-align:center;">
					<div
						class="u-container-layout u-similar-container u-valign-middle u-container-layout-2">
						<a href="/room/list?p=${i}"
							class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-2 u-btn-round u-radius-50">${i}</a>
					</div>
				</div>
				</c:forEach>
				
				<c:if test="${end<totalPages}">
				<div class="u-container-style u-list-item u-repeater-item">
					<div
						class="u-container-layout u-similar-container u-valign-middle u-container-layout-3">
						<a href="/room/list?p=${end+1}"
							class="u-active-none u-border-none u-btn u-button-style u-hover-none u-none u-text-palette-1-base u-btn-3 u-btn-round u-radius-50"> &gt;</a>
					</div>
				</div>
				</c:if>
			</div>
		</div>
		</c:if>
	</section>
</div>



	<c:import url="/WEB-INF/views/include/bottom.jsp" />

</body>
</html>