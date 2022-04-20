<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>펫케어</title>
    <link rel="stylesheet" href="/CSS/nicepage.css" media="screen">
<link rel="stylesheet" href="/CSS/petwrite.css" media="screen">
    <script class="u-script" type="text/javascript" src="/JS/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="/JS/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.6.5, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Page 1">
    <meta property="og:type" content="website">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function searchaddress(){
    new daum.Postcode({
        oncomplete: function(data) {
        	
        	//주소값을 주소값 input에 붙여넣기
        	document.querySelector("#paddress").value =  data.address;
        }
    }).open();
}
</script>
  </head>
  <body class="u-body u-xl-mode"><c:import url="/WEB-INF/views/include/top.jsp" />
    <section class="u-align-center u-clearfix u-section-1" id="sec-cc67">
      <div class="u-align-left u-clearfix u-sheet u-sheet-1">
      <form method="post" id="writeform" enctype="multipart/form-data">
      <h3 style="margin-left:18%; margin-top:1%;"><b>펫케어 등록</b></h3>
		<table border="1">
			<tr>
				<td class="orange">제목<span style="color:red">*</span></td>
				<td><input name="ptitle" class="ptitle" required /></td>
			</tr>
			<tr>
				<td class="orange">작성자<span style="color:red">*</span></td>
				<td><input name="memberid" class="noborder"
					value="${user.memberid}" readonly></td>
			</tr>
			<tr>
				<td class="orange">지역<span style="color:red">*</span></td>
				<td><input name="paddress" id ="paddress" class="pp" required><button type="button" style="margin-left: 1%;" onclick="searchaddress()" >우편번호 찾기</button><br>
				<input name = "paddress" class="pp" placeholder = "나머지 주소도 입력해주세요." style="margin-top: 1%; width:200px;"></td>
			</tr>
			<tr>
				<td class="orange">연락처<span style="color:red">*</span></td>
				<td><input name="pphone" placeholder="연락처 또는 카카오톡ID를 기재해주세요."
					class="pp" required></td>
			</tr>
			<tr>
				<td class="orange">반려동물 종류<span style="color:red">*</span></td>
				<td><input type="radio" value="개" id="dog" name="pkind" />
					<label for="dog">개</label> <input type="radio" value="고양이"
					id="cat" name="pkind" /> <label for="cat">고양이</label> <input
					type="radio" value="토끼" id="rabbit" name="pkind" /> <label
					for="rabbit">토끼</label> <input type="radio" value="고슴도치"
					id="hedgehog" name="pkind" /> <label for="hedgehog">고슴도치</label> <input
					type="radio" value="그외" id="other" name="pkind" /> <label
					for="other">그외</label></td>
			</tr>
			<tr>
				<td class="orange">기간<span style="color:red">*</span></td>
				<td><input type="radio" value="1주" id="one" name="pperiod" />
					<label for="one">1주</label> <input type="radio" value="2주" id="two"
					name="pperiod" /> <label for="two">2주</label> <input type="radio"
					value="3주" id="three" name="pperiod" /> <label for="three">3주</label>
					<input type="radio" value="4주" id="four" name="pperiod" /> <label
					for="four">4주</label> <input type="radio" value="5주" id="other"
					name="pperiod" /> <label for="other">그외</label></td>
			</tr>
			<tr>
				<td class="orange">요금<span style="color:red">*</span></td>
				<td><input name="pprice" placeholder="원하시는 총 요금을 원까지 기재해주세요."
					class="pp" required></td>
			</tr>
			<tr>
				<td class="orange">사진</td>
				<td><span id="preview"></span>
				<input type="file" class="form-control" id="roompic" name="roompic"
						aria-describedby="inputGroupFileAddon04" aria-label="Upload"
						multiple="multiple" accept="image/*">
						
						</td>
			</tr>
			<tr>
				<td class="orange">내용<span style="color:red">*</span></td>
				<td><textarea name="pcontent" cols="40" rows="10"
						placeholder="400자 이내" class="pp" required></textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="새글 등록" id="btn"> <input type="reset" value="초기화"
					id="btn"></td>
			</tr>
		</table>

	</form>
      
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-39b0"><div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1"> &nbsp;​Copyright 2022. Team3 all rights reserved.<br>김남준 김동희 안찬우 엄혜선 홍해영 현지은
        </p>
      </div></footer>
  </body>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 체크박스 1개라도 체크 안되어있으면 경고창 뜨게하는 ajax -->
<script>
$(document).ready(function () {
    $('#btn').click(function() {
      checked = $("input[name='pkind']:checked").length;

      if(!checked) {
        alert("맡기려는 펫 종류를 선택하세요.");
        return false;
      }

    });
});
<!-- 라디오 1개라도 체크 안되어있으면 경고창 뜨게하는 ajax -->
$(document).ready(function () {
    $('#btn').click(function() {
      checked = $("input[name=pperiod]:checked").length;

      if(!checked) {
        alert("기간을 선택하세요.");
        return false;
      }

    });
});
$(document).ready(function () {
    $('#btn').click(function() {
      checked = $("textarea[name='pcontent']").val();
		
      if(!checked) {
        alert("내용을 입력해주세요.");
        return false;
      }

    });
});
$(document).ready(function () {
    $('#btn').click(function() {
    	title = $("input[name='ptitle']").val();
      if(!title) {
    	  alert("제목을 입력해주세요.");
    	  return false;
      }

    });
});

$(document).ready(function () {
    $('#btn').click(function() {
    	title = $("input[name='paddress']").val();
      if(!title) {
    	  alert("주소를 정확하게 입력해주세요.");
    	  return false;
      }

    });
});
$(document).ready(function () {
    $('#btn').click(function() {
    	title = $("input[name='pphone']").val();
      if(!title) {
    	  alert("연락처를 입력해주세요.");
    	  return false;
      }

    });
});
$(document).ready(function () {
    $('#btn').click(function() {
    	title = $("input[name='pprice']").val();
      if(!title) {
    	  alert("금액을 입력해주세요.");
    	  return false;
      }

    });
});

$(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<span style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });
  

</script>
</html>