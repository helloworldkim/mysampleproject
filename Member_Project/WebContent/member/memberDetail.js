var phonereg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/
$(function(){
    $("#btn").click(function(){
        var name = $('#name');
        var userid = $('#userid');
        var email = $("#email");
        var phone =  $("#phone");

        if(name.val()==null||name.val()==""){
            alert("이름을 입력하세요")
            name.focus();
            return;
        }
        if(userid.val()==null||userid.val()==""){
            alert("아이디를 입력하세요")
            userid.focus();
            return;
        }
        if(email.val()==null||email.val()==""){
            alert("이메일을 입력하세요");
            email.focus();
            return;
        }
        if(phone.val()==null||phone.val()==""){
            alert("휴대폰 번호를 입력하세요")
            phone.focus()
            return;
        }
        if(!phone.val().match(phonereg)){
            alert("휴대폰 번호의 형식이 아닙니다")
            phone.focus();
            return;
        }
        $.ajax({
            type:"post",
            data:{userid:userid.val(),name:name.val(),email:email.val(),phone:phone.val()},
            url:'memberUpdate.jsp',
            success:function(data){
                var result = data.trim();
                if(result==1){
                    alert("수정성공");
                    location.href='memberList.jsp';
                }else{
                    alert("수정실패");
                }
            },
            error:function(e){
                alert(e);
            }
        });
    });

    
    
});