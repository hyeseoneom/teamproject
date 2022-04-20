<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>모집글 수정하기</title>
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
<script>
$(function(){
	$("#extraddress").blur(function(){
		let address = $("#address").val();
		let extraddress = $("#extraddress").val();
		let fsmeeting = address + " " + extraddress;
		$("#addr").empty();
		$("#addr").append("<input type='hidden' name='fsmeeting' value='"+fsmeeting+"'>");
	})
	
	$("#updateform").submit(function(){
		if( $("#fstitle").val() == ""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#title_chk").text("제목을 적어주세요");
			$("#fstitle").focus();
			return false;
		}
		if( $("#fstel").val() == ""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#tel_chk").text("연락처를 적어주세요");
			$("#fsphone").focus();
			return false;
		}
		if( $("#fstime").val() == ""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#date_chk").text("모집기한을 입력해주세요");
			$("#fstime").focus();
			return false;
		}
		if($("#fsprice").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#price_chk").text("가격을 입력해주세요");
			$("#fsprice").focus();
			return false;
		}
		if($("#address").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#address_chk").text("배달장소를 입력해주세요");
			$("#address").focus();
			return false;
		}
		if($("#storename").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#store_chk").text("식당을 입력해주세요");
			$("#storename").focus();
			return false;
		}
		if($("#fspeople").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#people_chk").text("쉐어할 인원수를 선택해주세요");
			$("#fspeople").focus();
			return false;
		}
		if($("#fsfood").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#food_chk").text("배달 카테고리를 선택해주세요");
			$("#fsfood").focus();
			return false;
		}
		if($("#fsarea").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#tel_chk").empty();
			$("#price_chk").empty();
			$("#address_chk").empty();
			$("#store_chk").empty();
			$("#people_chk").empty();
			$("#food_chk").empty();
			$("#price_chk").text("지역을 선택해주세요");
			$("#fsarea").focus();
			return false;
		}
	})
	
	var fsfood = $("#food").text();
	$("#fsfood").val(fsfood).prop("selected",true);
	
	var fspeople = $("#people").text();
	$("#fspeople").val(fspeople).prop("selected",true);
	
	var fsarea = $("#area").text();
	$("#fsarea").val(fsarea).prop("selected",true);
	
	var fstime = $("#fmttime").text();
	$("#fstime").val(fstime);
	
	var fsdate = $("#fmtdate").text();
	$("#fsdate").val(fsdate);
})


</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top.jsp" />

	<!-- 메인 -->
	<main>
	
		<span class="d-none" id="food">${fsboard.fsfood}</span>
		<span class="d-none" id="people">${fsboard.fspeople}</span>
		<span class="d-none" id="area">${fsboard.fsarea}</span>
		<p class="d-none" id="fmtdate">${fsboards.fsdate}</p>
		
		<div class="container">
		<br>
		<br>
			<h3 style="margin-left:18%; margin-top:1%;"><b>글수정</b></h3>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="/fsboard/list" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-text-black u-text-hover-white u-btn-2 u-btn-round u-radius-50">전체 모집글</a>
			</div>
			<hr>
		<form action="/fsboard/update" method="post" id="updateform">
            <input name="fsno" value="${fsboard.fsno}" type="hidden"> 
    <table border="1">
        <tr>
            <td class="orange">지역분류</td>
            <td>
            <select class="form-check-input" id="fsarea" name="fsarea" style="width:457px;height:30px;" required>
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
            <td class="orange">모집글 제목</td>
            <td><input name="fstitle" class="pp" placeholder="배달비를 나누고 싶은 메뉴를 포함해서 제목을 작성해보세요!" required/></td>
        </tr>
        <tr>
            <td class="orange">작성자</td>
            <td><input name="memberid" class="noborder" value="${user.memberid}" readonly></td>
        </tr>
        <tr>
            <td class="orange">배달비</td>
             <td><input name="fsprice" class="pp" placeholder="배달비를 입력해주세요!" required/></td>
        </tr>
        <tr>
            <td class="orange">배달 주소</td>
             <td><input type="text" id="address" placeholder="주소" style="width:457px;" required readonly>
                        <input type="button" onclick="sample5_execDaumPostcode()"
                            value="주소 검색"><br> <input type="text"
                            id="extraddress" placeholder="상세주소" style="width:457px;" required><br>
                        <div id="addr"></div>
                        <br>
                        <div id="map"
                            style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

                        <script
                            src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script
                            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>
                        <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center : new daum.maps.LatLng(37.537187,
                                        127.005476), // 지도의 중심좌표
                                level : 5
                            // 지도의 확대 레벨
                            };

                            //지도를 미리 생성
                            var map = new daum.maps.Map(mapContainer, mapOption);
                            //주소-좌표 변환 객체를 생성
                            var geocoder = new daum.maps.services.Geocoder();
                            //마커를 미리 생성
                            var marker = new daum.maps.Marker({
                                position : new daum.maps.LatLng(37.537187,
                                        127.005476),
                                map : map
                            });

                            function sample5_execDaumPostcode() {
                                new daum.Postcode(
                                        {
                                            oncomplete : function(data) {
                                                var addr = data.address; // 최종 주소 변수

                                                // 주소 정보를 해당 필드에 넣는다.
                                                document
                                                        .getElementById("address").value = addr;
                                                // 주소로 상세 정보를 검색
                                                geocoder
                                                        .addressSearch(
                                                                data.address,
                                                                function(
                                                                        results,
                                                                        status) {
                                                                    // 정상적으로 검색이 완료됐으면
                                                                    if (status === daum.maps.services.Status.OK) {

                                                                        var result = results[0]; //첫번째 결과의 값을 활용

                                                                        // 해당 주소에 대한 좌표를 받아서
                                                                        var coords = new daum.maps.LatLng(
                                                                                result.y,
                                                                                result.x);
                                                                        // 지도를 보여준다.
                                                                        mapContainer.style.display = "block";
                                                                        map
                                                                                .relayout();
                                                                        // 지도 중심을 변경한다.
                                                                        map
                                                                                .setCenter(coords);
                                                                        // 마커를 결과값으로 받은 위치로 옮긴다.
                                                                        marker
                                                                                .setPosition(coords)
                                                                    }
                                                                });
                                            }
                                        }).open();
                            }
                        </script>
                    </div></td>
        </tr>
        <tr>
            <td class="orange">배달비</td>
             <td><input name="fstel" class="pp" placeholder="ex)000-0000-0000 또는 카카오톡 아이디" required/></td>
        </tr>
        <tr>
            <td class="orange">음식점</td>
            <td><input name="storename" class="pp" placeholder="음식점 이름" required/></td>
        </tr>
        <tr>
            <td class="orange">음식점 카테고리</td>
            <td><select class="form-check-input" id="fsfood" name="fsfood" style="width:457px;height:30px;" required>
                            <option value="" id="non_sel" selected>음식점 카테고리를 선택해주세요.</option>
                                <option value="한식" id="_1">한식</option>
                                <option value="중식" id="_2">중식</option>
                                <option value="일식" id="_3">일식</option>
                                <option value="양식" id="_4">양식</option>
                                <option value="분식" id="_5">분식</option>
                                <option value="야식" id="_6">야식</option>
                                <option value="카페" id="_7">카페</option>
                                <option value="기타" id="_8">기타</option>
                            </select>
            </td>
        </tr>
        <tr>
            <td class="orange">모집글 내용</td>
            <td><select class="form-check-input" id="fspeople" name="fspeople" style="width:457px;height:30px;" required>
                            <option value="" id="non_sel" selected>모집 인원을 선택해주세요.</option>
                                <option value="1" id="_1">1명</option>
                                <option value="2" id="_2">2명</option>
                                <option value="3" id="_3">3명</option>
                                <option value="4" id="_4">4명</option>
                                <option value="5" id="_5">5명</option>
                            </select>
            </td>
        </tr>
        <tr>
            <td class="orange">모집기한</td>
            <td><input class="pp" id="fsdate" name="fsdate" type='datetime-local' /></tr>
        <tr>
        <tr>
            <td class="orange">모집인원</td>
            <td><textarea name="content" class="pp" cols="40" rows="10" required></textarea></td>
        </tr>
                <td colspan="2" align="center"><input type="submit"
                    value="새글 등록" id="btn"> <input type="reset" value="초기화"
                    id="btn"></td>
            </tr>
    </table>

</form>
			<!-- 
			<form action="/fsboard/update" method="post"
				enctype="multipart/form-data" id="updateform">
				<span class="d-none" id="food">${fsboard.fsfood}</span>
        <span class="d-none" id="people">${fsboard.fspeople}</span>
        <span class="d-none" id="area">${fsboard.fsarea}</span>
        <p class="d-none" id="fmtdate">${fsboards.fsdate}</p>
			<input name="fsno" value="${fsboard.fsno}" type="hidden"> 
				<div class="row">
					<div class="col-sm-9">
						<div class="mb-3">
							<label for="fstitle" class="form-label">모집글 제목</label> <input
								class="form-control" id="fstitle" name="fstitle"
								placeholder="배달비를 나누고 싶은 메뉴를 포함해서 제목을 작성해보세요!" value="${fsboard.fstitle }">
						</div>
						<p class="text-danger" id="title_chk"></p>
					</div>
					<div class="col-sm-3">
						<div class="mb-3">
							<label for="memberid" class="form-label">아이디</label> <input
								class="form-control" id="memberid" name="memberid"
								value="${user.memberid }" readonly>
						</div>
					</div>
				</div>
				<hr>
				<div class="mb-3">
					<label for="fsprice" class="form-label">배달비</label> <input
						class="form-control" id="fsprice" name="fsprice"
						placeholder="배달비" value="${fsboard.fsprice }"><br>
						<select class="form-check-input" id="fsarea" name="fsarea" style="width:335px;height:30px;">
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
				<p class="text-danger" id="price_chk"></p>
				<hr>
				<div class="row">
					<div class="col-sm-6">
						<p>배달 주소</p>
						<input type="text" id="address" placeholder="주소" readonly>
						<input type="button" onclick="sample5_execDaumPostcode()"
							value="주소 검색"><br> <input type="text"
							id="extraddress" placeholder="상세주소"><br>
						<div id="addr"></div>
						<br>
						<div id="map"
							style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

						<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902ecfcba032871c0d002e39ee2b0dd2&libraries=services,clusterer,drawing"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center : new daum.maps.LatLng(37.537187,
										127.005476), // 지도의 중심좌표
								level : 5
							// 지도의 확대 레벨
							};

							//지도를 미리 생성
							var map = new daum.maps.Map(mapContainer, mapOption);
							//주소-좌표 변환 객체를 생성
							var geocoder = new daum.maps.services.Geocoder();
							//마커를 미리 생성
							var marker = new daum.maps.Marker({
								position : new daum.maps.LatLng(37.537187,
										127.005476),
								map : map
							});

							function sample5_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												var addr = data.address; // 최종 주소 변수

												// 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById("address").value = addr;
												// 주소로 상세 정보를 검색
												geocoder
														.addressSearch(
																data.address,
																function(
																		results,
																		status) {
																	// 정상적으로 검색이 완료됐으면
																	if (status === daum.maps.services.Status.OK) {

																		var result = results[0]; //첫번째 결과의 값을 활용

																		// 해당 주소에 대한 좌표를 받아서
																		var coords = new daum.maps.LatLng(
																				result.y,
																				result.x);
																		// 지도를 보여준다.
																		mapContainer.style.display = "block";
																		map
																				.relayout();
																		// 지도 중심을 변경한다.
																		map
																				.setCenter(coords);
																		// 마커를 결과값으로 받은 위치로 옮긴다.
																		marker
																				.setPosition(coords)
																	}
																});
											}
										}).open();
							}
						</script>
					</div>
					<p class="text-danger" id="address_chk"></p>
					<div class="col-sm-6">
						<div class="mb-3">
							<label for="fstel" class="form-label">연락처</label> <input
								class="form-control" id="fstel" name="fstel"
								placeholder="ex)000-0000-0000 또는 카카오톡 아이디" value="${fsboard.fstel }">
						</div>
						<p class="text-danger" id="tel_chk"></p>
						<hr>
						<div class="mb-3">
							<label for="fsstore" class="form-label">배달 예정 식당</label> <input
								class="form-control" id="storename" name="storename"
								placeholder="음식점이름" value="${fsboard.storename }">
						</div>
						<p class="text-danger" id="store_chk"></p>
						<hr>
						<div>
							<label for="fsfood" class="form-label">음식 카테고리</label>
							<p></p>
							<select class="form-check-input" id="fsfood" name="fsfood"
								style="width: 335px; height: 30px;">
								<option value="" id="non_sel" selected>카테고리를 선택해주세요.</option>
								<option value="한식" id="_1">한식</option>
								<option value="중식" id="_2">중식</option>
								<option value="일식" id="_3">일식</option>
								<option value="양식" id="_4">양식</option>
								<option value="분식" id="_5">분식</option>
								<option value="야식" id="_6">야식</option>
								<option value="카페" id="_7">카페</option>
								<option value="기타" id="_8">기타</option>
							</select>
							<p class="text-danger" id="food_chk"></p>
						</div>
						<hr>
						<div class="mb-3">
							<label for="fsmaxpeople" class="form-label">모집 인원 수</label><br>
							<select class="form-check-input" id="fspeople"
								name="fspeople" style="width: 335px; height: 30px;">
								<option value="" id="non_sel" selected>모집 인원을 선택해주세요.</option>
								<option value="1" id="_1">1명</option>
								<option value="2" id="_2">2명</option>
								<option value="3" id="_3">3명</option>
								<option value="4" id="_4">4명</option>
								<option value="5" id="_5">5명</option>
							</select>
							<p class="text-danger" id="people_chk"></p>
						</div>

						<hr>
						<div class="mb-3">
							<label for="fsdate" class="form-label">모집 기한</label> <input
								class="form-control" id="fsdate" name="fsdate"
								type='datetime-local' />
						</div>
						<p class="text-danger" id="date_chk"></p>
						
					</div>
					<hr>
					<div class="mb-3">
						<label for="fscontent" class="form-label">상세내용</label>
						<textarea class="form-control" id="fscontent" name="fscontent"
							rows="15" placeholder="상세내용">${fsboard.fscontent}</textarea>
					</div>
					<hr>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="btn btn-primary me-md-2" type="reset">다시쓰기</button>
						<button class="btn btn-primary" type="submit">모집글 수정</button>
					</div>
			</form>
			 -->
		</div>
	</main>

	<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>