var phonereg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
var userIdReg = /^[a-z]+[a-z0-9]{5,19}$/g;
$(function(){
    $("#send").click(function(){
        var name = $('#name');
        var userid = $('#userid');
        var pwd= $("#pwd");
        var pwd_check = $("#pwd_check");
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
        if(pwd.val()==null||pwd.val()==""){
            alert("암호를 입력하세요");
            pwd.focus();
            return;
        }
        if(pwd_check.val()==null|| pwd_check.val()==""){
            alert("암호를 한번더 입력하세요")
            pwd_check.focus();
            return;
        }
        if(pwd.val()!==pwd_check.val()){
            alert("동일한 암호를 적어주세요");
            pwd_check.focus();
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
        frm.submit();

    });
});

$(function(){
    $('#idCheck').click(function(){
        window.open("userIdCheck.jsp","_blank","width=700 height=400");
    });
});