<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="​Interior Design for Your Home, ​Our Design Creativity, 01, About Design, ​Turn your house into a Home, 02, About Design, Nature Collections, Interior Design Ideas for Your Modern Home, Contact Us, ​Sign me up!">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <link rel="stylesheet" href="/nicepage.css" media="screen">
	<link rel="stylesheet" href="/main-page.css" media="screen">
    <script class="u-script" type="text/javascript" src="/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.6.3, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"> 
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="main page">
    <meta property="og:type" content="website">
<title>고객센터</title>
<style>
/* 폰트 */
body{
font-family: 'LeferiPoint-WhiteObliqueA';
    
}
@font-face {
    font-family: 'LeferiPoint-WhiteObliqueA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#container {
	margin-bottom: 60px;
    margin-left: 90px;
    margin-right: 90px;
    margin-top: 30px;

}

/* table {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
	/* height: 450px; */
} */

#comm {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	height: 50px;
}

th {
	border: 1px solid white;
	background: white;
	color: #000000;
	width: 150px;
}

td {
	border: 1px solid white;
}

textarea {
	width: 100%;
	height: 90%;
}

td, th {
	border: 1px solid #dbdbdb;
	padding: 5px 20px;
	font-size: 15px;
}

table {
	border-collapse: collapse;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(
			function() {
				$("#add").click(
						function() {
							let masterid = '${master.masterid}';
							let csccontent = $("#csccontent").val();
							let csno = '${dto.csno}';
							$.ajax(
									{
										url : "/CSComm/insert",
										data : "csno=" + csno + "&masterid="
												+ masterid + "&csccontent="
												+ csccontent,
										method : "get"
									}).done(function() {
								location.reload();
							});
						})//click
				$("#${dto.csno}").click(function() {
					/* var count = "${count}";
					if(count > 0) {
						alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
					} */
					let csno = $(this).attr("id");
					$.ajax({
						url : "/CSBoard/delete",
						data : "csno=" + csno,
						method : "delete"
					}).done(function() {
						location.href = "/CSBoard/list";
					})
					return false;
				})//click

				$(".dbtn").click(function() {
					let cscno = $(this).attr("id");
					$.ajax({
						url : "/CSComm/delete/" + cscno,
						method : "get"
					}).done(function() {
						location.reload();
					});
				})//click
				$(".updateComm")
						.click(
								function() {
									let cscno = $(this).attr("id");
									$
											.post(
													"/CSComm/commentOne",
													{
														"cscno" : cscno
													},
													function(data) {
														let sel = "." + cscno;
														$(sel).empty();
														$(sel)
																.append(
																		'<input id="nwcomment" class="form-control form-control-sm" aria-label=".form-control-sm example" style="width:550px;" value="'+data+'">');
														$(sel)
																.append(
																		'<input type="button" class="'+cscno+'" id="nw" value="등록">')
													})
								})
				$(document).on("click", '#nw', function() {
					let cscno = $(this).attr("class");
					let csccontent = $("#nwcomment").val();
					$.post("/CSComm/update", {
						"cscno" : cscno,
						"csccontent" : csccontent
					}, function() {
						location.reload();
					})
				})
			})//ready
</script>
</head>
<!-- 헤더시작-->
<body data-home-page="index.html" data-home-page-title="main page" class="u-body u-xl-mode">

<c:import url="/WEB-INF/views/include/top.jsp" />
<br><br>
<h1 style="text-align: center; color: black">QnA</h1>
<br><br>
	<!-- 본문 -->
<%-- 	<form>
		<div id="container">
			<table class="table"
				style="text-align: center; border: 1px solid #dddddd">
				
					<tr>
						<td align="center" style="width: 20%;"><strong>title</strong></td>
						<td>${dto.cstitle}</td>
					<tr>
						<td align="center"><strong>id</strong></td>
						<td>${dto.memberid}</td>
					<tr>
						<td align="center"><strong>content</strong></td>
						<td>${dto.cscontent}</td>
					<tr>
						<td align="center"><strong>date</strong></td>
						<td><fmt:formatDate value="${dto.csregdate }"
								dateStyle="long" /></td>
					</tr>
				<tr>
					<td colspan="2" align="right">
					<c:if test="${ user.memberid == dto.memberid}">
							<input type="button" class="btn btn-outline-secondary btn-sm"
								value="수정" onclick="location.href='/CSBoard/update/${dto.csno}'" />&nbsp;
					<input id="${dto.csno}" type="button"
								class="btn btn-outline-secondary btn-sm" value="삭제" />&nbsp;
				</c:if> <input type="button" class="btn btn-outline-secondary btn-sm"
						value="목록" onclick="location.href='/CSBoard/list'" />
				</tr>
			</table>
		</div>
	</form> --%>
	<div id="container">
             <form class="form-horizontal">
                    <div class="form-group">
                           <label for="title" class="control-label col-xs-2"><strong>제목</strong></label>
                           <div class="col-xs-10">
                                 <input type="text" class="form-control"  placeholder="Title" required
                                        value="${dto.cstitle}" readonly="readonly">
                           </div>
                    </div>
                    <div class="form-group">
                           <label for="writer" class="control-label col-xs-2"><strong>작성자</strong></label>
                           <div class="col-xs-10">
                                 <input type="text" class="form-control" placeholder="Writer" required
                                        value="${dto.memberid}" readonly="readonly">
                           </div>
                    </div>
                    <div class="form-group">
                           <label for="content" class="control-label col-xs-2"><strong>내용</strong></label>
                           <div class="col-xs-10">
                                 <textarea class="form-control" rows="10" placeholder="Content" required
                                        readonly="readonly">${dto.cscontent}</textarea>
                           </div>
                    </div>
                    <div class="form-group">
                           <label for="regDate" class="control-label col-xs-2"><strong>작성일</strong></label>
                           <div class="col-xs-10">
                                 <input type="text" class="form-control" placeholder="Date" required
                                        value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${dto.csregdate }" />" readonly="readonly">
                           </div>
                    </div>
                    <br>
                    <div class="form-group">
                           <div class="col-xs-offset-2 col-xs-10" align="right">
                           <input type="button" class="btn btn-outline-secondary btn-sm"
						value="목록" onclick="location.href='/CSBoard/list'" />
                                <c:if test="${ user.memberid == dto.memberid || master.masterid != null}">
							<input type="button" class="btn btn-outline-secondary btn-sm"
								value="수정" onclick="location.href='/CSBoard/update/${dto.csno}'" />&nbsp;
					<input id="${dto.csno}" type="button"
								class="btn btn-outline-secondary btn-sm" value="삭제"  onclick="alert('삭제되었습니다.');"/>&nbsp;
				</c:if> 
                           </div>
                    </div>
             </form>
       </div>
	<div id="container" class="form-group">
	<strong>댓글(${count})</strong>
	<hr>
		<c:choose>
			<c:when test="${fn:length(cList) == 0 }">
				<p>댓글이 존재하지 않습니다.</p>
				<hr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${cList}" var="list">
				<%-- 	<table id="comm" class="table">
						<tr>
							<td align="center"><strong>${list.masterid}</strong></td>
							<td align="center">${list.csccontent}</td>
							<td align="center"><fmt:formatDate
									value="${list.cscregdate}" dateStyle="long" /></td>
						</tr>
					</table --%>
					<div class="form-group">
                           <div class="col-xs-10" >
                                <input type="text" class="form-control" placeholder="Writer" required
                                        value="${list.masterid}" readonly="readonly">
                           </div>
                    </div>
                    <br>
					<div class="form-group">
                           <div class="col-xs-10">
                                 <textarea class="form-control" rows="5" placeholder="Content" required
                                        readonly="readonly">${list.csccontent}</textarea>
                    </div>
                    </div>
                    <br>
					<c:if test="${master != null && master.masterid != null}">
						<div class="${list.cscno}" align="right">
							<input type="button" id="${list.cscno}" class="updateComm" value="수정"> 
							<input type="button" id="${list.cscno}" class="dbtn" value="삭제">
						</div>
					</c:if>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
<!-- 	</div> -->
	<%-- <div>
		<c:if test="${master != null && master.masterid != null}">
			<h5>댓글 작성</h5>
			<form >
				<input type="hidden" id="csno" value="${dto.csno}">
				<table border="1" class="table">
					<tr>
						<td class="orange"  align="center"><strong>작성자</strong></td>
						<td><input id="masterid" class="form-control" name="masterid"
							value="${master.masterid}" readonly></td>
					</tr>
					<tr>
						<td class="orange"  align="center"><strong>내용</strong></td>
						<td><textarea id="csccontent" class="form-control"
								name="csccontent" cols="10" rows="5"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button" id="add"
							class="btn btn-outline-secondary btn-sm" value="등록">
							<button type="button" onclick="history.back()"
								class="btn btn-outline-secondary btn-sm">취소</button></td>
					</tr>
				</table>
			</form>
		</c:if>
	</div> --%>
	<div class="form-group">
	<c:if test="${master != null && master.masterid != null}">
			<h5>댓글 작성</h5>
			 <div class="col-xs-10" >
			<input type="hidden" id="csno" value="${dto.csno}">
			</div>
                    <div class="col-xs-10" >
                                <input type="text" id="masterid" class="form-control" name="masterid" required
                                        value="${master.masterid}" readonly="readonly">
                           </div>
                    <br>
                           <div class="col-xs-10">
                                 <textarea class="form-control" id="csccontent" class="form-control"
								name="csccontent" cols="10" rows="5" required ></textarea>
                    </div>
                    <br>
                    <div align="right">
                    <input type="button" id="add"
							class="btn btn-outline-secondary btn-sm" value="등록">
							<button type="button" onclick="history.back()"
								class="btn btn-outline-secondary btn-sm">취소</button>
                    </div>
  	 </c:if>
  	 </div>
  	 </div>
  	 	<!-- 푸터시작 -->
	<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-39b0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> &nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은
        </p>
      </div></footer>
	<!-- 푸터끝 -->
</body>
</html>