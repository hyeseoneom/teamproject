$(function() {
	var id = $("#userid").text();
	$(".ubtn").click(function() {
		let rsno = $(this).attr("id");
		$.post("/room/commentone", {"rsno":rsno},function(data){
			var sel = "." + rsno; 
			var roomno = data["roomno"];
			$(sel).empty();
			$(sel).append('<hr style="border-top:1px dotted #bbb;">')
			$(sel).append('<p class="d-none"><input type="text" class="form-control rsno" id="'+rsno+'" name="memberid" style="width: 200px;" value="'+data["memberid"]+'" readonly></p>');
			$(sel).append('<div class="mb-3"><textarea class="form-control" id="rscontent-update" name="rscontent" style="width:95%; margin-right:1%;" rows="4">'+ data["rscontent"]+ '</textarea></div>');
			$(sel).append('<div class="text-center mt-4" style="margin-right:-75px"><button id="rsupd" class="btn btn-success send btn-primary rsupdbtn" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');

		})
	})
	$("body").on("click",".rsupdbtn",function(){
		var rscontent = $("#rscontent-update").val();
		var rsno = $(".rsno").attr("id");
		if(rscontent == ""){
			alert("댓글을 작성해주세요");
			return false;
		}else{
			$.get("/room/rsupdate",{"rsno":rsno,"rscontent":rscontent},function(data){
				location.reload();
			})
		}
		
	})
	
	$(".recomment").click(function() {
		let rersno = $(this).attr("id");
		let sel = "#re_"+rersno;
		$(sel).empty();
		$(sel).append('<hr style="border-top:1px dotted #bbb;">')
		$(sel).append('<div class="mb-3" style="margin-left: 18%"><input type="text" class="form-control rersno" id="'+rersno+'" name="memberid" style="width: 200px;" value="'+id+'" readonly></div>');
		$(sel).append('<div class="mb-3" style="margin-left: 18%"><textarea class="form-control" id="rscontent-recomm" name="rscontent" placeholder="답글을 입력해주세요." rows="4" style="width: 67%;"></textarea></div>');
		$(sel).append('<div class="text-center mt-4"><button id="recomm_'+rersno+'" class="btn btn-success send btn-primary subrecomm" style="margin-right: 18%;" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');	        
			
	})
	
	$("body").on("click",".subrecomm",function(){
		var rscontent = $("#rscontent-recomm").val();
		var rersno = $(".rersno").attr("id");
		var memberid = $(".rersno").val();
		var sel = "#rn_"+rersno;
		var roomno = $(sel).text();
		if(rscontent == ""){
			alert("댓글을 작성해주세요");
			return false;
		}else{
			$.get("/room/recommwrite",{"rersno":rersno,"rscontent":rscontent,"memberid":memberid,"roomno":roomno},function(data){
				location.reload();
			})
		}
		
	})
	
	
	$(".dbtn").click(function(){
		var rsno = $(this).attr("id");
		$.get("/room/rsdelete",{"rsno":rsno},function(data){
			location.reload();
		})
	})

})