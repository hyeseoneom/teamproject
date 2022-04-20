<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<style>
/* 폰트 */
.title-area {
	text-align: center;
	padding: 5px 0;
}

.s1 {
	background: #f8f8f8;
	border-bottom: 1px solid #ccc;
	padding: 10px 20px;
	position: relative;
}

.s1 ul {
	margin-top: 20px;
}

.s1 ul li {
	border-bottom: 1px solid #e0e0e0;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.s1 ul li h3 {
	font-size: 16px;
}

.s1 ul li p {
	display: none;
}

.s2 {
	height: 300px;
	background: #ddd;
}

body {
	min-height: 100%;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: "";
	display: block;
	clear: both;
}

.container {
	width: 1000px;
	margin: 0 auto;
}
/* 자주질문 끝 */
#center {
	margin:auto;
}

#btn {
	text-align: right;
	margin-right: 5%;
}

h1, p {
	text-align: center;
	margin-top: 40px
}

table {
	border: 1px solid white;
	width: 1000px;
	border-collapse: collapse;
	margin: auto;
	margin-top: 20px;
}

th {
	border: 1px solid white;
	background: black;
	color: white;
	width: 150px;
}

td {
	border: 1px solid white;
}

td, th {
	border: 1px solid #000000;
	padding: 5px 20px;
	font-size: 15px;
}

a {
	margin: 10px auto;
	color: black;
}

#page {
	text-align: center;
	margin-top: 10px;
}

.searchform {
	text-align: center;
	margin-top: 30px;
}
</style>
<!-- 헤더시작-->
<body data-home-page="index.html" data-home-page-title="main page" class="u-body u-xl-mode">
<c:import url="/WEB-INF/views/include/top.jsp" />
<br><br>
<h1 style="text-align: center; color: black">QnA</h1>
<br><br>
	<div id="center" >
		
		<p><span style="font-weight:bold; font-size:1.2em;">"${search}"</span>로 검색한 결과입니다.</p>
	</div>
	<!-- <div id="btn">
		<input type="button" class="btn btn-outline-secondary" value="Main"
			onclick="location.href='/'" /> 
		<input type="button" class="btn btn-outline-secondary" value="목록 이동"
			onclick="location.href='/CSBoard/list'" />
	</div> -->
	<div id="rr" style="margin-right:-5%;">
	<div id="btn">
		<div id="btn" style="margin-right:18%;">
			<br>
			<br> <a href="/"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50"
							style="display: inline-block;">Main</a> 
							<a href="/CSBoard/list"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50"
							style="display: inline-block;">목록</a>
							
		</div>

	<%-- <c:if test="${count != 0 }">
		<table>
			<tr>
				<th>no</th>
				<th>title</th>
				<th>id</th>
				<th>date</th>
			</tr>
			<c:forEach items="${bList}" var="CSBoard">
				<tr>
					<td align="center">${CSBoard.csno }</td>
					<td align="center"><a href="content/${CSBoard.csno}">${CSBoard.cstitle}</a></td>
					<td align="center">${CSBoard.memberid }</td>
					<td align="center"><fmt:formatDate value="${CSBoard.csregdate }"
							dateStyle="short" /></td>

				</tr>
			</c:forEach>
		</table> --%>
		<c:if test="${count != 0 }">
			<table >
			<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="20%">
							<col width="20%">
						</colgroup>
  			<thead>
   				 <tr align="center">
					<th scope="col">no</th>
					<th scope="col">title</th>
					<th scope="col">id</th>
					<th scope="col">date</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${bList}" var="CSBoard" >
					<tr>
						<td align="center">${CSBoard.csno }</td>
						<td align="center"><a href="content/${CSBoard.csno}">${CSBoard.cstitle}
						</a></td>
						<td align="center">${CSBoard.memberid }</td>
						<td align="center"><fmt:formatDate
								value="${CSBoard.csregdate }" dateStyle="short" /></td>
						
					</tr>
					
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		<%-- <div id="page">
			<c:if test="${begin > pageNum }">
				<a href="search?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin }" end="${end}" var="i">
				<a href="search?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages }">
				<a href="search?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
			</c:if>
		</div>
 --%>
	<%-- </c:if> --%>
	
	<c:if test="${count != 0 }">
	<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="search?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="search?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="search?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>
			</c:if>
	<div align="center">
	<c:if test="${count == 0 }">
	<br><br>검색 조건에 맞는 글이 없습니다.<br><br><br><br>
		</c:if>
	</div>
	<div id="search" align="center" style="clear: right; width: 100%; margin: auto; display: inline-block; text-align: center;">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select> 
			<input type="text" name="search" size="20" maxlength="50" /> 
			<input type="submit" class="btn btn-outline-secondary btn-sm" value="검색" />
			<br><br>
		</form>
	</div>
	<!-- <div id="search" align="center">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select> <input type="text" name="search" size="15" maxlength="50" /> 
			<input type="submit" value="검색" />
		</form>
	</div> -->
<!-- 푸터시작 -->
<br>
<br>
	<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-39b0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> &nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은
        </p>
      </div></footer>
	<!-- 푸터끝 -->
	
	</div>
</body>
</html>