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
<script type="text/javascript" src="/js/detail.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="RoomShare">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/roomdetail.css" media="screen">
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
		"name": ""
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="roomdetail">
<meta property="og:type" content="website">
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />
	<!-- 메인 -->



	<section class="u-align-center u-clearfix u-section-1" id="sec-acad">
<br>
<br>
<br>
<br>
				
				
				<div id="carouselControls" class="carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach items="${images}" var="image" varStatus="status">
						<c:if test="${image.rimgsize == 0 }">
							<div class="carousel-item active">
								<img src="/upload/noimages.png" class="rounded d-block w-100"
									style="height: 400px; object-fit: contain;">
							</div>
						</c:if>
						<c:if test="${image.rimgsize != 0 }">
							<c:if test="${status.index == 0 }">
								<div class="carousel-item active">
									<img src="/upload/${image.rimgpath }"
										onerror="this.src='/upload/noimages.png'"
										class="rounded d-block w-100"
										style="height: 400px; object-fit: contain;">
								</div>
							</c:if>
							<c:if test="${status.index != 0 }">
								<div class="carousel-item">
									<img src="/upload/${image.rimgpath }"
										onerror="this.src='/upload/noimages.png'"
										class="rounded d-block w-100"
										style="height: 400px; object-fit: contain;">
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			
			
			<!--  
			<div
				class="u-carousel u-expanded-width-xs u-gallery u-layout-thumbnails u-lightbox u-no-transition u-show-text-always u-gallery-1"
				id="carousel-e131" data-interval="5000" data-u-ride="carousel">
				<div class="u-carousel-inner u-gallery-inner" role="listbox">
					<c:forEach items="${images}" var="image" varStatus="status">
						<c:if test="${image.rimgsize == 0 }">
							<div
								class="u-active u-carousel-item u-gallery-item u-carousel-item-1">
								<div class="u-back-slide">
									<img class="u-back-image u-expanded" src="/upload/noimages.png">
								</div>
								<div class="u-over-slide u-over-slide-1">
									<h3 class="u-gallery-heading">Sample Title</h3>
									<p class="u-gallery-text">Sample Text</p>
								</div>
							</div>
						</c:if>
						<c:if test="${image.rimgsize != 0 }">
							<c:if test="${status.index == 0 }">
								<div
									class="u-active u-carousel-item u-gallery-item u-carousel-item-1">
									<div class="u-back-slide">
										<img class="u-back-image u-expanded"
											src="/upload/${image.rimgpath }"
											onerror="this.src='/upload/noimages.png'">
									</div>
									<div class="u-over-slide u-over-slide-1">
										<h3 class="u-gallery-heading">Sample Title</h3>
										<p class="u-gallery-text">Sample Text</p>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index != 0 }">
								<div
									class="u-active u-carousel-item u-gallery-item u-carousel-item-1">
									<div class="u-back-slide">
										<img class="u-back-image u-expanded"
											src="/upload/${image.rimgpath }"
											onerror="this.src='/upload/noimages.png'">
									</div>
									<div class="u-over-slide u-over-slide-1">
										<h3 class="u-gallery-heading">Sample Title</h3>
										<p class="u-gallery-text">Sample Text</p>
									</div>
								</div>
							</c:if>
						</c:if>

					</c:forEach>


				</div>
				<a
					class="u-absolute-vcenter u-carousel-control u-carousel-control-prev u-icon-circle u-opacity u-opacity-70 u-palette-1-base u-spacing-10 u-text-white u-carousel-control-1"
					href="#carousel-e131" role="button" data-u-slide="prev"> <span
					aria-hidden="true"> <svg viewBox="0 0 451.847 451.847">
							<path
								d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
				</span> <span class="sr-only"> <svg viewBox="0 0 451.847 451.847">
							<path
								d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
				</span>
				</a> <a
					class="u-absolute-vcenter u-carousel-control u-carousel-control-next u-grey-70 u-icon-circle u-opacity u-opacity-70 u-spacing-10 u-text-white u-carousel-control-2"
					href="#carousel-e131" role="button" data-u-slide="next"> <span
					aria-hidden="true"> <svg viewBox="0 0 451.846 451.847">
							<path
								d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
				</span> <span class="sr-only"> <svg viewBox="0 0 451.846 451.847">
							<path
								d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
				</span>
				</a>


				<ol
					class="u-carousel-thumbnails u-spacing-10 u-carousel-thumbnails-1">
					<c:forEach items="${images}" var="image" varStatus="status">
						<c:if test="${image.rimgsize == 0 }">

							<li class="u-active u-carousel-thumbnail u-carousel-thumbnail-1"
								data-u-target="#carousel-e131" data-u-slide-to="${status.index}"><img
								class="u-carousel-thumbnail-image u-image"
								src="/upload/noimages.png"></li>

						</c:if>
						<c:if test="${image.rimgsize != 0 }">
							<c:if test="${status.index == 0 }">
								<li class="u-active u-carousel-thumbnail u-carousel-thumbnail-1"
									data-u-target="#carousel-e131" data-u-slide-to="${status.index}"><img
									class="u-carousel-thumbnail-image u-image"
									src="/upload/${image.rimgpath }"
									onerror="this.src='/upload/noimages.png'"></li>
							</c:if>
							<c:if test="${status.index != 0 }">
								<li class="u-active u-carousel-thumbnail u-carousel-thumbnail-1"
									data-u-target="#carousel-e131" data-u-slide-to="${status.index}"><img
									class="u-carousel-thumbnail-image u-image"
									src="/upload/${image.rimgpath }"
									onerror="this.src='/upload/noimages.png'"></li>
							</c:if>
						</c:if>
					</c:forEach>


				</ol>
				
				-->
	
	</section>



	<section class="u-clearfix u-section-2" id="sec-6868">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<div class="u-list u-list-1">
				<div style="text-align:right;">
					<c:if test="${room.memberid == user.memberid || master.masterid != null}">

						<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
							<div
								class="u-container-layout u-similar-container u-valign-top u-container-layout-1">
								<a href="/room/delete/${room.roomno}"
									class="u-border-2 u-border-palette-2-base u-btn u-button-style u-custom-item u-hover-palette-2-base u-none u-text-black u-text-hover-white u-btn-1 u-btn-round u-radius-50"
									data-animation-name="" data-animation-duration="0"
									data-animation-delay="0" data-animation-direction="">삭제</a>
							</div>
						</div>

						<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
							<div
								class="u-container-layout u-similar-container u-valign-top u-container-layout-2">
								<a href="/room/update/${room.roomno}"
									class="u-border-2 u-border-palette-1-base u-btn u-button-style u-custom-item u-hover-palette-1-base u-none u-text-black u-text-hover-white u-btn-2 u-btn-round u-radius-50"
									data-animation-name="" data-animation-duration="0"
									data-animation-delay="0" data-animation-direction="">수정</a>
							</div>
						</div>
						<c:if test="${room.roomstate == 0 }">
						<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
							<div
								class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
								<a href="/room/quit/${room.roomno}"
									class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-3 u-btn-round u-radius-50"
									data-animation-name="" data-animation-duration="0"
									data-animation-delay="0" data-animation-direction="">모집종료</a>
							</div>
						</div>
						</c:if>
						<c:if test="${room.roomstate == 1 }">
						<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
							<div
								class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
								<a 
									class="u-border-2 u-border-grey u-btn u-button-style u-custom-item u-hover-grey u-none u-text-grey u-text-hover-white u-btn-3 u-btn-round u-radius-50"
									data-animation-name="" data-animation-duration="0"
									data-animation-delay="0" data-animation-direction="">모집종료</a>
							</div>
						</div>
						</c:if>
					</c:if>

					<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
						<div
							class="u-container-layout u-similar-container u-valign-top u-container-layout-4">
							<a href="/room/list"
								class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-4 u-btn-round u-radius-50"
								data-animation-name="" data-animation-duration="0"
								data-animation-delay="0" data-animation-direction="">목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="u-align-center u-clearfix u-section-3" id="sec-8a6b">
		<div
			class="u-clearfix u-sheet u-valign-middle-lg u-valign-middle-md u-valign-middle-sm u-valign-middle-xl u-sheet-1">
			<!--product-->
			<!--product_options_json-->
			<!--{"source":""}-->
			<!--/product_options_json-->
			<!--product_item-->
			<div class="u-container-style u-expanded-width u-product u-product-1">
				<div class="u-container-layout u-container-layout-1">
					<!--product_title-->
					<h2 class="u-product-control u-text u-text-1">
						${room.roomtitle}
						
					</h2>

					<!--/product_title-->
					<!--product_price-->
					<div class="u-product-control u-product-price u-product-price-1">
						<div class="u-price-wrapper u-spacing-10">
							<!--product_old_price-->
							<div class="u-hide-price u-old-price"
								style="text-decoration: line-through !important;">
								<!--product_old_price_content-->
								      
								<!--/product_old_price_content-->
							</div>
							<!--/product_old_price-->
							<!--product_regular_price-->
							<div class="u-price u-text-palette-2-base"
								style="font-size: 1.875rem; font-weight: 700;">
								<!--product_regular_price_content-->
								   <p></p>
								<!--/product_regular_price_content-->
							</div>
							<!--/product_regular_price-->
						</div>
					</div>
					<!--/product_price-->
					<p class="u-text u-text-grey-40 u-text-2"><fmt:formatDate
								value="${room.roomregdate}" pattern="yyyy-MM-dd" /></p>
					<p class="u-text u-text-3">${room.memberid}</p>
					
					<div class="u-container-style u-group u-group-1">
						<div class="u-container-layout">
						<hr>
							<h5 class="u-text u-text-4">
								${room.roomphone }
							</h5>
							<br>
							<h5 class="u-text u-text-5">
								<fmt:formatDate value="${room.roomdate}" pattern="yyyy/MM/dd" /> 입주가능
							</h5>
							<br>
							<h5 class="u-text u-text-6">
								${room.roomperiod}
							</h5>
							<br>
							<h5 class="u-text u-text-7">${room.roomaddress}</h5>
						</div>
					</div>
					<br>
					<br>
					<center>
				<div id="map" style="width: 1000px; height: 400px;"
					class="${room.roomaddress}"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>
				<script type="text/javascript" src="/js/map2.js"></script>
			</center>
			<br>
			<div class="container" style="width: 1110px">
					<h4>상세내용</h4>
					<p class="u-text u-text-8" style="font-size:1.25em;"><pre>${room.roomcontent }</pre></p>
					</div>
				</div>
			</div>
			<!--/product_item-->
			<!--/product-->
		</div>
	</section>
<p class="d-none" id="userid">${user.memberid }</p>

<!--  

	<main>
		<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
			<div class="col-md-6 px-0">
				<a href="/room/list" style="color: white; text-decoration: none;"><h1
						class="display-4 fst-italic">Room Share</h1></a>
			</div>
		</div>

		<div class="container">
			<p class="d-none" id="userid">${user.memberid }</p>
			<h1>룸쉐어 구하기</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/room/list">
					<button class="btn btn-outline-dark btn-sm" type="button">목록</button>
				</a>
				<c:if test="${room.memberid == user.memberid }">

					<c:if test="${room.roomstate == 0 }">
						<a href="/room/quit/${room.roomno}">
							<button class="btn btn-outline-success btn-sm" type="button">룸쉐어종료</button>
						</a>
					</c:if>
					<c:if test="${room.roomstate == 1 }">
						<button class="btn btn-outline-dark btn-sm" type="button" disabled>룸쉐어종료</button>
					</c:if>

					<a href="/room/update/${room.roomno}">
						<button class="btn btn-outline-primary btn-sm" type="button">수정</button>
					</a>
					<a href="/room/delete/${room.roomno}">
						<button class="btn btn-outline-danger btn-sm" type="button">삭제</button>
					</a>

				</c:if>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-11">
					<div class="mb-3">
						<h5>${room.roomtitle}</h5>
						<span>${room.memberid}</span> <span><small> | </small></span> <span><fmt:formatDate
								value="${room.roomregdate}" pattern="yyyy-MM-dd" /></span>
					</div>
				</div>
				<div class="col-sm-1">
					<div class="mb-3">
						<br> <span>조회 : ${room.roomcno}</span>

					</div>
				</div>
			</div>
			<hr>

			<div id="carouselControls" class="carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach items="${images}" var="image" varStatus="status">
						<c:if test="${image.rimgsize == 0 }">
							<div class="carousel-item active">
								<img src="/upload/noimages.png" class="rounded d-block w-100"
									style="height: 400px; object-fit: contain;">
							</div>
						</c:if>
						<c:if test="${image.rimgsize != 0 }">
							<c:if test="${status.index == 0 }">
								<div class="carousel-item active">
									<img src="/upload/${image.rimgpath }"
										onerror="this.src='/upload/noimages.png'"
										class="rounded d-block w-100"
										style="height: 400px; object-fit: contain;">
								</div>
							</c:if>
							<c:if test="${status.index != 0 }">
								<div class="carousel-item">
									<img src="/upload/${image.rimgpath }"
										onerror="this.src='/upload/noimages.png'"
										class="rounded d-block w-100"
										style="height: 400px; object-fit: contain;">
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>

			<hr>
			<center>
				<div id="map" style="width: 1000px; height: 400px;"
					class="${room.roomaddress}"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>
				<script type="text/javascript" src="/js/map2.js"></script>
			</center>
			<hr>
			<div class="row">
				<div class="col-sm-6">
					<div class="mb-3">
						<p class="text-muted">입주가능날짜</p>
						<h5>
							<fmt:formatDate value="${room.roomdate}" pattern="yyyy/MM/dd" />
						</h5>
					</div>
					<hr>
					<div class="mb-3">
						<p class="text-muted">룸쉐어기간</p>
						<h5>${room.roomperiod}</h5>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="mb-3">
						<p class="text-muted">연락처</p>
						<h5>${room.roomphone }</h5>
					</div>
					<hr>
					<div class="mb-3">
						<p class="text-muted">주소</p>
						<h5>${room.roomaddress}</h5>
					</div>
				</div>
			</div>
			<hr>
			<div style="min-height: 500px;">
				<p class="text-muted">상세내용</p>
				<h5>
					<pre>${room.roomcontent }</pre>
				</h5>
			</div>
			<hr>

-->
			<!-- 댓글 -->
			
			
	<!-- 남긴 코멘트 나오는 창 -->
<section class="u-clearfix u-section-4" id="sec-d4f8">
					<c:forEach items="${comments}" var="comm">
						<div class="comments-section">
							<div class="comments">
								<div id="comments-container">
									<div class="comment">
										<div class="comment-user">
											<span class="user-details"><span class="username">${comm.memberid}
											</span><span>on </span><span>${comm.rsdate}</span></span>
										</div>
										<div class="${comm.rsno}" id="comment-text"
											style="margin-left: -3%;">
											<pre style="margin-bottom: -2%;">${comm.rscontent}</pre>
											<br>

											<!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
											<c:if
												test="${user.memberid == comm.memberid || master.masterid != null}">
												<input type="button" id="${comm.rsno}" class="dbtn"
													style="margin-top: -1%;" value="삭제">
												<input type="button" id="${comm.rsno}" class="ubtn"
													style="margin-top: -1%;" value="수정">
											</c:if>
											<p class="d-none" id="rn_${comm.rsno}">${comm.roomno}</p>

											<input type="button" id="${comm.rsno}" class="recomment"
												style="margin-top: -1%;" value="답글">
										</div>
									</div>
									<c:forEach items="${recomments}" var="recomm">
                                <c:if test="${recomm.rersno == comm.rsno }">
                                    <div class="comment">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-11" id="re_${recomm.rsno}" style="margin-left: 6%;">
              
                                            <div class="row" id="${recomm.rsno}">
                                               
                                                    <div class="comment-user">
                                            <span class="user-details"><span class="username"><span style="font-weight:bold; font-size:16px; color:black;">[re] </span>${recomm.memberid}
                                            </span><span>on </span><span>${recomm.rsdate}</span></span>

                                                </div>
                                                <div class="${recomm.rsno}" id="comment-text">
                                            <pre style="margin-bottom: -2%;">${recomm.rscontent}</pre>
                                            <br>

                                            <!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
                                            <c:if
                                                test="${user.memberid == recomm.memberid || master.masterid != null}">
                                                <input type="button" id="${recomm.rsno}" class="dbtn"
                                                    style="margin-top: -1%;" value="삭제">
                                                <input type="button" id="${recomm.rsno}" class="ubtn"
                                                    style="margin-top: -1%;" value="수정">
                                            </c:if>
                                        
                                        </div>
                                                </div>
                                                </div>
                                                </div>
                                                
                                </c:if>
                            </c:forEach>
								</div>
							</div>
						</div>
						<div class="row">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-11" id="re_${comm.rsno}"></div>
                            </div>
					</c:forEach>
					<div class="comment-content">
						<div class="text-right cross">
							<i class="fa fa-times mr-2"></i>
						</div>
						<form method="post" action="/room/list/${room.roomno}/rswrite">
						<input type="hidden" name="roomno" value="${room.roomno}">
						<input type="hidden" name="rersno" value="0">
						
						<div class="card-body text-center">
							<div class="comment-box text-center">
								<div class="comment-area" style="margin-left: 5%">
									<div class="mb-3" style="margin-left: 20%">
										<input type="text" class="form-control" id="memberid"
											name="memberid" style="width: 200px;"
											value="${user.memberid}" readonly>
									</div>
									<textarea class="form-control" id="grcontent"
										placeholder="댓글을 입력해주세요." rows="4" style="width: 765px;" name="rscontent"></textarea>
									<div class="container" style="width:765px">
									<div class="text-center mt-4">
										<button class="send px-5" id="add"
											style="margin-right:10%;">Submit<i class="fa fa-long-arrow-right ml-1"></i>
										</button>
									</div>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
					<p class="d-none" id="userid">${user.memberid }</p>
							<c:forEach items="${recomments}" var="recomm">
								<c:if test="${recomm.rersno == comm.rsno }">
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-11" id="re_${recomm.rsno}">
											<hr style="border-top: 1px dotted #bbb;">
											<div class="row" id="${recomm.rsno}">
												<div class="col-sm-2 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>${recomm.memberid}</p>
													</div>
												</div>
												<div class="col-sm-7">
													<p>
													<pre>${recomm.rscontent}</pre>
													</p>
												</div>
												<div class="col-sm-1 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>
															<fmt:formatDate value="${recomm.rsdate}"
																pattern="yyyy/MM/dd" />
														</p>
													</div>
												</div>
												<div class="col-sm-2 position-relative">
													<div style="height: auto;">
														<div class="btn-group">

															<c:if
																test="${recomm.memberid == user.memberid || master.masterid != null  }">
																<button type="button" id="${recomm.rsno}"
																	class="gsupdate btn btn-outline-primary ubtn"
																	style="width: 60px;">수정</button>
																<button type="button" id="${recomm.rsno}"
																	class="gsdelete btn btn-outline-danger dbtn"
																	style="width: 60px;">삭제</button>
															</c:if>
														</div>
													</div>
												</div>
								</c:if>
							</c:forEach>
							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-11" id="re_${comm.rsno}"></div>
							</div>
						</div>
			</div>



<br>	


	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>