<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!--  bList begin end count pageNum totalPages -->
<title>모집글 검색 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="#오늘의 인기 메뉴">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <link rel="stylesheet" href="/css/nicepage.css" media="screen">
<link rel="stylesheet" href="/css/fsanother.css" media="screen">
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
    <meta property="og:title" content="fslist">
    <meta property="og:type" content="website">
<style>
#center {
    width: 700px;
    margin-left: auto;
    margin-right: auto;
}

table {
    border: 1px solid black;
    width: 700px;
    border-collapse: collapse;
}

th {border: 1px solid black;
    background-color: orange;
    width: 150px;
}
td{border: 1px solid black;}
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
        $("#fsarea").change(function(){
            let fsarea = $("#fsarea option:selected").val();
            $.get('/fsboard/list/'+fsarea,{"fsarea":fsarea},function(data){
            location.href='/fsboard/list/'+fsarea;
            })
        })
    })
</script>
</head>
<body class="u-body u-xl-mode"> 
<c:import url="/WEB-INF/views/include/top.jsp" />
<main>
    <section class="u-align-center u-clearfix u-section-1" id="sec-acad">
        <div align="center">
        <h2 class="u-text u-text-default u-text-1">#오늘의 인기 메뉴</h2>
        </div>
        <div id="slide" class="carousel carousel-dark slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#slide" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#slide" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#slide" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
   <c:if test="${ranking == [] }">
  <div class="carousel-item active">
    <img src="/upload/noimages.png" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;; font-weight: bold;"></h4>
      </div>
    </div>
  
  </c:if>
  <c:forEach items="${ranking}" var="rank" varStatus="status">
  <c:if test="${status.index == 0 }">
  <c:if test="${rank == '한식'}">
    <div class="carousel-item active">
    <img src="/images/한식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;; font-weight: bold;">${status.count}위 한식</h4>
      </div>
    </div>
  </c:if>
   <c:if test="${rank == '분식'}">
    <div class="carousel-item active">
    <img src="/images/분식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 분식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '야식'}">
    <div class="carousel-item active">
    <img src="/images/야식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 야식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '양식'}">
    <div class="carousel-item active">
    <img src="/images/양식.jpg" class="d-block w-100"
                           style="height: 400px; width: 300px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 양식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '일식'}">
    <div class="carousel-item active">
    <img src="/images/일식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 일식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '중식'}">
    <div class="carousel-item active">
    <img src="/images/중식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 중식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '카페'}">
    <div class="carousel-item active">
    <img src="/images/카페.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 카페</h4>
      </div>
    </div>
  </c:if>
  </c:if>
  <c:if test="${status.index != 0 }">
  <c:if test="${rank == '한식'}">
    <div class="carousel-item">
    <img src="/images/한식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 한식</h4>
      </div>
    </div>
  </c:if>
   <c:if test="${rank == '분식'}">
    <div class="carousel-item">
    <img src="/images/분식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 분식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '야식'}">
    <div class="carousel-item">
    <img src="/images/야식.jpg" class="d-block w-100"
                           style="height: 400px; width: 300px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 야식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '양식'}">
    <div class="carousel-item">
    <img src="/images/양식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 양식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '일식'}">
    <div class="carousel-item">
    <img src="/images/일식.jpg" class="d-block w-100"
                           style="height: 400px; width: 300px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 일식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '중식'}">
    <div class="carousel-item">
    <img src="/images/중식.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 중식</h4>
      </div>
    </div>
  </c:if>
  <c:if test="${rank == '카페'}">
    <div class="carousel-item">
    <img src="/images/카페.jpg" class="d-block w-100"
                           style="height: 400px; object-fit: contain;">
    <div class="carousel-caption d-none d-md-block">
        <h4 style="color:white; font-weight: bold;">${status.count}위 카페</h4>
      </div>
    </div>
  </c:if>
  </c:if>
  </c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#slide" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#slide" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</section>
    <section class="u-clearfix u-section-2" id="sec-4189">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-form u-form-1" style="display : flex;">
          <form action="#" method="POST" class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form" style="padding: 10px;">
            <div class="u-form-group u-form-select u-label-none u-form-group-1">
              <label for="select-f40b" class="u-label">Select</label>
              <div class="u-form-select-wrapper">
                <select id="fsarea" name="fsarea" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" style="width:365px;">
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
            </div>
            <div class="u-align-left u-form-group u-form-submit u-label-none">
              <a href="#" class="u-border-none u-btn u-btn-submit u-button-style u-none u-btn-1">
                <br>
              </a>
            </div>
          </form>
        <a href="/fsboard/list" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-text-black u-text-hover-white u-btn-2 u-btn-round u-radius-50">전체 모집글</a>
        <a href="/fsboard/write" class="u-border-2 u-border-black u-btn u-button-style u-hover-black u-text-black u-text-hover-white u-btn-2 u-btn-round u-radius-50">모집 글쓰기</a>
        </div>
      </div>
    </section>

      <c:if test="${count != 0 }">
      <c:forEach items="${fsList}" var="board">
      <section class="u-clearfix u-section-3" src="" id="sec-9fea">
        <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-align-left u-border-2 u-border-palette-5-light-1 u-container-style u-group u-opacity u-opacity-70 u-radius-50 u-shape-round u-white u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <div>
            <div style="float:left;">
            <p class="u-text u-text-1">
              <span style="font-size: 1.25rem; font-weight: 700;">[${board[0].fsarea}] ${board[0].fstitle}</span>
            </p>
            </div>
            <div style="float : right;">
            <a href="/fsboard/content/${board[0].fsno}" class="u-border-2 u-border-hover-palette-4-base u-border-palette-4-base u-btn u-btn-round u-button-style u-hover-white u-none u-radius-50 u-text-hover-palette-4-dark-1 u-btn-1">모집 ${board[1]}/${board[0].fspeople }명</a>
            </div>
            </div>
            <p class="u-text u-text-default u-text-2" style="font-size:20px;">${board[0].memberid} / ${board[0].fstel} <br>
            </p>
            <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-4"><fmt:formatDate value="${board[0].regdate}" dateStyle="long"/> / 조회수 : ${board[0].fsreadcount}<br>
            </p>
            <div class="u-border-1 u-border-palette-5-light-1 u-expanded-width u-line u-line-horizontal u-line-1"></div>
             <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-8">
              <span style="font-size: 20px;"><b>모집글 내용</b><span class="u-text u-text-default u-text-16">${board[0].fscontent}<br></span>
              </p>
            </p>
         
            <div class="u-border-1 u-border-palette-5-light-1 u-expanded-width u-line u-line-horizontal u-line-2"></div>
            <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-6">
              <span style="font-size: 20px;"><b>배달 장소</b><span class="u-text u-text-default u-text-7">${board[0].fsmeeting}<br>
            </span>
              </span>
            </p>
            
            <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-8">
              <span style="font-size: 20px;"><b>배달비 </b><span class="u-text u-text-default u-text-10">${board[0].fsprice}<br>
            </span>
              </span>
            </p>
            <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-9">
              <span style="font-size: 20px;"><b>음식 카테고리</b><span class="u-text u-text-default u-text-11">${board[0].fsfood}<br>
            </span>
              </span>
            </p>
            <div class="u-border-1 u-border-palette-5-light-1 u-expanded-width u-line u-line-horizontal u-line-3"></div>
            <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-12">
              <span style="font-size: 20px;"><b>모집 기한</b><span class="u-text u-text-default u-text-14">${board[0].fsdate}까지 모집<br>
            </span>
              </span>
            </p>
            <p class="u-text u-text-default u-text-palette-5-dark-1 u-text-13">
              <span style="font-size: 20px;"><b>배달식당</b><span class="u-text u-text-default u-text-15">${board[0].storename}<br>
            </span>
              </span>
            </p>
            <div align="center">
            <a href="/fsboard/content/${board[0].fsno}" class="u-border-2 u-border-hover-palette-4-base u-border-palette-4-base u-btn u-btn-round u-button-style u-hover-white u-none u-radius-50 u-text-hover-palette-4-dark-1 u-btn-2">자세히 보기</a>
            </div>
          </div>
        </div>
        </div>
    </section>
    </c:forEach>
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
</c:if>

    </div>
    
<div style="text-align:center;">
                <div id="search" style="display:inline-block;">
                    <form id="searchform" action="/fsboard/list/search">
                        <select id="searchoption" name="searchn">
               
                            <option value="0">제목</option>
                            <option value="1">내용</option>
                            <option value="2">작성자</option>
                            <option value="3">음식점</option>
                        </select> <input id="search" name="search" type="text" placeholder="검색하세요"
                            class="text_input" /> <input name="submit" type="submit"
                            value="검색" />
                    </form>
                </div>
                </div>
</main>
<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
</html>




