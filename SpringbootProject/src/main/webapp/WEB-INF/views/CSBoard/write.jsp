<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
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

/* table{
width :600px;
margin-left:auto; 
margin-right:auto;
height : 450px;
} */
th {
	border: 1px solid white;
	background: white;
	color: #000000;
	width: 150px;
}
td{border: 1px solid white;}

textarea{
width : 100%;
height : 90%;
}

td,th{
border: 1px solid #dbdbdb;
  padding: 5px 20px;
  font-size:15px;
}
table{border-collapse : collapse;}
</style>
</head>
<body>
<!-- 헤더시작-->
<body data-home-page="index.html" data-home-page-title="main page" class="u-body u-xl-mode">
<c:import url="/WEB-INF/views/include/top.jsp" />
<br><br>
<h1 style="text-align: center; color: black">QnA</h1>
<p style="text-align: center">서비스 이용 시 불편사항이나 문의사항을 남겨주시면 신속하고 친절하게 안내해 드리겠습니다!</p>
<br><br>
<%-- <form method="post" id="writeform">
	<table border="1">
		<tr>
			<td class="orange" align="center">title</td>
			<td><input name="cstitle"></td>
		</tr>
		<tr>
			<td class="orange" align="center">id</td>
			<td><input name="memberid" value="${user.memberid}" readonly></td>
		</tr>
	
		<tr>
			<td class="orange" align="center">content</td>
			<td><textarea name="cscontent" cols="40" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-outline-secondary btn-sm" value="등록" onclick="alert('등록되었습니다.');">&nbsp;
			<button type="button" onclick="history.back()" class="btn btn-outline-secondary btn-sm">돌아가기</button>
		</td>
		</tr>
	</table>

</form> --%>
<div id="container">
             <form method="post" id="writeform">
                    <div class="form-group">
                           <label for="title" class="control-label col-xs-2"><strong>제목</strong></label>
                           <div class="col-xs-10">
                                 <input name="cstitle" type="text" class="form-control"  placeholder="제목 입력" required
                                        value="${dto.cstitle}">
                           </div>
                    </div>
                    <div class="form-group">
                           <label for="writer" class="control-label col-xs-2"><strong>ID</strong></label>
                           <div class="col-xs-10">
                                 <input type="text" class="form-control" required
                                        name="memberid" value="${user.memberid}" readonly="readonly">
                           </div>
                    </div>
                    <div class="form-group">
                           <label for="content" class="control-label col-xs-2"><strong>내용</strong></label>
                           <div class="col-xs-10">
                                 <textarea class="form-control" name="cscontent" rows="10" placeholder="내용 입력" required
                                  >${dto.cscontent}</textarea>
                           </div>
                    </div>
                    <br>
                    <div align="right">
				<input type="submit" class="btn btn-outline-secondary btn-sm" value="등록" onclick="alert('등록되었습니다.');">&nbsp;
				<button type="button" onclick="history.back()" class="btn btn-outline-secondary btn-sm">돌아가기</button>
				</div>
				</form>
				</div>
<!-- 푸터시작 -->
	<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-39b0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> &nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은
        </p>
      </div></footer>
	<!-- 푸터끝 -->
</body>
</html>