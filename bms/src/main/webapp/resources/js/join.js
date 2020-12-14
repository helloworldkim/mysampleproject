$(function(){
	$('#userid_dup').hide();
	$('#userid_uniq').hide();
	$('#pwcheck_fail').hide();
	$('#pwcheck_success').hide();

	$("input").keyup(passwordCheck);
	$("input[name=userid]").keyup(idCheck);
	
});
function passwordCheck(){
	let pw1 = $("#userpw").val();
	let pw2 = $("#userpwChk").val();
	let pwCheckSuccessBox = $('#pwcheck_success');
	let pwCheckFailBox= $('#pwcheck_fail');
	if((pw1!=null&&pw1!="")||(pw2!=null&&pw2!="")){
		if(pw1==pw2){
			pwCheckSuccessBox.show();
			pwCheckFailBox.hide();
			$("#join-submit").removeAttr("disabled");
		}else{
			pwCheckSuccessBox.hide();
			pwCheckFailBox.show();
			$("#join-submit").attr("disabled","disabled");
		}
	}
	
};

function idCheck(){
	let userid = $(this).val();
	let passiblebox = $('#userid_uniq');
	let impassiblebox = $('#userid_dup');
	if(userid.length >0){
		$.post("/rest/memberuseridcheck.json",{userid,userid}
		,function(data){
			let result= data.result;
			if(result==0){
				//사용가능
			impassiblebox.hide();
			passiblebox.show();
			$("#join-submit").removeAttr("disabled");
			}else{
			impassiblebox.show();
			passiblebox.hide();
			$("#join-submit").attr("disabled","disabled");
				//사용불가능
			}
		},'json')		
	}else{
			impassiblebox.hide();
			passiblebox.hide();
	}
	
				
}