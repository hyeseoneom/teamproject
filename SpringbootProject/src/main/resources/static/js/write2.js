$(function(){
	$("#writeform").submit(function(){
		if( $("#grtitle").val() == ""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#product_chk").empty();
			$("#title_chk").text("제목을 적어주세요");
			$("#grtitle").focus();
			return false;
		}
		if( $("#grphone").val() == ""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#product_chk").empty();
			$("#account_chk").empty();
			$("#phone_chk").text("연락처를 적어주세요");
			$("#grphone").focus();
			return false;
		}
		if( $("#grdate").val() == ""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#product_chk").empty();
			$("#account_chk").empty();
			$("#date_chk").text("구매기한을 입력해주세요");
			$("#grdate").focus();
			return false;
		}
		if($("#grprice").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#product_chk").empty();
			$("#account_chk").empty();
			$("#product_chk").text("가격을 입력해주세요");
			$("#grprice").focus();
			return false;
		}
		if($("#grproduct").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#product_chk").empty();
			$("#account_chk").empty();
			$("#product_chk").text("상품을 넣어주세요");
			$("#grproduct").focus();
			return false;
		}
		if($("#banknum").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#product_chk").empty();
			$("#account_chk").empty();
			$("#account_chk").text("은행을 선택해주세요");
			$("#banknum").focus();
			return false;
		}
		if($("#accountnum").val()==""){
			$("#title_chk").empty();
			$("#date_chk").empty();
			$("#phone_chk").empty();
			$("#product_chk").empty();
			$("#account_chk").empty();
			$("#account_chk").text("계좌번호를 입력해주세요");
			$("#accountnum").focus();
			return false;
		}
	})
})