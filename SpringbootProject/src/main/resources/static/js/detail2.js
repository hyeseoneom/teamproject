$(function() {
	var id = $("#userid").text();
	$(".ubtn").click(function() {
		let gsno = $(this).attr("id");
		$.post("/groupbuying/commentone", {"gsno":gsno},function(data){
			var sel = "." + gsno; 
			var grno = data["grno"];
			$(sel).empty();
			$(sel).append('<hr style="border-top:1px dotted #bbb;">')
			$(sel).append('<p class="d-none"><input type="text" class="form-control gsno" id="'+gsno+'" name="memberid" style="width: 200px;" value="'+data["memberid"]+'" readonly></p>');
			$(sel).append('<div class="mb-3"><textarea class="form-control" id="grcontent-update" name="grcontent" style="width:95%; margin-right:1%;" rows="4">'+ data["grcontent"]+ '</textarea></div>');
			$(sel).append('<div class="text-center mt-4" style="margin-right:-75px"><button id="rsupd" class="btn btn-success send btn-primary rsupdbtn" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');

		})
	})
	$("body").on("click",".rsupdbtn",function(){
		var grcontent = $("#grcontent-update").val();
		var gsno = $(".gsno").attr("id");
		if(grcontent == ""){
			alert("댓글을 작성해주세요");
			return false;
		}else{
			$.get("/groupbuying/gsupdate",{"gsno":gsno,"grcontent":grcontent},function(data){
				location.reload();
			})
		}
		
	})
	
	$(".recomment").click(function() {
		let regsno = $(this).attr("id");
		let sel = "#re_"+regsno;
		$(sel).empty();
		$(sel).append('<hr style="border-top:1px dotted #bbb;">')
		$(sel).append('<div class="mb-3" style="margin-left: 18%"><input type="text" class="form-control regsno" id="'+regsno+'" name="memberid" style="width: 200px;" value="'+id+'" readonly></div>');
		$(sel).append('<div class="mb-3" style="margin-left: 18%"><textarea class="form-control" id="grcontent-recomm" name="grcontent" placeholder="답글을 입력해주세요." rows="4" style="width: 68%;"></textarea></div>');
		$(sel).append('<div class="text-center mt-4"><button id="recomm_'+regsno+'" class="btn btn-success send btn-primary subrecomm" style="margin-right: 20%;" type="submit">Submit<i class="fa fa-long-arrow-right ml-1"></i></button></div>');	        
					
	})
	
	$("body").on("click",".subrecomm",function(){
		var grcontent = $("#grcontent-recomm").val();
		var regsno = $(".regsno").attr("id");
		var memberid = $(".regsno").val();
		var sel = "#rn_"+regsno;
		var grno = $(sel).text();
		if(grcontent == ""){
			alert("댓글을 작성해주세요");
			return false;
		}else{
			$.get("/groupbuying/rgcommwrite",{"regsno":regsno,"grcontent":grcontent,"memberid":memberid,"grno":grno},function(data){
				location.reload();
			})
		}
		
	})
	
	
	$(".dbtn").click(function(){
		var gsno = $(this).attr("id");
		$.get("/groupbuying/gsdelete",{"gsno":gsno},function(data){
			location.reload();
		})
	})
	
})