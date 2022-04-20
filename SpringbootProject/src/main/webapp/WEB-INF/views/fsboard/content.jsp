<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>모집글 상세보기</title>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="fscontent">
<meta property="og:type" content="website">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/fscontent.css" media="screen">
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

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#order").click(function() {
			let people = $("#people").text();
			let ordercount = $("#ordercount").text();
			let fsno = $("#no").text();
			if(people != ordercount){
				window.open('/fsboard/order/' + fsno, '쉐어 등록','width=800, height=800, menubar=no, status=no, toolbar=no');
			}
		})

		$("#deleteorder").click(function() {
			let memberid = $("#memberid").val();
			let fsno = $("#no").text();
			$.post("/fsboard/order/delete", {
				"fsno" : fsno,
				"memberid" : memberid
			}, function(data) {
				location.href = "/fsboard/content/" + fsno;
			})
		})
	})
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />
	<!-- 메인 -->
	<main>



		<div class="container">
			<section class="u-clearfix u-section-0" src="" id="sec-9fea">
				
	

			</section>
			<section class="u-clearfix u-section-1" src="" id="sec-9fea">
				<div class="u-clearfix u-sheet u-sheet-1">
				<br>
				<br>
				<h1>배달비 나눔</h1>
				<hr>
					<div class="u-clearfix u-sheet u-sheet-1">
						<div
							class="u-align-left u-border-2 u-border-palette-5-light-1 u-container-style u-group u-opacity u-opacity-70 u-radius-50 u-shape-round u-white u-group-1">
							<div class="u-container-layout u-container-layout-1">
								<div>
									<div style="float: left;">
										<p class="u-text u-text-1">

											<span style="font-size: 1.25rem; font-weight: 700;">[${fsboards.fsarea}]
												${fsboards.fstitle}</span>

										</p>
									</div>
									<div style="float: right;">
										<a href="/fsboard/content/${fsboards.fsno}"
											class="u-border-2 u-border-hover-black u-border-black u-btn u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-hover-white u-btn-7">모집
											${ordercount}/${fsboards.fspeople }명</a>
									</div>
								</div>

								<p class="u-text u-text-default u-text-2"
									style="font-size: 20px;">${fsboards.memberid}
									/ ${fsboards.fstel} <br>
								</p>
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-4">
									<fmt:formatDate value="${fsboards.regdate}" dateStyle="long" />
									/ 조회수 : ${fsboards.fsreadcount}<br>
								</p>
								<div
									class="u-border-1 u-border-palette-5-light-1 u-expanded-width u-line u-line-horizontal u-line-1"></div>
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-8">
									<span style="font-size: 20px;"><b>모집글 내용</b><span
										class="u-text u-text-default u-text-16">${fsboards.fscontent}<br></span>
									</span>
								</p>

								<div
									class="u-border-1 u-border-palette-5-light-1 u-expanded-width u-line u-line-horizontal u-line-2"></div>
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-6">
									<span style="font-size: 20px;"><b>배달 장소</b><span
										id="fsmeeting" class="u-text u-text-default u-text-7">${fsboards.fsmeeting}<br>
									</span> </span>
								</p>

								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-8">
									<span style="font-size: 20px;"><b>배달비 </b><span
										class="u-text u-text-default u-text-10">${fsboards.fsprice}<br>
									</span> </span>
								</p>
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-9">
									<span style="font-size: 20px;"><b>음식 카테고리</b><span
										class="u-text u-text-default u-text-11">${fsboards.fsfood}<br>
									</span> </span>
								</p>
								<div
									class="u-border-1 u-border-palette-5-light-1 u-expanded-width u-line u-line-horizontal u-line-3"></div>
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-12">
									<span style="font-size: 20px;"><b>모집 기한</b><span
										class="u-text u-text-default u-text-14">${fsboards.fsdate}까지
											모집<br>
									</span> </span>
								</p>
								<p
									class="u-text u-text-default u-text-palette-5-dark-1 u-text-13">
									<span style="font-size: 20px;"><b>배달식당</b><span
										class="u-text u-text-default u-text-15">${fsboards.storename}<br>
									</span> </span>
								</p>
							</div>
						</div>
					</div>
					<section class="u-clearfix u-section-2" src="" id="sec-9fea">
						<div class="u-clearfix u-sheet u-sheet-1">
							<div
								class="u-align-left u-border-2 u-border-palette-5-light-1 u-container-style u-group u-opacity u-opacity-70 u-radius-50 u-shape-round u-white u-group-1">
								<div class="u-container-layout u-container-layout-1">
									<p
										class="u-text u-text-default u-text-palette-5-dark-1 u-text-1">
										<span style="font-size: 20px;"><b>참여 중인 사용자</b> </span>
									</p>
									<div>
										<ul>
											<li>${fsboards.memberid}</li>
											<c:if test="${user.memberid == fsboards.memberid }">
												<c:forEach items="${oList}" var="list">
													<li>${list.memberid }/ ${list.tel }</li>
												</c:forEach>
											</c:if>
											<c:if test="${user.memberid != fsboards.memberid }">
												<c:forEach items="${oList}" var="list">
													<li>${list.memberid }</li>
												</c:forEach>
											</c:if>
											<li></li>
										</ul>
									</div>
									<div>
										<c:if test="${fsboards.fspeople == ordercount}">
											<a 
												id="order"
												class="u-border-2 u-border-hover-black u-border-black u-btn u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-hover-white u-btn-1">신청</a>
											<span class="d-none" id="no">${fsboards.fsno}</span>
											<span class="d-none" id="people">${fsboards.fspeople}</span>
											<span class="d-none" id="ordercount">${ordercount}</span>
										</c:if>

										<c:if test="${fsboards.fspeople != ordercount}">
											<a href="https://nicepage.com/k/yoga-html-templates"
												id="order"
												class="u-border-2 u-border-hover-black u-border-black u-btn u-btn-round u-button-style u-hover-black u-none u-radius-50 u-text-hover-white u-btn-1">신청</a>
											<span class="d-none" id="no">${fsboards.fsno}</span>
											<span class="d-none" id="people">${fsboards.fspeople}</span>
											<span class="d-none" id="ordercount">${ordercount}</span>
										</c:if>

										<c:if test="${ordersearch != 0}">
											<a href="https://nicepage.com/k/yoga-html-templates"
												id="deleteorder"
												class="u-border-2 u-border-hover-palette-2-base u-border-palette-2-base u-btn u-btn-round u-button-style u-hover-palette-2-base u-none u-radius-50 u-text-hover-white u-btn-1">신청
												취소</a>
										</c:if>

									</div>

									<div
										class="u-border-1 u-border-palette-5-light-1 u-expanded-width u-line u-line-horizontal u-line-1">
                                
									</div>
									<div id="map"
                            style="width: 750px; height: 450px; margin-top: 20px; margin-left: 20px;"></div>

                        <script
                            src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script
                            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>
                        <script>
                        $(function() {
                            var container = document.getElementById('map');
                            var options = {
                                center: new kakao.maps.LatLng(37.569370616931174, 126.98601199930015),
                                level: 3
                            };
                            var map = new kakao.maps.Map(container, options);

                            var address = $("#fsmeeting").text();
                            
                            // 주소-좌표 변환 객체를 생성합니다
                            var geocoder = new kakao.maps.services.Geocoder();
                            
                            geocoder.addressSearch(address, function(result, status) {

                                // 정상적으로 검색이 완료됐으면 
                                 if (status === kakao.maps.services.Status.OK) {
                            
                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                            
                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    var marker = new kakao.maps.Marker({
                                        map: map,
                                        position: coords
                                    });
                            
                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                    var infowindow = new kakao.maps.InfoWindow({
                                        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+address+'</div>'
                                    });
                                    infowindow.open(map, marker);
                            
                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                } 
                            }); 
                             });
                        </script>
								</div>
								
							
								
								
								
                            
							</div>

						</div>

						<div class="u-clearfix u-sheet u-sheet-1">
							<div style="float: left;">
								<a href="/fsboard/list"
									class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-text-black u-text-hover-white u-white u-btn-6 u-btn-round u-radius-50"
									style="display: inline-block;">전체 모집글</a>
							</div>
							<div style="float: right;">
								<c:if test="${ user.memberid == fsboards.memberid || master.masterid != null }">
									<a href="/fsboard/update/${fsboards.fsno}"
										class="u-border-2 u-border-palette-1-base u-btn u-button-style u-hover-palette-1-base u-text-palette-1-base u-text-hover-white u-white u-btn-6 u-btn-round u-radius-50"
										style="display: inline-block;">글 수정</a>
									<a href="/fsboard/delete/${fsboards.fsno}"
										class="u-border-2 u-border-palette-2-base u-btn u-button-style u-hover-palette-2-base u-text-palette-2-base u-text-hover-white u-white u-btn-6 u-btn-round u-radius-50"
										style="display: inline-block;">글 삭제</a>
								</c:if>
							</div>
						</div>
					</section>
					<!-- 
			<c:if test="${fsboards.memberid == user.memberid }">

				<a href="/fsboard/update/${fsboards.fsno}">
					<button class="btn btn-outline-primary btn-sm" type="button">수정</button>
				</a>
				<a href="/fsboard/delete/${fsboards.fsno}">
					<button class="btn btn-outline-danger btn-sm" type="button">삭제</button>
				</a>

			</c:if>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-11">
				<div class="mb-3">
					<h5>${fsboards.fstitle}</h5>
					<span>${fsboards.memberid}</span> <span><small> | </small></span> <span><fmt:formatDate
							value="${fsboards.regdate}" pattern="yyyy-MM-dd" /></span>
				</div>
			</div>
			<div>
				<h4>현재 모집인원</h4>
				<ul>
					<li>${fsboards.memberid}</li>
					<c:if test="${user.memberid == fsboards.memberid }">
						<c:forEach items="${oList}" var="list">
							<li>${list.memberid }/ ${list.tel }</li>
						</c:forEach>
					</c:if>
					<c:if test="${user.memberid != fsboards.memberid }">
						<c:forEach items="${oList}" var="list">
							<li>${list.memberid }</li>
						</c:forEach>
					</c:if>
					<li></li>
				</ul>
				<div>
				<c:if test="${fsboards.fspeople == ordercount}">
					<button disabled>주문</button>
				</c:if>

				<c:if test="${fsboards.fspeople != ordercount}">
					<button id="order">주문</button><span class="d-none" id="no">${fsboards.fsno}</span>
				</c:if>
				
				<c:if test="${ordersearch != 0}">
					<button id="deleteorder">주문취소</button>
				</c:if>
				
				</div>
			</div>
			<div style="min-height: 500px;">
				<p class="text-muted">상세내용</p>
				<h5>
					<pre>${fsboards.fscontent }</pre>
				</h5>
			</div>
			<div class="col-sm-1">
				<div class="mb-3">
					<br> <span>조회 : ${fsboards.fsreadcount}</span>

				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-6">
				<div class="mb-3">
					<p class="text-muted">연락처</p>
					<h5>${fsboards.fstel}</h5>
				</div>
				<hr>
				<div class="mb-3">
					<p class="text-muted">배달 예정 식당</p>
					<h5>${fsboards.storename}</h5>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3">
					<p class="text-muted">만날장소</p>
					<h5>${fsboards.fsmeeting }</h5>
				</div>
				<hr>
				<div class="mb-3">
					<p class="text-muted">음식 카테고리</p>
					<h5>${fsboards.fsfood}</h5>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="mb-3">
					<p class="text-muted">모집 인원 수</p>
					<h5>${ordercount}/ ${fsboards.fspeople}</h5>
				</div>
				<hr>
				<div class="mb-3">
					<p class="text-muted">모집 기한</p>
					<h5 class="card-text text-primary">
						${fsboards.fsdate}까지 모집중
					</h5>
				</div>
			</div>
		</div>
		<hr>

		<hr>
         -->

	<!-- 남긴 코멘트 나오는 창 -->
<section class="u-clearfix u-section-3" id="sec-d4f8">
					<c:forEach items="${comments}" var="comm">
						<div class="comments-section">
							<div class="comments">
								<div id="comments-container">
									<div class="comment">
										<div class="comment-user">
											<span class="user-details"><span class="username">${comm.memberid}
											</span><span>on </span><span>${comm.fsdate}</span></span>
										</div>
										<div class="${comm.fscno}" id="comment-text"
											style="margin-left: -3%;">
											<pre style="margin-bottom: -2%;">${comm.fsccontent}</pre>
											<br>

											<!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
											<c:if
												test="${user.memberid == comm.memberid || master.masterid != null}">
												<input type="button" id="${comm.fscno}" class="dbtn"
													style="margin-top: -1%;" value="삭제">
												<input type="button" id="${comm.fscno}" class="ubtn"
													style="margin-top: -1%;" value="수정">
											</c:if>
											<p class="d-none" id="rn_${comm.fscno}">${comm.fsno}</p>

											<input type="button" id="${comm.fscno}" class="recomment"
												style="margin-top: -1%;" value="답글">
										</div>
									</div>
									<c:forEach items="${recomments}" var="recomm">
                                <c:if test="${recomm.refscno == comm.fscno }">
                                    <div class="comment">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-11" id="re_${recomm.fscno}" style="margin-left: 6%;">
              
                                            <div class="row" id="${recomm.fscno}">
                                               
                                                    <div class="comment-user">
                                            <span class="user-details"><span class="username"><span style="font-weight:bold; font-size:16px; color:black;">[re] </span>${recomm.memberid}
                                            </span><span>on </span><span>${recomm.fsdate}</span></span>

                                                </div>
                                                <div class="${recomm.fscno}" id="comment-text">
                                            <pre style="margin-bottom: -2%;">${recomm.fsccontent}</pre>
                                            <br>

                                            <!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
                                            <c:if
                                                test="${user.memberid == recomm.memberid || master.masterid != null}">
                                                <input type="button" id="${recomm.fscno}" class="dbtn"
                                                    style="margin-top: -1%;" value="삭제">
                                                <input type="button" id="${recomm.fscno}" class="ubtn"
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
                                <div class="col-sm-11" id="re_${comm.fscno}"></div>
                            </div>
					</c:forEach>
					<div class="comment-content">
						<div class="text-right cross">
							<i class="fa fa-times mr-2"></i>
						</div>
						<div class="card-body text-center">
							<div class="comment-box text-center">
								<div class="comment-area">
									<div class="mb-3" style="margin-left: 20%">
										<input type="text" class="form-control" id="memberid"
											name="memberid" style="width: 200px;"
											value="${user.memberid}" readonly>
									</div>
									<textarea class="form-control" id="fsccontent"
										placeholder="댓글을 입력해주세요." rows="4" style="width: 765px;"></textarea>
									<div class="text-center mt-4">
										<button class="send px-5" id="add"
											style="margin-right: 10%;">
											Submit<i class="fa fa-long-arrow-right ml-1"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<p class="d-none" id="userid">${user.memberid }</p>
							<c:forEach items="${recomments}" var="recomm">
								<c:if test="${recomm.refscno == comm.fscno }">
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-11" id="re_${recomm.fscno}">
											<hr style="border-top: 1px dotted #bbb;">
											<div class="row" id="${recomm.fscno}">
												<div class="col-sm-2 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>${recomm.memberid}</p>
													</div>
												</div>
												<div class="col-sm-7">
													<p>
													<pre>${recomm.fsccontent}</pre>
													</p>
												</div>
												<div class="col-sm-1 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>
															<fmt:formatDate value="${recomm.fsdate}"
																pattern="yyyy/MM/dd" />
														</p>
													</div>
												</div>
												<div class="col-sm-2 position-relative">
													<div style="height: auto;">
														<div class="btn-group">

															<c:if
																test="${recomm.memberid == user.memberid || master.masterid != null  }">
																<button type="button" id="${recomm.fscno}"
																	class="gsupdate btn btn-outline-primary ubtn"
																	style="width: 60px;">수정</button>
																<button type="button" id="${recomm.fscno}"
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
								<div class="col-sm-11" id="re_${comm.fscno}"></div>
							</div>
						</div>
			</div>



<br>	
		
</div>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			$(function() {
				var id = $("#userid").text();
				$("a[id]").click(function() {
					let fsno = $(this).attr("id"); //id -> memberid 생각
					$.ajax({
						url : "/fsboard/delete",
						data : "fsno=" + fsno,
						method : "delete"
					}).done(function() {
						location.href = "/fsboard/list";
					})
					return false;
				})//click

				$("#add").click(
						function() {
							let memberid = '${user.memberid}';
							let fsccontent = $("#fsccontent").val();
							let fsno = '${fsboards.fsno}';
							$.ajax({
									url : "/fsboard/fscwrite",
									data : "fsno=" + fsno + "&memberid="+ memberid + "&fsccontent="+ fsccontent,
									method : "get"
							}).done(function() {
								location.reload();
							});
						})//click

				$(".ubtn").click(function() {
						let fscno = $(this).attr("id");
						$.post("/fsboard/commentone",{"fscno" : fscno},function(data) {
								var sel = "." + fscno;
								var fsno = data["fsno"];
								$(sel).empty();
								$(sel).append('<p class="d-none"><input type="text" class="form-control fscno" id="'+fscno+'" name="memberid" style="width: 200px;" value="'+data["memberid"]+'" readonly></p>');
								$(sel).append('<div class="mb-3"><textarea class="form-control" id="fsccontent-update" name="fsccontent" style="width:95%; margin-right:1%;" rows="4">'+ data["fsccontent"]+ '</textarea></div>');
								$(sel).append('<div class="text-center mt-4" style="margin-right:-35px"><button id="rsupd" class="btn btn-success send btn-primary rsupdbtn" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');

						})
				})

				$("body").on("click", ".rsupdbtn", function() {
					var fsccontent = $("#fsccontent-update").val();
					var fscno = $(".fscno").attr("id");
					if (fsccontent == "") {
						alert("댓글을 작성해주세요");
						return false;
					} else {
						$.get("/fsboard/fscupdate", {
							"fscno" : fscno,
							"fsccontent" : fsccontent
						}, function(data) {
							location.reload();
						})
					}
				})

				$(".recomment").click(function() {
					let refscno = $(this).attr("id");
					let sel = "#re_" + refscno;
					$(sel).empty();
					$(sel).append('<hr style="border-top:1px dotted #bbb;">')
					$(sel).append('<div class="mb-3" style="margin-left: 18%"><input type="text" class="form-control refscno" id="'+refscno+'" name="memberid" style="width: 200px;" value="'+id+'" readonly></div>');
					$(sel).append('<div class="mb-3" style="margin-left: 18%"><textarea class="form-control" id="fsccontent-recomm" name="fsccontent" placeholder="답글을 입력해주세요." rows="4" style="width: 575px;"></textarea></div>');
					$(sel).append('<div class="text-center mt-4"><button id="recomm_'+refscno+'" class="btn btn-success send btn-primary subrecomm" style="margin-right: 20%;" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');	        
				
								
				})

				$("body").on("click", ".subrecomm", function() {
					var fsccontent = $("#fsccontent-recomm").val();
					var refscno = $(".refscno").attr("id");
					var memberid = $(".refscno").val();
					var sel = "#rn_" + refscno;
					var fsno = $(sel).text();
					if (fsccontent == "") {
						alert("댓글을 작성해주세요");
						return false;
					} else {
						$.get("/fsboard/fscommwrite", {
							"refscno" : refscno,
							"fsccontent" : fsccontent,
							"memberid" : memberid,
							"fsno" : fsno
						}, function(data) {
							location.reload();
						})
					}
				})

				$(".dbtn").click(function() {
					let fscno = $(this).attr("id");
					$.ajax({
						url : "/fsboard/fscdelete/" + fscno,
						data : "fscno=" + fscno,
						method : "get"
					}).done(function() {
						location.reload();
					});
				})//click
			})
		</script>

		<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>