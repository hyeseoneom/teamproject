<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>공동구매</title>
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
<script type="text/javascript" src="/js/detail2.js"></script>
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
<script type="text/javascript">
	$(function() {
		$("#purchase").click(function(){
			let status = $("#status").text();
			if(status==0){
				let grno = ${groups.grno};
				window.open('/groupbuying/order/' + grno, '주문하기','width=800, height=800, menubar=no, status=no, toolbar=no');
			}
		})
	})
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />


	<section class="u-align-center u-clearfix u-section-1" id="sec-acad">
		<br> <br> <br> <br>


		<div id="carouselControls" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<c:forEach items="${images}" var="image" varStatus="status">
					<c:if test="${image.gimgsize == 0 }">
						<div class="carousel-item active">
							<img src="/upload/noimages.png" class="rounded d-block w-100"
								style="height: 400px; object-fit: contain;">
						</div>
					</c:if>
					<c:if test="${image.gimgsize != 0 }">
						<c:if test="${status.index == 0 }">
							<div class="carousel-item active">
								<img src="/upload/${image.gimgpath }"
									onerror="this.src='/upload/noimages.png'"
									class="rounded d-block w-100"
									style="height: 400px; object-fit: contain;">
							</div>
						</c:if>
						<c:if test="${status.index != 0 }">
							<div class="carousel-item">
								<img src="/upload/${image.gimgpath }"
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
	</section>



	<section class="u-clearfix u-section-2" id="sec-6868">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<div class="u-list u-list-1" >
				<div style="text-align:right;">
						<c:if
							test="${groups.memberid == user.memberid || master.masterid != null }">

							<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
								<div
									class="u-container-layout u-similar-container u-valign-top u-container-layout-4">
									<a href="/groupbuying/delete/${groups.grno}"
										class="u-border-2 u-border-palette-2-base u-btn u-button-style u-custom-item u-hover-palette-2-base u-none u-text-black u-text-hover-white u-btn-1 u-btn-round u-radius-50"
										data-animation-name="" data-animation-duration="0"
										data-animation-delay="0" data-animation-direction="">삭제</a>

								</div>
							</div>

							<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
								<div
									class="u-container-layout u-similar-container u-valign-top u-container-layout-2">
									<a href="/groupbuying/update/${groups.grno}"
										class="u-border-2 u-border-palette-1-base u-btn u-button-style u-custom-item u-hover-palette-1-base u-none u-text-black u-text-hover-white u-btn-2 u-btn-round u-radius-50"
										data-animation-name="" data-animation-duration="0"
										data-animation-delay="0" data-animation-direction="">수정</a>
								</div>
							</div>
							<c:if test="${groups.grstate == 0 }">
								<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
									<div
										class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
										<a href="/groupbuying/quit/${groups.grno}"
											class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-3 u-btn-round u-radius-50"
											data-animation-name="" data-animation-duration="0"
											data-animation-delay="0" data-animation-direction="" >모집종료</a>
									</div>
								</div>
							</c:if>
							<c:if test="${groups.grstate == 1 }">
								<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
									<div
										class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
										<a
											class="u-border-2 u-border-grey u-btn u-button-style u-custom-item u-hover-grey u-none u-text-grey u-text-hover-white u-btn-3 u-btn-round u-radius-50"
											data-animation-name="" data-animation-duration="0"
											data-animation-delay="0" data-animation-direction="" >모집종료</a>
									</div>
								</div>
							</c:if>
						</c:if>
						<div class="u-container-style u-list-item u-repeater-item" style="display:inline-block;">
							<div
								class="u-container-layout u-similar-container u-valign-top u-container-layout-1">
								<a href="/groupbuying/list"
									class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-4 u-btn-round u-radius-50"
									data-animation-name="" data-animation-duration="0"
									data-animation-delay="0" data-animation-direction="" >목록</a>
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
						${groups.grtitle}</h2>

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
								<p>${groups.grprice}원</p>
								<!--/product_regular_price_content-->
							</div>
							<c:if test="${groups.grstate == 0 }">
								<div class="u-container-style u-list-item u-repeater-item">
									<div
										class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
										<a a=""
											class="u-border-2 u-border-black u-btn u-button-style u-custom-item u-hover-black u-none u-text-black u-text-hover-white u-btn-3 u-btn-round u-radius-50"
											data-animation-name="" data-animation-duration="0"
											data-animation-delay="0" data-animation-direction=""
											id="purchase">구매</a>
									</div>
								</div>
								<p class="d-none" id="status">${groups.grstate}</p>
							</c:if>
							<c:if test="${groups.grstate == 1 }">
								<div class="u-container-style u-list-item u-repeater-item">
									<div
										class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
										<a
											class="u-border-2 u-border-grey u-btn u-button-style u-custom-item u-hover-grey u-none u-text-grey u-text-hover-white u-btn-3 u-btn-round u-radius-50"
											data-animation-name="" data-animation-duration="0"
											data-animation-delay="0" data-animation-direction=""
											id="purchase">구매</a>
									</div>
								</div>
								<p class="d-none" id="status">${groups.grstate}</p>
							</c:if>

							<!--/product_regular_price-->
						</div>
					</div>
					<!--/product_price-->
					<p class="u-text u-text-grey-40 u-text-2">
						<fmt:formatDate value="${groups.grregdate}" pattern="yyyy-MM-dd" />
					</p>
					<p class="u-text u-text-3">${groups.memberid}</p>

					<div class="u-container-style u-group u-group-1">
						<div class="u-container-layout">
							<hr>
							<h5 class="u-text u-text-4" style="">${groups.grphone}</h5>
							<br>
							<h5 class="u-text u-text-5">
								<fmt:formatDate value="${groups.grdate}" pattern="yyyy/MM/dd" />
								까지 공동구매 모집
							</h5>
							<br>
							<h5 class="u-text u-text-6">${groups.grproduct}</h5>
							<br>
							<h5 class="u-text u-text-7">총 ${count} 개 주문완료</h5>
						</div>
					</div>
					<br> <br> <br>
					<div class="container" style="width: 1110px">
						<h4>상세내용</h4>
						<p class="u-text u-text-8" style="font-size: 1.25em;">
						<pre>${groups.grcontent}</pre>
						</p>
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
				<a href="/groupbuying/list"
					style="color: white; text-decoration: none;"><h1
						class="display-4 fst-italic">GroupBuying</h1></a>
			</div>
		</div>

		<div class="container">
			<p class="d-none" id="userid">${user.memberid }</p>
			<h1>공동구매</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/groupbuying/list">
					<button class="btn btn-outline-dark btn-sm" type="button">목록</button>
				</a>
				<c:if test="${groups.memberid == user.memberid }">

					<c:if test="${groups.grstate == 0 }">
						<a href="/groupbuying/quit/${groups.grno}">
							<button class="btn btn-outline-success btn-sm" type="button">구매종료</button>
						</a>
					</c:if>
					<c:if test="${groups.grstate == 1 }">
						<button class="btn btn-outline-dark btn-sm" type="button" disabled>구매종료</button>
					</c:if>

					<a href="/groupbuying/update/${groups.grno}">
						<button class="btn btn-outline-primary btn-sm" type="button">수정</button>
					</a>
					<a href="/groupbuying/delete/${groups.grno}">
						<button class="btn btn-outline-danger btn-sm" type="button">삭제</button>
					</a>

				</c:if>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-11">
					<div class="mb-3">
						<h5>${groups.grtitle}</h5>
						<span>${groups.memberid}</span> <span><small> | </small></span> <span><fmt:formatDate
								value="${groups.grregdate}" pattern="yyyy-MM-dd" /></span>
					</div>
				</div>
				<div class="col-sm-1">
					<div class="mb-3">
						<br> <span>조회 : ${groups.grcno}</span>

					</div>
				</div>
			</div>
			<hr>


			<div id="carouselControls" class="carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:forEach items="${images}" var="image" varStatus="status">
						<c:if test="${image.gimgsize == 0 }">
							<div class="carousel-item active">
								<img src="/upload/noimages.png" class="rounded d-block w-100"
									style="height: 400px; object-fit: contain;">
							</div>
						</c:if>
						<c:if test="${image.gimgsize != 0 }">
							<c:if test="${status.index == 0 }">
								<div class="carousel-item active">
									<img src="/upload/${image.gimgpath }"
										onerror="this.src='/upload/noimages.png'"
										class="rounded d-block w-100"
										style="height: 400px; object-fit: contain;">
								</div>
							</c:if>
							<c:if test="${status.index != 0 }">
								<div class="carousel-item">
									<img src="/upload/${image.gimgpath }"
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

			<div class="mb-3">
				<p class="text-muted">구매기한날짜</p>
				<h5>
					<fmt:formatDate value="${groups.grdate}" pattern="yyyy/MM/dd" />
				</h5>
			</div>
			<hr>
			<div class="row">
				<div class="col-sm-6">

					<div class="mb-3">
						<p class="text-muted">가격</p>
						<h5>\ ${groups.grprice}</h5>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="mb-3">
						<p class="text-muted">연락처</p>
						<h5>${groups.grphone }</h5>
					</div>
				</div>
			</div>
			<hr>
			<div style="min-height: 500px;">
				<p class="text-muted">상세내용</p>
				<h5>
					<pre>${groups.grcontent }</pre>
				</h5>
			</div>

			<c:if test="${groups.grstate == 0 }">
				<button class="btn btn-outline-primary" id="purchase">구매</button>
			</c:if>
			<c:if test="${groups.grstate == 1 }">
				<button class="btn btn-outline-primary" id="purchase" disabled>구매</button>
			</c:if>
			<hr>
 -->

	<!-- 댓글 -->
	
	<!--
	<div class="container" style="width: 1100px">
		<c:forEach items="${comments}" var="comment">
			<div class="row" id="${comment.gsno}">
				<div class="col-sm-2 position-relative">
					<div class="position-absolute top-50 start-50 translate-middle">
						<p>${comment.memberid}</p>
					</div>
				</div>
				<div class="col-sm-7">
					<p style="font-size: 1.25em;">
					<pre>${comment.grcontent}</pre>
					</p>
				</div>
				<div class="col-sm-1 position-relative">
					<div class="position-absolute top-50 start-50 translate-middle">
						<p>
							<fmt:formatDate value="${comment.grdate}" pattern="yyyy/MM/dd" />
						</p>
					</div>
				</div>
				<div class="col-sm-2 position-relative">
					<div style="height: auto;">
						<div class="btn-group">
							<p class="d-none" id="rn_${comment.gsno}">${comment.grno}</p>
							<button type="button" id="${comment.gsno}"
								class="recomment btn btn-outline-secondary" style="width: 60px;">답글</button>

							<c:if
								test="${comment.memberid == user.memberid || master.masterid != null}">
								<button type="button" id="${comment.gsno}"
									class="gsupdate btn btn-outline-primary" style="width: 60px;">수정</button>
								<button type="button" id="${comment.gsno}"
									class="gsdelete btn btn-outline-danger" style="width: 60px;">삭제</button>
							</c:if>
						</div>
					</div>
				</div>
				<div>
					<c:forEach items="${recomments}" var="recomment">
						<c:if test="${recomment.regsno == comment.gsno }">

							<div class="row">
								<div class="col-sm-1"></div>
								<div class="col-sm-11" id="re_${recomment.gsno}">
									<hr style="border-top: 1px dotted #bbb;">
									<div class="row" id="${recomment.gsno}">
										<div class="col-sm-2 position-relative">
											<div
												class="position-absolute top-50 start-50 translate-middle">
												<p>${recomment.memberid}</p>
											</div>
										</div>
										<div class="col-sm-7">
											<p style="font-size: 1.25em;">
											<pre>${recomment.grcontent}</pre>
											</p>
										</div>
										<div class="col-sm-1 position-relative">
											<div
												class="position-absolute top-50 start-50 translate-middle">
												<p>
													<fmt:formatDate value="${recomment.grdate}"
														pattern="yyyy/MM/dd" />
												</p>
											</div>
										</div>
										<div class="col-sm-2 position-relative">
											<div style="height: auto;">
												<div class="btn-group">
													<c:if
														test="${recomment.memberid == user.memberid || master.masterid != null}">
														<button type="button" id="${recomment.gsno}"
															class="gsupdate btn btn-outline-primary"
															style="width: 60px;">수정</button>
														<button type="button" id="${recomment.gsno}"
															class="gsdelete btn btn-outline-danger"
															style="width: 60px;">삭제</button>
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-11" id="re_${comment.gsno}"></div>
					</div>
				</div>
			</div>
			<hr>
		</c:forEach>
		<p>댓글쓰기</p>
		<form action="/groupbuying/${groups.grno}/gswrite" method="post"
			name="rs">
			<div class="mb-3">
				<input type="text" class="form-control" id="memberid"
					name="memberid" style="width: 200px;" value="${user.memberid}"
					readonly>
			</div>
			<div class="mb-3">
				<textarea class="form-control" id="grcontent" name="grcontent"
					rows="3"></textarea>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary" type="submit">등록</button>
			</div>
		</form>
		<br>
	</div>

-->


	<!-- 남긴 코멘트 나오는 창 -->
<section class="u-clearfix u-section-4" id="sec-d4f8">
					<c:forEach items="${comments}" var="comm">
						<div class="comments-section">
							<div class="comments">
								<div id="comments-container">
									<div class="comment">
										<div class="comment-user">
											<span class="user-details"><span class="username">${comm.memberid}
											</span><span>on </span><span>${comm.grdate}</span></span>
										</div>
										<div class="${comm.gsno}" id="comment-text"
											style="margin-left: -3%;">
											<pre style="margin-bottom: -2%;">${comm.grcontent}</pre>
											<br>

											<!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
											<c:if
												test="${user.memberid == comm.memberid || master.masterid != null}">
												<input type="button" id="${comm.gsno}" class="dbtn"
													style="margin-top: -1%;" value="삭제">
												<input type="button" id="${comm.gsno}" class="ubtn"
													style="margin-top: -1%;" value="수정">
											</c:if>
											<p class="d-none" id="rn_${comm.gsno}">${comm.grno}</p>

											<input type="button" id="${comm.gsno}" class="recomment"
												style="margin-top: -1%;" value="답글">
										</div>
									</div>
									<c:forEach items="${recomments}" var="recomm">
                                <c:if test="${recomm.regsno == comm.gsno }">
                                    <div class="comment">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-11" id="re_${recomm.gsno}" style="margin-left: 6%;">
              
                                            <div class="row" id="${recomm.gsno}">
                                               
                                                    <div class="comment-user">
                                            <span class="user-details"><span class="username"><span style="font-weight:bold; font-size:16px; color:black;">[re] </span>${recomm.memberid}
                                            </span><span>on </span><span>${recomm.grdate}</span></span>

                                                </div>
                                                <div class="${recomm.gsno}" id="comment-text">
                                            <pre style="margin-bottom: -2%;">${recomm.grcontent}</pre>
                                            <br>

                                            <!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
                                            <c:if
                                                test="${user.memberid == recomm.memberid || master.masterid != null}">
                                                <input type="button" id="${recomm.gsno}" class="dbtn"
                                                    style="margin-top: -1%;" value="삭제">
                                                <input type="button" id="${recomm.gsno}" class="ubtn"
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
                                <div class="col-sm-11" id="re_${comm.gsno}"></div>
                            </div>
					</c:forEach>
					<div class="comment-content">
						<div class="text-right cross">
							<i class="fa fa-times mr-2"></i>
						</div>
						<form method="post" action="/groupbuying/${groups.grno}/gswrite">
						<input type="hidden" name="grno" value="${groups.grno}">
						<input type="hidden" name="regsno" value="0">
						
						<div class="card-body text-center">
							<div class="comment-box text-center">
								<div class="comment-area" style="margin-left: 5%">
									<div class="mb-3" style="margin-left: 20%">
										<input type="text" class="form-control" id="memberid"
											name="memberid" style="width: 200px;"
											value="${user.memberid}" readonly>
									</div>
									<textarea class="form-control" id="grcontent"
										placeholder="댓글을 입력해주세요." rows="4" style="width: 765px;" name="grcontent"></textarea>
									<div class="container" style="width:765px">
									<div class="text-center mt-4">
										<button class="send px-5" id="add"
											style="margin-right: 10%">Submit<i class="fa fa-long-arrow-right ml-1"></i>
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
								<c:if test="${recomm.regsno == comm.gsno }">
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-11" id="re_${recomm.gsno}">
											<hr style="border-top: 1px dotted #bbb;">
											<div class="row" id="${recomm.gsno}">
												<div class="col-sm-2 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>${recomm.memberid}</p>
													</div>
												</div>
												<div class="col-sm-7">
													<p>
													<pre>${recomm.grcontent}</pre>
													</p>
												</div>
												<div class="col-sm-1 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>
															<fmt:formatDate value="${recomm.grdate}"
																pattern="yyyy/MM/dd" />
														</p>
													</div>
												</div>
												<div class="col-sm-2 position-relative">
													<div style="height: auto;">
														<div class="btn-group">

															<c:if
																test="${recomm.memberid == user.memberid || master.masterid != null  }">
																<button type="button" id="${recomm.gsno}"
																	class="gsupdate btn btn-outline-primary ubtn"
																	style="width: 60px;">수정</button>
																<button type="button" id="${recomm.gsno}"
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
								<div class="col-sm-11" id="re_${comm.gsno}"></div>
							</div>
						</div>
			</div>



<br>	
	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>