<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>글 수정하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">

<link rel="stylesheet" href="/css/boardwrite.css" media="screen">
        <link rel="stylesheet" href="/css/nicepage.css" media="screen">
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
    <meta property="og:title" content="write">
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/write.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/include/top.jsp" />
	<!-- 메인 -->
	<main>
		<br>
		<br>
		<div class="container">
		<h3 style="margin-left:18%; margin-top:1%;"><b>글수정</b></h3>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <a href="/board/list"
							class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-none u-text-hover-white u-btn-2 u-btn-round u-radius-50"
							style="display: inline-block;">전체글</a>
            </div>
		<hr>
<form method="post" id="updateform" action="/board/update" enctype="multipart/form-data">
<input type="hidden" name="_method" value="put">
	<table border="1">
		<tr>
			<td class="orange">지역분류</td>
			<td>
			<span class="d-none" id="category">${dto.cate}</span>
			<select class="form-check-input" id="cate" name="cate" style="width:465px;height:30px;" required>
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
			</td>
		</tr>
		<tr>	
			<td class="orange">제목</td>
			<td><input name="title" value="${dto.title }" class="pp" required/>
				<input name="no" value="${dto.no}" type="hidden"> 
			</td>
		</tr>
		<tr>
			<td class="orange">작성자</td>
			<td><input name="id" value="${dto.memberid}" class="noborder" readonly></td>
		</tr>
		<tr>
			<td class="orange">내용</td>
			<td><textarea name="content" cols="40" rows="10" class="pp" required>${dto.content}</textarea></td>
		</tr>
		<tr>
			<td>파일 업로드</td>
			<td>
				<div class="input-group">
					<input type="file" class="form-control" id="pic" name="pic"
						aria-describedby="inputFileAddon04" aria-label="Upload"
						multiple="multiple" accept="image/*">
				</div>
				<div id="preview"></div>
				<script type="text/javascript" src="/js/uploadimg.js"></script>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"
					value="글 수정 완료" id="btn"> <input type="reset" value="초기화"
					id="btn"></td>
		</tr>
	</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
    var cate = $("#category").text();
    $("#cate").val(cate).prop("selected",true);
})
</script>
</form>
</main>
<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>