<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="​Interior Design for Your Home, ​Our Design Creativity, 01, About Design, ​Turn your house into a Home, 02, About Design, Nature Collections, Interior Design Ideas for Your Modern Home, Contact Us, ​Sign me up!">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>혼사모</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="main-page.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
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
    
<style>
#atag:link { color: black; text-decoration: none;}
#atag:visited { color: black; text-decoration: none;}
#atag:hover { color: black; text-decoration: underline;}
</style>
  </head>
  <body class="u-body u-xl-mode">
	<c:import url="/WEB-INF/views/include/top.jsp" />


	<!-- 메인 -->
	<main>

		 <section class="u-align-left u-clearfix u-image u-shading u-section-1" id="carousel_8e0b" data-image-width="1590" data-image-height="1080">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <div class="u-align-left u-border-8 u-border-white u-container-style u-group u-opacity u-opacity-15 u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <h1 class="u-custom-font u-font-arial u-text u-text-body-alt-color u-text-1"> 혼자사는<br>당신을 위한<br>모든것
            </h1>
          </div>
        </div>
      </div>
    </section>
    <section class="u-clearfix u-section-2" id="carousel_b21e">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-container-style u-layout-cell u-size-30 u-layout-cell-1">
                <div class="u-container-layout u-container-layout-1">
                  <h3 class="u-custom-font u-font-arial u-text u-text-palette-4-base u-text-1">1인가구를 위한&nbsp;<br>최적화 플랫폼
                  </h3>
                  <p class="u-text u-text-2">1인 가구를 위한 맞춤 플랫폼을 소개합니다!<br>새로운 문화 트렌드에 맞춰 합리적인 소비를 만들어 갈수 있도록 저희가 도와드리겠습니다. 배달비가 부담이신가요? 어떤 방을 찾고계신가요?<br>모일수록 더 저렴해지는 저희 혼사모에서는 가까운 이웃과 배달비 부담도 줄이고  의류,식비,주거,반려동물까지 혼자서 해결하기 힘든 모든 부분들을 걱정없이 편리하게 즐길수 있도록 준비되어있습니다.<br> 바로 지금 이곳에서 시작 해 보세요!</p>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-size-30 u-layout-cell-2">
                <div class="u-container-layout u-valign-bottom u-container-layout-2">
                  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
					<canvas id="pie-chart" width="600vw" height="400vh"></canvas>
					<script>
					let foods = ${food};
					console.log(foods);// [{"fsfood":"한식","count":11},{"fsfood":"일식","count":2}];

					let a;
					let b;
					let c;
					let d;
					let e;
					let f;
					let g;
					let h;
					
					let aa = "한식";
					let bb = "중식";
					let cc = "일식";
					let dd = "양식";
					let ee = "분식";
					let ff = "야식";
					let gg = "카페"; 
					let hh = "기타"
					
					
				
					for(index in foods){
						
						if(index == 0){
							a = foods[index].count;
							aa = foods[index].fsfood;
						}else if(index == 1){
							b = foods[index].count;
							bb = foods[index].fsfood;
						}else if(index == 2){
							c = foods[index].count;
							cc = foods[index].fsfood;
						}else if(index == 3){
							d = foods[index].count;
							dd = foods[index].fsfood;
						}else if(index == 4){
							e = foods[index].count;
							ee = foods[index].fsfood;
						}else if(index == 5){
							f = foods[index].count;
							ff = foods[index].fsfood;
						}else if(index == 6){
							g = foods[index].count;
							gg = foods[index].fsfood;
						}else {
							h = foods[index].count;
							hh = foods[index].fsfood;
						}
					}
					new Chart(document.getElementById("pie-chart"), {
					    type: 'pie',
					    data: {
					      labels: [aa,bb,cc,dd,ee,ff,gg,hh],
					      datasets: [{
					        label: "Foods",
					        backgroundColor: ["skyblue","pink","red","yellow","green","navy","purple","black"],
					        data: [a,b,c,d,e,f,g,h]
					      }]
					    },
					    options: {
					    	responsive:false,
					    	
					      title: {
					        display: true,
					        text: '배달비 쉐어 인기 음식',
					     	}
					    }
					});
					
					</script>
					
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-3" id="carousel_0961">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <div class="u-expanded-width u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <a href="/foodstore"><img class="u-image u-image-1" src="/images/ce130361c62a06ddb52d6ccda916835bdccaf6fc62343c29744af58a60fc766c1a5657d563cc7fbbe03dd518570a5df2329314d26831f154003a69_1280.jpg" data-image-width="1280" data-image-height="1280"></a>
                <div class="u-container-style u-group u-group-1">
                  <div class="u-container-layout u-container-layout-2">
                    <h4 class="u-custom-font u-font-playfair-display u-text u-text-1"><a href="/foodstore">오늘 뭐먹지?</a></h4><h6>NEW</h6><hr>
                    <p class="u-text u-text-2"><c:forEach items="${foodlist}" var="food"><a id="atag" href ="/fsboard/content/${food.fsno}">${food.fstitle}</a><hr></c:forEach></p>
                    <!--  <a href="/foodstore" class="u-border-none u-btn u-button-style u-palette-4-base u-btn-1">이동</a>-->
                  </div>
                </div>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-container-layout-3">
                <div class="u-container-style u-group u-group-2">
                  <div class="u-container-layout u-container-layout-4">
                    <h4 class="u-custom-font u-font-playfair-display u-text u-text-3"><a href="/room/list">같이 살래요?</a></h4><h6>NEW</h6><hr>
                    <p class="u-text u-text-4"><c:forEach items="${roomlist}" var="room"><a id="atag" href ="/room/list/${room.roomno}">${room.roomtitle}</a><hr></c:forEach></p>
                    <!-- <a href="/room/list" class="u-border-none u-btn u-button-style u-palette-4-base u-btn-2">이동</a>-->
                  </div>
                </div>
                <a href="/room/list"><img class="u-image u-image-2" src="/images/f51aa373ab6a09c93464f0fde577a7d265c1fe784f4a88d821712748c288af3cd1469543abcf89432ef74f0a57c09876ed4d2caab057702f248728_1280.jpg" data-image-width="960" data-image-height="1280"></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-4" id="sec-51ab">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <div class="u-expanded-width u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-top u-container-layout-1">
                <a href="/groupbuying/list"><img alt="" class="u-image u-image-default u-image-1" src="/images/461c187f5c41daffa667841d64a26eed79e3fbf63f7c3ffb83054edf2dd3a31677f985fb60f705b0868f4f1e8bc8e2125fb513d720c1a3efa411bd_1280.jpg" data-image-width="851" data-image-height="1280"></a>
                <div class="u-container-style u-expanded-width-lg u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-group-1">
                  <div class="u-container-layout u-container-layout-2">
                    <h4 class="u-custom-font u-font-playfair-display u-text u-text-1"><a href="groupbuying/list">함께 사면 최대 50%</a></h4><h6>NEW</h6><hr>
                    <p class="u-text u-text-2"><c:forEach items="${buylist}" var="buy"><a id="atag" href ="/groupbuying/list/${buy.grno}">${buy.grtitle}</a><hr></c:forEach></p>
                   <!--   <a href="/groupbuying/list" class="u-border-none u-btn u-button-style u-palette-4-base u-btn-1">이동</a> -->
                  </div>
                </div>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
                <a href="/petcare"><img alt="" class="u-image u-image-default u-image-2" src="/images/86f6d91f7cd043ad0c4d32ae902a519e438ecba3f2ceeb1731c4a398181690197d8a7047dcf8704c680c67e499d3e54fcc73a94da0aa5d21299aa2_1280.jpg" data-image-width="1280" data-image-height="853"></a>
                <div class="u-container-style u-expanded-width-lg u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-group-2">
                  <div class="u-container-layout u-container-layout-4">
                    <h4 class="u-custom-font u-font-playfair-display u-text u-text-3"><a href="/petcare">맡아주세요!</a></h4><h6>NEW</h6><hr>
                    <p class="u-text u-text-4"><c:forEach items="${petlist}" var="pet"><a id="atag" href ="/petcare/content/${pet.pno}">${pet.ptitle}</a><hr></c:forEach></p>
                    <!-- <a href="/petcare" class="u-border-none u-btn u-button-style u-palette-4-base u-btn-2">이동</a>-->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    


	</main>

<c:import url="/WEB-INF/views/include/bottom.jsp" />
</body>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

let food = new Array ();
food[0] = "피자";
food[1] = "치킨";
food[2] = "햄버거";
food[3] = "족발";
food[4] = "곱창";
food[5] = "돈까스";
food[6] = "제육볶음";
food[7] = "비빔밥";
food[8] = "순대국";
food[9] = "찜닭";
food[10] = "덮밥";
food[11] = "김치찜";
food[12] = "닭갈비";
food[13] = "김치찌개";
food[14] = "된장찌개";
food[15] = "짜장면";
food[16] = "짬뽕";
food[17] = "김밥";
food[18] = "회";
food[19] = "육회";
food[20] = "우동";
food[21] = "라면";
food[22] = "초밥";
food[23] = "마라탕";
food[24] = "쌀국수";
food[25] = "스테이크";
food[26] = "파스타";
food[27] = "샐러드";
food[28] = "카레";
food[29] = "보쌈";
food[30] = "닭발";
food[31] = "갈비찜";
food[32] = "아구찜";
food[33] = "해장국";
food[34] = "도시락";
food[35] = "삼겹살";
food[36] = "크로플";
food[37] = "아이스크림";
food[38] = "타코야끼";
food[39] = "샌드위치";
food[40] = "핫도그";
food[41] = "육계장";
food[42] = "설렁탕";
food[43] = "갈비";
food[44] = "낙곱새";
food[45] = "만두";
let i = Math.floor(Math.random() * food.length)
function foodclick(){	
	let taget = document.getElementById("show");
	for(let j=0; j < i; j++){
		
		taget.innerHTML = "<strong>"+food[i]+"!<strong>";
	}
	
	}


</script>
</html>