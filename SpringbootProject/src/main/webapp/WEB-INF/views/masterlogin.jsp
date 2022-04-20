<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>관리자 로그인</title>
<script>
$(function(){
	$("#btn").click(function(){
		let id = $("#masterid").val();
		let pw = $("#masterpw").val();
		if(!id&&!pw){
			alert("아이디나 패스워드를 정확하게 입력해주세요.");
			return false;
		}else{
			return true;
		}
	})
})
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap')
	;
</style>
<style type="text/css">
hr {
	width: 30%;
}

h1 {
	font-family: 'Dongle', sans-serif;
	text-align: center;
	margin-bottom: 40px;
}

.input {
	width: 10%;
	height: 15%;
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
	margin: auto;
}

.input1 {
	width: 300px;
	
	font-family: 'Dongle', sans-serif;
	font-size: 2em;
	margin: auto;
}

.button_class {
	margin: auto;
	text-align: center;
}

.button_class>button {
	font-family: 'Dongle', sans-serif;
	font-size: 1em;
}

.input_field {
	margin-top: 20px;
	text-align: center;
}


.bt {
  background: #120112;
  background-image: -webkit-linear-gradient(top, #120112, #0a1b26);
  background-image: -moz-linear-gradient(top, #120112, #0a1b26);
  background-image: -ms-linear-gradient(top, #120112, #0a1b26);
  background-image: -o-linear-gradient(top, #120112, #0a1b26);
  background-image: linear-gradient(to bottom, #120112, #0a1b26);
  font-family: Arial;
  color: #ffffff;
  font-size: 10px;
  padding: 5px 7px 8px 7px;
  text-decoration: none;
  text-align: right;
  
}

.bt:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}
.errors{
text-align:center;
}
</style>
</head>
<!-- 헤더시작-->
<body data-home-page="index.html" data-home-page-title="main page" class="u-body u-xl-mode"><header class="u-black u-clearfix u-header u-sticky u-header" id="sec-e47c"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</g></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1">
            <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/" style="padding: 10px 6px;">Home</a>
</li>
<li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"  style="padding: 10px 6px;">배달음식</a>
<div class="u-nav-popup">
<ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-2">
<li class="u-nav-item"><a class="u-button-style u-nav-link u-white" href="/foodstore">오늘 뭐먹지?</a>
</li>
<li class="u-nav-item"><a class="u-button-style u-nav-link u-white" href="/fsboard/list">같이먹어요</a>
</li>
</ul>
</div>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/room/list" style="padding: 10px 6px;">룸쉐어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/petcare" style="padding: 10px 6px;">펫케어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/board/list" style="padding: 10px 6px;">우리동네 이야기</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/groupbuying/list" style="padding: 10px 6px;">공동구매</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/CSBoard/list" style="padding: 10px 6px;">고객센터</a>
</li><c:if test="${user.memberid == null && user.memberpw == null }"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/loginform"style="padding: 10px 6px;">로그인</a>
<div class="u-nav-popup">
<ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-2">
<li class="u-nav-item"><a class="u-button-style u-nav-link u-white" href="/masterloginform">관리자 로그인</a>
</li>
</ul>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/joinform" style="padding: 10px 6px;">회원가입</a>
</li></c:if>   

<c:if test="${user.memberid != null && user.memberpw != null }"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/mypage"style="padding: 10px 6px;">마이페이지</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="/logout" style="padding: 10px 6px;">로그아웃</a>
</li></c:if></ul>                        
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-inner-container-layout u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-3"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Home.html" style="padding: 10px 6px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="#" style="padding: 10px 6px;">배달음식</a><div class="u-nav-popup"><ul class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-4"><li class="u-nav-item"><a class="u-button-style u-nav-link">오늘 뭐먹지?</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link">같이먹어요</a>
</li></ul>
</div>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/room/list" style="padding: 10px 6px;">룸쉐어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/petcare" style="padding: 10px 6px;">펫케어</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/board/list" style="padding: 10px 6px;">우리동네 이야기</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/groupbuying/list" style="padding: 10px 6px;">공동구매</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/CSBoard/list" style="padding: 10px 6px;">고객센터</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="/joinform" style="padding: 10px 6px;">로그인/회원가입</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
        <h4 class="u-text u-text-default u-text-1">혼사모</h4>
      </div></header>
<!-- 헤더끝 --><br><br>
<div class="logo"><h2 align="center">관리자 로그인</h2><br></div>
<div class="input_field">
        <form:form action = "masterlogin" method ="post" modelAttribute ="master">
        <div class="errors">
        <form:errors element="div"/>
        </div>
        <div class="input_field"> 
        <label for="id" class="input">아이디</label>
        <input type="text" name="masterid" id ="masterid" placeholder="masterid" class="input1"/>
        </div>
         <div class="input_field">
         <label for="pwd" class="input">비밀번호</label> 
         <input type="password" name="masterpw" id = "masterpw" placeholder="password"  class="input1"/>&nbsp;
         </div>
              <input class="bt" name ="btn" id="btn" type="submit" value="로그인" />&nbsp;
              </form:form>
              <br><br>
              <!-- <a href=findidform>아이디 찾기</a>&nbsp;
              <a href=findpwform>비밀번호 찾기</a> -->
          </div>
    <!-- 푸터시작 -->
	<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-39b0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> &nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은
        </p>
      </div></footer>
	<!-- 푸터끝 -->
</body>

</html>