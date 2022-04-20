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
<link rel="stylesheet" href="CSS/nicepage.css" media="screen">
<link rel="stylesheet" href ="CSS/foodstore.css" media="screen">

<script class="u-script" type="text/javascript" src="JS/jquery.js" ></script>
<script class="u-script" type="text/javascript" src="JS/nicepage.js"
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
<meta property="og:title" content="Food_Store">
<meta property="og:type" content="website">
</head>
<body class="u-body u-xl-mode">
<c:import url="/WEB-INF/views/include/top.jsp" />
	<section class="u-align-left u-clearfix u-image u-shading u-section-1"
		id="carousel_b404" data-image-width="1280" data-image-height="853">
		<div class="u-clearfix u-sheet u-sheet-1">
			<h1
				class="u-align-right u-custom-font u-font-arial u-text u-text-body-alt-color u-text-1">
				오늘 뭐먹지?</h1>
			<h3
				class="u-align-right u-custom-font u-text u-text-body-alt-color u-text-font u-text-2">수많은
				리뷰들로 검증된 맛집을 지금 확인해 보세요!</h3>
		</div>
	</section>
	<section class="u-align-center u-clearfix u-section-2" id="sec-2737">
		<div class="u-clearfix u-sheet u-sheet-1">
        <h1 class="u-custom-font u-font-arial u-text u-text-body-color u-text-default u-text-1">우리동네 맛집 BEST5</h1>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
          	<c:forEach items="${foodrank}" var="foodrank">
            <div class="u-align-center u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <img src="/upload/${foodrank.storefilepath}" class="u-image u-image-circle u-image-1"
					width="100%" height="100px" class="img" alt="no image">
                <h5 class="u-text u-text-2"><a href="foodstore/content/${foodrank.storeid}">${foodrank.storename}</a></h5>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>
         <hr style="margin-top: -1%; width:85%;">
      </div>
     
	</section>
	
	<section class="u-align-center u-clearfix u-section-3" id="sec-6158">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-expanded-width u-table u-table-responsive u-table-1">
			<div id="search" style="text-align:right;">
			<form id="searchform" action="fsearch">
				<select id="searchoption" name="searchn">
					<option value="0">점포명</option>
					<option value="1">주소</option>
				</select> <input id="search" name="search" type="text" placeholder="검색하세요"
					class="text_input" /> <input name="submit" type="submit" value="검색"/>
			</form>
		</div>
				<table class="u-table-entity u-table-entity-1">
					<colgroup>
						<col width="57%">
						<col width="21%">
						<col width="9%">
						<col width="13%">
					</colgroup>
					<thead class="u-black u-table-header u-table-header-1">
						<tr style="height: 15px;">
							<th class="u-border-1 u-border-black u-table-cell">음식점 이름</th>
							<th class="u-border-1 u-border-black u-table-cell">위치</th>
							<th class="u-border-1 u-border-black u-table-cell">1인 가격대</th>
							<th class="u-border-1 u-border-black u-table-cell">별점</th>
						</tr>
					</thead>
					<tbody class="u-table-body">
					<c:forEach items="${F_list}" var="flist">
						<tr style="height: 15px;">
							<td class="u-border-1 u-border-grey-30 u-table-cell"><a href="foodstore/content/${flist.storeid}" style="color:black;">${flist.storename}(${flist.fcount})</a></td>
							<td class="u-border-1 u-border-grey-30 u-table-cell">${flist.storeaddress}</td>
							<td class="u-border-1 u-border-grey-30 u-table-cell">${flist.storeprice}</td>
							<td class="u-border-1 u-border-grey-30 u-table-cell">
<div id = "scorecomment">
							<!-- 남긴코멘트에 별점 나오게 처리 -->
							<c:if test="${flist.favg == 0}">
							<p> 별점이 없습니다.</p>
							</c:if>
							<c:if test="${flist.favg == 1}">
							<p>★</p>
							</c:if>
							<c:if test="${flist.favg  == 2}">
							<p>★★</p>
							</c:if>
							<c:if test="${flist.favg  == 3}">
							<p>★★★</p>
							</c:if>
							<c:if test="${flist.favg  == 4}">
							<p style="color:red;">★★★★</p>
							</c:if>
							<c:if test="${flist.favg  == 5}">
							<p style="color:red;">★★★★★</p>
							</c:if>
							</div>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${count != 0 }">
				<div id="page" style="margin-top:1%;">
				<c:if test="${begin > pageNum }">
					<a href="foodstore?p=${begin-1 }">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="foodstore?p=${i}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="foodstore?p=${end+1}">[다음]</a>
				</c:if>
			</div>
			</c:if>
			</div>
		</div>
	</section>


	<footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer"
		id="sec-39b0">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<p class="u-small-text u-text u-text-variant u-text-1">
				&nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희
				안찬우 엄혜선 홍해영 현지은
			</p>
		</div>
	</footer>
	
</body>
</html>