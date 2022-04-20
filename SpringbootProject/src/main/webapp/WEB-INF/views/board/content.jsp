<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글 상세보기</title>
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
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/boardcontent.css" media="screen">
    <script class="u-script" type="text/javascript" src="/js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="/js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.6.5, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="content">
    <meta property="og:type" content="website">
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />
	<!-- 메인 -->
	<main>
		<div class="p-4 p-md-5 mb-4 text-white  bg-dark">
			<div class="col-md-6 px-0">
				<a href="/board/list" style="color: white; text-decoration: none;">
				<h1 class="display-4 fst-italic">우리 동네 게시판</h1></a>
			</div>
		</div>
		<div class="u-clearfix u-sheet u-sheet-1">
		 <a href="../list" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50" style="display:inline-block;">전체글</a>
         <a href="../bestBoard" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50" style="display:inline-block;">추천글</a>
        <div style="float:right;">
    <c:if test="${ user.memberid == dto.memberid || master.masterid != null }">
        <a id="${dto.no}" href="#" class="u-border-2 u-border-palette-2-base u-btn u-button-style u-hover-palette-2-base u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50" style="display:inline-block;">삭제</a>
        <a href="/board/update/${dto.no}" class="u-border-2 u-border-palette-1-base u-btn u-button-style u-hover-palette-1-base u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50" style="display:inline-block;">수정</a>
    </c:if>
    	</div>
        </div>
<div id="container">
	<section class="u-clearfix u-section-1" id="sec-6e4b">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-3 u-border-black u-expanded-width u-line u-line-horizontal u-line-1"></div>
        <p class="u-text u-text-default u-text-1">[${dto.cate}] ${dto.title}</p>
        <p class="u-text u-text-default u-text-3">작성자 : ${dto.memberid}</p>
        <p class="u-text u-text-default u-text-4"><fmt:formatDate value="${dto.regdate }" dateStyle="long"/></p>
        <p class="u-text u-text-default u-text-5">조회수 : ${dto.readcount}</p>
        <p class="u-text u-text-default u-text-5">추천수 : ${dto.recommend}</p>
        <div class="u-border-3 u-border-black u-expanded-width u-line u-line-horizontal u-line-2"></div>
        <c:forEach items="${images}" var="image" varStatus="status">
		<c:if test="${image.imgsize != 0 }">
			<img src="/upload/${image.imgpath }" style="max-width:800px">
		</c:if>
		</c:forEach>
        <p class="u-text u-text-default u-text-6"><pre>${dto.content}</pre></p>
        <c:if test = "${status == 0}">

        <div style="text-align : center; margin-left:45%;">
        <a  id="btnRecommend" class="u-border-2 u-border-black u-hover-black u-border-palette-4-light-1 u-btn u-btn-round u-button-style u-none u-radius-50 u-text-palette-2-base u-btn-3">
          <span style="font-weight: 700;">추천</span>&nbsp; &nbsp;<span class="u-icon u-text-palette-2-base u-icon-1"><svg class="u-svg-content" viewBox="0 0 512 512" x="0px" y="0px" style="width: 1em; height: 1em;"><path d="M376,30c-27.783,0-53.255,8.804-75.707,26.168c-21.525,16.647-35.856,37.85-44.293,53.268 c-8.437-15.419-22.768-36.621-44.293-53.268C189.255,38.804,163.783,30,136,30C58.468,30,0,93.417,0,177.514 c0,90.854,72.943,153.015,183.369,247.118c18.752,15.981,40.007,34.095,62.099,53.414C248.38,480.596,252.12,482,256,482 s7.62-1.404,10.532-3.953c22.094-19.322,43.348-37.435,62.111-53.425C439.057,330.529,512,268.368,512,177.514 C512,93.417,453.532,30,376,30z"></path></svg><img></span>
        </a>
        </div>

    </c:if>
      </div>
    </section>
	
	<div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-3 u-border-black u-expanded-width u-line u-line-horizontal u-line-3"></div>
	
	<br>
<div>

<!-- 남긴 코멘트 나오는 창 -->
<section class="u-clearfix u-section-3" id="sec-d4f8">
					<c:forEach items="${cList}" var="comm">
						<div class="comments-section">
							<div class="comments">
								<div id="comments-container">
									<div class="comment">
										<div class="comment-user">
											<span class="user-details"><span class="username">${comm.memberid}
											</span><span>on </span><span>${comm.regdate}</span></span>
										</div>
										<div class="${comm.cno}" id="comment-text"
											style="margin-left: -3%;">
											<pre style="margin-bottom: -2%;">${comm.ccontent}</pre>
											<br>

											<!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
											<c:if
												test="${user.memberid == comm.memberid || master.masterid != null}">
												<input type="button" id="${comm.cno}" class="dbtn"
													style="margin-top: -1%;" value="삭제">
												<input type="button" id="${comm.cno}" class="ubtn"
													style="margin-top: -1%;" value="수정">
											</c:if>
											<p class="d-none" id="rn_${comm.cno}">${comm.no}</p>

											<input type="button" id="${comm.cno}" class="recomment"
												style="margin-top: -1%;" value="답글">
										</div>
									</div>
									<c:forEach items="${recomments}" var="recomm">
                                <c:if test="${recomm.recno == comm.cno }">
                                    <div class="comment">
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-11" id="re_${recomm.cno}" style="margin-left: 6%;">
              
                                            <div class="row" id="${recomm.cno}">
                                               
                                                    <div class="comment-user">
                                            <span class="user-details"><span class="username"><span style="font-weight:bold; font-size:16px; color:black;">[re] </span>${recomm.memberid}
                                            </span><span>on </span><span>${recomm.regdate}</span></span>

                                                </div>
                                                <div class="${recomm.cno}" id="comment-text">
                                            <pre style="margin-bottom: -2%;">${recomm.ccontent}</pre>
                                            <br>

                                            <!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
                                            <c:if
                                                test="${user.memberid == recomm.memberid || master.masterid != null}">
                                                <input type="button" id="${recomm.cno}" class="dbtn"
                                                    style="margin-top: -1%;" value="삭제">
                                                <input type="button" id="${recomm.cno}" class="ubtn"
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
                                <div class="col-sm-11" id="re_${comm.cno}"></div>
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
									<textarea class="form-control" id="ccontent"
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
								<c:if test="${recomm.recno == comm.cno }">
									<div class="row">
										<div class="col-sm-1"></div>
										<div class="col-sm-11" id="re_${recomm.cno}">
											<hr style="border-top: 1px dotted #bbb;">
											<div class="row" id="${recomm.cno}">
												<div class="col-sm-2 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>${recomm.memberid}</p>
													</div>
												</div>
												<div class="col-sm-7">
													<p>
													<pre>${recomm.ccontent}</pre>
													</p>
												</div>
												<div class="col-sm-1 position-relative">
													<div
														class="position-absolute top-50 start-50 translate-middle">
														<p>
															<fmt:formatDate value="${recomm.regdate}"
																pattern="yyyy/MM/dd" />
														</p>
													</div>
												</div>
												<div class="col-sm-2 position-relative">
													<div style="height: auto;">
														<div class="btn-group">

															<c:if
																test="${recomm.memberid == user.memberid || master.masterid != null  }">
																<button type="button" id="${recomm.cno}"
																	class="gsupdate btn btn-outline-primary ubtn"
																	style="width: 60px;">수정</button>
																<button type="button" id="${recomm.cno}"
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
								<div class="col-sm-11" id="re_${comm.cno}"></div>
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
			let no = $(this).attr("id"); //id -> memberid 생각
			$.ajax({
				url : "/board/delete",
				data : "no=" + no,
				method : "delete"
			}).done(function() {
				location.href = "/board/list";
			})
			return false;
		})//click

		$("#add").click(function() {
			let memberid = '${user.memberid}';
			let ccontent = $("#ccontent").val();
			let no = ${dto.no};
			$.ajax({
				url : "/comm/insert",
				data : "no=" + no + "&memberid=" + memberid + "&ccontent=" + ccontent,
				method : "get"
			}).done(function() {
				location.reload();
			});
		})//click
		
		$("#btnRecommend").click(function() {
			let no = ${dto.no};
		
			$.get("/board/recommend", {"no" : no, "memberid" : id}, function(data) {
				location.reload();
			})
			
		})
		
		$(".ubtn").click(function() {
			let cno = $(this).attr("id");
			$.post("/comm/commentone", {"cno" : cno}, function(data) {
				var sel = "."+cno;
				var no = data["no"];
				$(sel).empty();
				$(sel).append('<p class="d-none"><input type="text" class="form-control cno" id="'+cno+'" name="memberid" style="width: 200px;" value="'+data["memberid"]+'" readonly></p>');
				$(sel).append('<div class="mb-3"><textarea class="form-control" id="ccontent-update" name="ccontent" style="width:95%; margin-right:1%;" rows="4">'+ data["ccontent"]+ '</textarea></div>');
				$(sel).append('<div class="text-center mt-4" style="margin-right:-35px"><button id="rsupd" class="btn btn-success send btn-primary rsupdbtn" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');
				
				})
			})

                    
		$("body").on("click", ".rsupdbtn", function() {
			var ccontent = $("#ccontent-update").val();
			var cno = $(".cno").attr("id");
			if (ccontent == "") {
				alert("댓글을 작성해주세요");
				return false;
			} else {
				$.get("/comm/update", {
					"cno" : cno,
					"ccontent" : ccontent
				}, function(data) {
					location.reload();
				})
			}
		})

		$(".recomment").click(function() {
			let recno = $(this).attr("id");
			let sel = "#re_" + recno;
			$(sel).empty();
			$(sel).append('<hr style="border-top:1px dotted #bbb;">')
			$(sel).append('<div class="mb-3" style="margin-left: 18%"><input type="text" class="form-control recno" id="'+recno+'" name="memberid" style="width: 200px;" value="'+id+'" readonly></div>');
			$(sel).append('<div class="mb-3" style="margin-left: 18%"><textarea class="form-control" id="ccontent-recomm" name="ccontent" placeholder="답글을 입력해주세요." rows="4" style="width: 575px;"></textarea></div>');
			$(sel).append('<div class="text-center mt-4"><button id="recomm_'+recno+'" class="btn btn-success send btn-primary subrecomm" style="margin-right: 20%;" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');	        
		
		})

		$("body").on("click", ".subrecomm", function() {
			var ccontent = $("#ccontent-recomm").val();
			var recno = $(".recno").attr("id");
			var memberid = $(".recno").val();
			var sel = "#rn_" + recno;
			var no = $(sel).text();
			if (ccontent == "") {
				alert("댓글을 작성해주세요");
				return false;
			} else {
				$.get("/comm/rgcommwrite", {
					"recno" : recno,
					"ccontent" : ccontent,
					"memberid" : memberid,
					"no" : no
				}, function(data) {
					location.reload();
				})
			}
		})

		$(".dbtn").click(function() {
			let cno = $(this).attr("id");
			$.ajax({
				url : "/comm/delete/" + cno,
				method : "get"
			}).done(function() {
				location.reload();
			});
		})//click
	})
</script>
</main>
<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>