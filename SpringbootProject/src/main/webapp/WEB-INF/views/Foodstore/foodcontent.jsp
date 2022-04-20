<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords"
	content="​Psychology specialist Dr. Sara Dowson, ​Our Clinic Expert Psychologist from New York, ​Dr. Sara Dowson, ​Open for Appointments, Pricing Plans, Free, $310, $530, ​Benefits of psychological therapy">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>같이 먹을래?</title>
<link rel="stylesheet" href="/CSS/nicepage.css" media="screen">
<link rel="stylesheet" href ="/CSS/foodcontent.css" media="screen">

<script class="u-script" type="text/javascript" src="/JS/jquery.js" ></script>
<script class="u-script" type="text/javascript" src="/JS/nicepage.js"
	defer=""></script>
<meta name="generator" content="Nicepage 4.6.3, nicepage.com">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<link id= "u-page-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">




<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="content page">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body u-xl-mode">
  <c:import url="/WEB-INF/views/include/top.jsp" />
    <section class="u-clearfix u-section-1" id="sec-fa3b">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-grey-5 u-shape u-shape-rectangle u-shape-1"></div>
        <c:if test="${dto.storefilesize == 0 }">
							<div class="u-container-style u-group u-image u-shape-rectangle u-image-1">
								<img src="/Users/hyeonjieun/Desktop/upload/1645773960923_14.png" class="first"
								>
							</div>
						</c:if>
						<c:if test="${dto.storefilesize != 0 }">
							<c:if test="${status.index == 0 }">
								<div class="u-container-style u-group u-image u-shape-rectangle u-image-1">
									<img src="/upload/${dto.storefilepath }" class="first"
									>
								</div>
							</c:if>
							<c:if test="${status.index != 0 }">
								<div class="u-container-style u-group u-image u-shape-rectangle u-image-1">
									<img src="/upload/${dto.storefilepath }" class="first"
									>
								</div>
							</c:if>
						</c:if>
          <div class="u-container-layout u-container-layout-1"></div>
        </div>
       <div class="u-container-style u-group u-group-2">
         <input type="hidden" name="store_id" value="${dto.storeid}">
          <div class="u-container-layout">
            <h1 class="u-text u-text-body-color u-text-1"><b>${dto.storename}</b></h1>
            <h1 class="u-align-left u-custom-font u-font-arial u-text u-text-body-color u-text-2">위치 :${dto.storeaddress}</h1>
            <h1 class="u-align-left u-custom-font u-font-arial u-text u-text-body-color u-text-3">1인 가격대:${dto.storeprice}</h1>
            <h1 class="u-custom-font u-font-arial u-text u-text-body-color u-text-4">연락처: ${dto.storephone}</h1>
          </div>
        </div>
        <div style="margin-right:-10%">
         <a href="/foodstore" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-1 u-btn-round u-radius-50">목록</a>
      </div>
      <hr style="width:70%; margin-top:2%;">
    </section>
    <section class="u-align-center u-clearfix u-section-2" id="sec-4ed4">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-group u-group-1">
          <div class="u-container-layout">
            <h5 class="u-text u-text-default u-text-1">${dto.storecomm}</h5>
            <pre class="u-align-center u-text u-text-2"> ${dto.storecontent}
            </pre>
          </div>
        </div>
      </div>
        <hr style="width:70%; margin-top:2%;">
    </section>
    <section class="u-clearfix u-section-3" id="sec-d4f8">
      <div class="u-clearfix u-sheet u-sheet-1"></div>
      <div class="comment-content">
			<div class="text-right cross">
				<i class="fa fa-times mr-2"></i>
			</div>
			<div class="card-body text-center">
				<div class="comment-box text-center">
					<h3 style="margin-left: 20%; margin-top : -3%;"><b>Review</b></h3>
					<div class="rating" id="fcscore">
						<input name=“rating” id="e5" type="radio" value="5"><label for="e5" >☆</label>
						<input name=“rating” id="e4" type="radio" value="4"><label for="e4">☆</label>
						<input name=“rating” id="e3" type="radio" value="3"><label for="e3">☆</label>
						<input name=“rating” id="e2" type="radio" value="2"><label for="e2">☆</label>
						<input name=“rating” id="e1" type="radio" value="1"><label for="e1">☆</label>
					</div>
					<div class="comment-area">
						<textarea class="form-control" id="content" placeholder="진실한 리뷰를 적어주세요"
							rows="4"></textarea>
							<div class="text-center mt-4" style="margin-right:7%">
						<button class="btn btn-success send px-5" id="insertcomment" style="width:150px;">
							Submit<i class="fa fa-long-arrow-right ml-1"></i>
						</button>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 남긴 코멘트 나오는 창 -->
		<c:forEach items="${fcomm}" var="comm">
		<div class="comments-section">
			<div class="comments">
				<div id="comments-container">
					<div class="comment">
						<div class="comment-user">
							<span class="user-details"><span class="username">${comm.memberid}
							</span><span>on </span><span>${comm.fcregdate}</span></span>
							<div id = "scorecomment">
							<!-- 남긴코멘트에 별점 나오게 처리 -->
							<c:if test="${comm.fcscore == 1}">
							<p>★</p>
							</c:if>
							<c:if test="${comm.fcscore == 2}">
							<p>★★</p>
							</c:if>
							<c:if test="${comm.fcscore == 3}">
							<p>★★★</p>
							</c:if>
							<c:if test="${comm.fcscore == 4}">
							<p>★★★★</p>
							</c:if>
							<c:if test="${comm.fcscore == 5}">
							<p>★★★★★</p>
							</c:if>
							</div>
						</div>
						<div class="${comm.fcno}" id="comment-text">
							<pre style="margin-bottom:-2%;">${comm.fccontent}</pre><br> 
							<!-- 코멘트 남긴사람이 접속시에 수정, 삭제 버튼 넣을 위치 -->
							<c:if test="${user.memberid == comm.memberid || master.masterid != null}">
							<input type="button" id="${comm.fcno}" class="deleteComm" style="margin-top:-1%;" value="삭제">
							<input type="button" id="${comm.fcno}" class="updateComm" style="margin-top:-1%;" value="수정">
						</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
    
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-39b0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> &nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은
        </p>
      </div>
      </footer>
      <script>
//댓글입력

$(function() {
	$("#insertcomment").click(function() {
		let storeid =${dto.storeid};
		let fccontent=$("#content").val();
		let fcscore = $("#fcscore input[type=radio]:checked").val();
		let memberid='${user.memberid}';
		$.ajax({
			url : '/fcommentInsert',
	        data: "storeid=" +storeid +"&fccontent=" +fccontent +"&memberid=" +memberid +"&fcscore=" +fcscore,
			method : "post"
		}).done(function() {
			location.reload();
		
		})
	})//insertComm
	$(".deleteComm").click(function() {
		let fcno = $(this).attr("id");
		$.post("/fcdelete", {
			"fcno" : fcno
		}, function() {
			location.reload();
		})
	})//deleteComm
	$(".updateComm").click(function(){
		let fcno = $(this).attr("id");
		$.post("/fcommone",{"fcno":fcno},function(data){
			let sel = "."+fcno;
			$(sel).empty();
			$(sel).append('<div class="rating" id="fcscore1" style="margin-left:-1%;"><input name=“ratingappend” id="s5" type="radio" value="5"><label for="s5" >☆</label><input name=“ratingappend” id="s4" type="radio" value="4"><label for="s4">☆</label><input name=“ratingappend” id="s3" type="radio" value="3"><label for="s3">☆</label><input name=“ratingappend” id="s2" type="radio" value="2"><label for="s2">☆</label><input name=“ratingappend” id="s1" type="radio" value="1"><label for="s1">☆</label></div>');
			$(sel).append('<br><textarea id="nwpccomment" style="width:95%; margin-right:1%; margin-top:-1%;" rows="4" value="'+data+'">');
			$(sel).append('<input type="button" id="nw" class="'+fcno+'" value="등록">')
		})
	})
	$(document).on("click",'#nw' ,function(){
		let fcscore = $("#fcscore1 input[type=radio]:checked").val();
		let fcno = $(this).attr("class");
		let fccontent = $("#nwpccomment").val();
		$.post("/updatefcomm", {"fcno":fcno, "fccontent":fccontent, "fcscore":fcscore}, function() {
			location.reload();
		})
	})
	$(".form-control").click(function(){
		let userid='${user.memberid}';
		if(!userid){
			alert("회원만 댓글 작성이 가능합니다.로그인 또는 회원가입해주세요.");
			return false;
		}
	})
})//ready


//ready
</script>
  </body>
</html>