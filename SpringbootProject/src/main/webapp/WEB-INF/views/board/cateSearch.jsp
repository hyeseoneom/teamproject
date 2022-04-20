<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="INTUITIVE">
<meta name="description" content="">
<meta name="page_type" content="np-template-header-footer-from-plugin">
<title>${cate}지역글검색 목록</title>
<link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/boardlist.css" media="screen">
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
<meta property="og:title" content="cateSearch">
<meta property="og:type" content="website">
<style>
#center {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

table {
	width: 700px;
}

th {
	width: 150px;
}

td {
	border: 1px solid black;
}

a {
	margin: 10px auto;
}

#page {
	text-align: center;
}
</style>
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
<script type="text/javascript" src="/js/write.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cate").change(function() {
			let cate = $("#cate option:selected").val();
			$.get('/board/list/' + cate, {
				"cate" : cate
			}, function(data) {
				location.href = '/board/list/' + cate;
			})
		})
	})
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />
	<!-- 메인 -->
	<main>
		<section class="u-align-left u-clearfix u-image u-shading u-section-4"
			src="" data-image-width="500" data-image-height="333" id="sec-e74e">
			<div class="u-clearfix u-sheet u-sheet-1">
				<div class="u-container-style u-group u-group-1"
					data-href="/board/list">
					<div class="u-container-layout">
						<h1 class="u-text u-text-default u-title u-text-1">우리 동네 게시판</h1>
						<p
							class="u-align-right u-large-text u-text u-text-variant u-text-2">같은
							지역 사람들과 다양한 이야기를 나누어 보세요</p>
					</div>
				</div>
			</div>
		</section>
		<br>

		<section class="u-align-center u-clearfix u-section-3" id="sec-6158">
			<div class="u-clearfix u-sheet u-sheet-1">
				<div class="u-form-select-wrapper" style="margin-bottom: 35px;">
					<select
						class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white"
						id="cate" name="cate" style="width: 335px;">
						<option value="" id="non_sel" selected>지역을 선택해주세요.</option>
						<option value="강남구" id="_1">강남구</option>
						<option value="강동구" id="_2">강동구</option>
						<option value="강서구" id="_3">강서구</option>
						<option value="강북구" id="_4">강북구</option>
						<option value="관악구" id="_5">관악구</option>
						<option value="광진구" id="_6">광진구</option>
						<option value="구로구" id="_7">구로구</option>
						<option value="금천구" id="_8">금천구</option>
						<option value="노원구" id="_9">노원구</option>
						<option value="동대문구" id="_10">동대문구</option>
						<option value="도봉구" id="_11">도봉구</option>
						<option value="동작구" id="_12">동작구</option>
						<option value="마포구" id="_13">마포구</option>
						<option value="서대문구" id="_14">서대문구</option>
						<option value="성동구" id="_15">성동구</option>
						<option value="성북구" id="_16">성북구</option>
						<option value="서초구" id="_17">서초구</option>
						<option value="송파구" id="_18">송파구</option>
						<option value="영등포구" id="_19">영등포구</option>
						<option value="용산구" id="_20">용산구</option>
						<option value="양천구" id="_21">양천구</option>
						<option value="은평구" id="_22">은평구</option>
						<option value="종로구" id="_23">종로구</option>
						<option value="중구" id="_24">중구</option>
						<option value="중랑구" id="_25">중랑구</option>
					</select>
				</div>
				<div class="u-expanded-width u-table u-table-responsive u-table-1">

					<div style="text-align: left;">
						<a href="/board/list"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50"
							style="display: inline-block;">전체글</a> <a href="/board/bestBoard"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50"
							style="display: inline-block;">추천글</a> <a href="/board/write"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-1 u-btn-round u-radius-50"
							style="display: inline-block;">글쓰기</a>
					</div>
					<div style="text-align: right;">
						<div id="search" style="display: inline-block;">
							<form id="searchform" action="/board/cateSearch/${cate}">
								<select id="searchoption" name="searchn">

									<option value="0">제목</option>
									<option value="1">내용</option>
									<option value="2">작성자</option>
									<option value="3">제목+내용</option>
								</select> <input id="search" name="search" type="text"
									placeholder="검색하세요" class="text_input" /> <input name="submit"
									type="submit" value="검색" />
							</form>
						</div>
					</div>
					<c:if test="${count != 0 }">
						<table class="u-table-entity u-table-entity-1">
							<colgroup>
								<col width="10%">
								<col width="52%">
								<col width="11%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
							</colgroup>
							<thead class="u-black u-table-header u-table-header-1">
								<tr style="height: 15px;">
									<th class="u-border-1 u-border-black u-table-cell">지역분류</th>
									<th class="u-border-1 u-border-black u-table-cell">제목</th>
									<th class="u-border-1 u-border-black u-table-cell">작성자</th>
									<th class="u-border-1 u-border-black u-table-cell">작성일</th>
									<th class="u-border-1 u-border-black u-table-cell">조회수</th>
									<th class="u-border-1 u-border-black u-table-cell">추천수</th>
								</tr>
							</thead>
							<tbody class="u-table-body">
								<c:forEach items="${cateList}" var="cate">
									<tr style="height: 15px;">
										<td class="u-border-1 u-border-grey-30 u-table-cell">${cate.cate}</td>
										<td class="u-border-1 u-border-grey-30 u-table-cell"><a
											href="content/${cate.no}" style="color: black;">${cate.title}</a></td>
										<td class="u-border-1 u-border-grey-30 u-table-cell">${cate.memberid }</td>
										<td class="u-border-1 u-border-grey-30 u-table-cell"><fmt:formatDate
												value="${cate.regdate }" dateStyle="short" /></td>
										<td class="u-border-1 u-border-grey-30 u-table-cell">${cate.readcount}</td>
										<td class="u-border-1 u-border-grey-30 u-table-cell">${cate.recommend}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</c:if>
					<c:if test="${count == 0 }">
						<p style="text-align: center;">아직 입력한 글이 없습니다.</p>
					</c:if>

					<c:if test="${count != 0 }">
						<div id="page" style="margin-top: 1%;">
							<c:if test="${begin > pageNum }">
								<a href="/board/list?p=${begin-1 }">[이전]</a>
							</c:if>
							<c:forEach begin="${begin }" end="${end}" var="i">
								<a href="/board/list?p=${i}">${i}</a>
							</c:forEach>
							<c:if test="${end < totalPages }">
								<a href="/board/list?p=${end+1}">[다음]</a>
							</c:if>
						</div>
					</c:if>
				</div>
			</div>
		</section>


	</main>
	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>