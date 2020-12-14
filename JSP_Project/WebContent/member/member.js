// 010-2222-3333
var exp= /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/
$(function(){
        $("#send").click(function(){
            var name = document.querySelector("#name").value;
            var userid= document.querySelector("#userid").value;
            var pwd = document.querySelector("#pwd").value;
            var pwd_check = document.querySelector("#pwd_check").value;
            var email = document.querySelector("#email").value;
            var phone = document.querySelector("#phone").value;
            var readOnly = document.querySelector("#userid").getAttribute("readOnly");
            console.log(readOnly);
            
            if(name==""||name==null){
                alert("이름을 입력하세요");
				$("#name").focus();
                return;
            }
            if(userid==""||userid==null){
                alert("아이디를 입력하세요");
                $("#userid").focus();
                return;                
            }
            if((pwd==""||pwd==null) && (pwd_check==""|| pwd_check==null)){
                $("#pwd").focus();
                alert("비밀번호를 입력하세요");
                return;
            }
            if(pwd!=pwd_check){
                alert("입력하신 암호가 동일하지 않습니다");
                $("#pwd_check").focus();
                return;
            }
            if(email==""){
                alert("이메일을 입력해주세요")
                $("#email").focus();
                return;
            }
            if(!phone.match(exp)){
                alert("전화번호 형식이 아닙니다");
                phone.focus();
            }
			if($("#userid").props("readonly",false)){
				alert("중복검사를 해주세요");
				return;
            }else if($("#userid").props("readonly",true)){
				frm.submit();
			}

			
            
            
        });
		
		$("#btnIdCheck").click(function(){
		var userid = $("#userid").val();
		var checkbox= $("#checkbox");
		checkbox.text("");
		$.ajax({
			type:"POST",
			url:'memberCheck.jsp',
			data:{userid:userid},
			success : function(data){
				if(data==1){
					checkbox.append("사용중인 아이디입니다");
                    checkbox.css("color","red");
					$("#userid").focus();
                    $("#userid").attr("readonly",false);
				}else{
					checkbox.append("사용가능");
                    checkbox.css("color","blue");
                    $("#userid").attr("readonly",true);
				}
				
			}	
		});
	});
        
    });