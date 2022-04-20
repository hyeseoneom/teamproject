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
<style>
/*  폰트 */
body {
	font-family: 'LeferiPoint-WhiteObliqueA';
}

@font-face {
	font-family: 'LeferiPoint-WhiteObliqueA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
/* 자주하는질문 */
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
	margin-bottom: 15px;
	margin-left: 90px;
	margin-right: 90px;
	margin-top: 30px;
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.easing/1.3/jquery.easing.1.3.js"></script>
<script>
	$(function() {
		// project ui 스크립트
		project.init();
	})

	var project = {
		init : function() {
			project.faq();
		},

		/* 자주하는질문  */
		faq : function() {
			$('.s1 ul li').on('click', function() {
				var self = $(this), speed = 400, easing = 'easeInOutExpo';

				project.moveScroll(this, -20);

				self.find('p').slideToggle(speed, easing);
			})
		},

		// target으로 스크롤 이동
		moveScroll : function(tg, flex) {
			var speed = 400, easing = 'easeInOutExpo', oft = $(tg).offset().top;
			$('body').stop().animate({
				scrollTop : oft + flex
			}, speed, easing);
		}
	}
</script>

</head>

<!-- 헤더시작-->
<body data-home-page="index.html" data-home-page-title="main page" class="u-body u-xl-mode">


<c:import url="/WEB-INF/views/include/top.jsp" />

<br><br>
<h1 style="text-align: center; color: black">QnA</h1>
<p>서비스 이용 시 불편사항이나 문의사항을 남겨주시면 신속하고 친절하게 안내해 드리겠습니다!</p>
<br><br>
	<div id="center">
		
		<!-- 자주하는질문 -->
		<div class="container">
			<section class="s1">
				<div class="title-area">
					<h2>자주하는 질문 Top5</h2>
				</div>
				<nav>
					<ul>
						<li>
							<h3>Q. 동네인증이 안 돼요!</h3>
							<p>
								동네인증을 하기 전에 현재 내 위치가 인증하려는 동네(접속하려는 동네)에 있는지 확인해 주세요. <br>
								인증하려는 동네(접속하려는 동네)와 현재 내 위치가 다르다면 인증에 실패해요. 해당 동네에 있을 때 인증해 주시길
								바라요. :)<br>
								<br>
							</p>
						</li>
						<li>
							<h3>Q. 닉네임을 변경하고 싶어요.</h3>
							<p>
								[프로필 수정] 페이지에서 사진과 닉네임을 자유롭게 변경할 수 있어요. :) <br> 닉네임은 30일에
								1번만 변경할 수 있어요. 신중히 변경해주세요.<br> 프로필과 닉네임은 상대방에게 보여지는 나의
								모습이에요. 건전한 내용으로 상대방에게 나를 표현해보세요!<br>
								<br>
							</p>
						</li>
						<li>
							<h3>Q. 아이디와 비밀번호를 잊어버렸어요.</h3>
							<p>
								[아이디/비밀번호 찾기]에서 가입시 입력한 이메일, 휴대폰번호를 입력하시면 쉽게 검색할 수 있어요. :) <br>
							</p>
						</li>
						<li>
							<h3>Q. 회원가입을 하려는데 사용할 수 없는 이메일주소라고 나옵니다.</h3>
							<p>
								현재 사이트에 이미 가입된 상태일 수 있어요. <br> 이메일, 휴대폰번호를 입력하고 가입된 아이디가
								있는지 조회해보세요 :)
							</p>
						</li>
						<li>
							<h3>Q. 회원탈퇴는 어떻게 하나요?</h3>
							<p>
								[회원정보수정 > 회원탈퇴]에서 가능해요. <br> 회원탈퇴를 하시면 이용하시던 아이디로 재가입은
								영구적으로 불가능하다는 점 유의해주세요 :)
							</p>
						</li>
					</ul>
				</nav>
			</section>
		</div>
	
		<div id="btn" style="margin-right:18%;">
			<br>
			<br> <a href="/"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50"
							style="display: inline-block;">Main</a> 
							<a href="write"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50"
							style="display: inline-block;">글쓰기</a>
							
		</div>
		
		<c:if test="${count != 0 }">
			<table>
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
					<c:forEach items="${bList}" var="CSBoard">
						<c:if test="${ dto.memberid != 0 && mdto.masterid != 0 }">
							<tr>
								<td align="center">${CSBoard.csno }</td>
								<td align="center"><a href="content/${CSBoard.csno}">${CSBoard.cstitle}
								</a></td>
								<td align="center">${CSBoard.memberid }</td>
								<td align="center"><fmt:formatDate
										value="${CSBoard.csregdate }" dateStyle="short" /></td>

							</tr>
						</c:if>
						<%-- </c:if> --%>
					</c:forEach>
				</tbody>
			</table>

			<div id="page">
				<c:if test="${begin > pageNum }">
					<a href="list?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="list?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="list?p=${end+1}">[다음]</a>
				</c:if>
			</div>


		</c:if>
		<c:if test="${count == 0 }">
			<p style="text-align:center;">아직 입력한 글이 없습니다.</p>
			<br>
			<br>
		</c:if>

		<!-- 검색  -->
	</div>

	<div id="search" align="center"
		style="clear: right; width: 100%; margin: auto; display: inline-block; text-align: center;">
		<form action="search">
			<select name="searchn">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">작성자</option>
			</select> <input type="text" name="search" size="20" maxlength="50" /> <input
				type="submit" class="btn btn-outline-secondary btn-sm" value="검색" />
			<br>
			<br>
		</form>
	</div>
	<!— 푸터시작 —>
	<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-39b0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> &nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은
        </p>
      </div></footer>
	<!— 푸터끝 —>
</body>
</html>