$(function () {
    $(".labelError").each(function () {
        showError($(this));
    });
    //注册按钮的图片切换
    $("#submit").hover(
        function () {
            $("#submit").attr("src", "/images/regist2.jpg");
        },
        function () {
            $("#submit").attr("src", "/images/regist1.jpg");
        });
    /**
     * 输入框得到焦点时隐藏错误信息
     */
    $(".input").focus(function () {
        var label = $(this).attr("id") +"Error";
        $("#"+label).text("");
        showError($("#"+label));
    });
    //输入框失去焦点时对对应表单进行校验
    $(".input").blur(function () {
        var label = $(this).attr("id");
        var funname = "validate" + label + "()";
        eval(funname);
    })
});

/*
 *用户名校验
 */
function validateloginname(){
    var id = "loginname";
    var val = $("#"+id).val();
    if(!val){
        $("#"+id+"Error").text("用户名不可以为空");
        showError($("#"+id+"Error"));
        return false;
    }
    if(val.length < 3 || val.length > 20){
        $("#"+id+"Error").text("用户名长度必须在3~20之间");
        showError($("#"+id+"Error"));
        return false;
    }
    //用户名是否存在校验
    $.ajax({
        url: "/UserServlet",
        data: {method:"ajxvalidateloginname", loginname:val},
        type:"POST",
        dataType: "json",
        async:false,
        cache:false,
        success:function (result) {
            if(!result){
                $("#"+id+"Error").text("用户名已被注册");
                showError($("#"+id+"Error"));
                return false;
            }
        }
    })
    return true;
}

/*
 *密码校验
 */
function validateloginpass(){
    var id = "loginpass";
    var val = $("#"+id).val();
    if(!val){
        $("#"+id+"Error").text("密码不能为空");
        showError($("#"+id+"Error"));
        return false;
    }
    if(val.length < 3 || val.length > 20){
        $("#"+id+"Error").text("密码长度必须在3~20之");
        showError($("#"+id+"Error"));
        return false;
    }
    return true;
}

/*
 *确认密码校验
 */
function validatereloginpass(){
    var id = "reloginpass";
    var val = $("#"+id).val();
    if(!val){
        $("#"+id+"Error").text("确认密码不能为空");
        showError($("#"+id+"Error"));
        return false;
    }
    if(val != $("#loginpass").val()){
        $("#"+id+"Error").text("两次输入不一致");
        showError($("#"+id+"Error"));
        return false;
    }
    return true;

}

/*
 *邮箱校验
 */
function validateemail(){
    var id = "email";
    var value = $("#" + id).val();
    if(!value) {
        $("#" + id + "Error").text("Email不能为空");
        showError($("#" + id + "Error"));
        return false;
    }
    if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
        $("#" + id + "Error").text("邮件地址错误");
        showError($("#" + id + "Error"));
        return false;
    }
    //邮箱是否存在验证
    $.ajax({
        url: "/UserServlet",
        data: {method:"ajxvalidateeamil", email:value},
        type:"POST",
        dataType: "json",
        async:false,
        cache:false,
        success:function (result) {
            if(!result){
                $("#"+id+"Error").text("邮箱已被注册");
                showError($("#"+id+"Error"));
                return false;
            }
        }
    })
}

/*
 *验证码校验
 */
function validateverifyCode(){
    var id = "verifyCode";
    var value = $("#"+id).val();
    if(!value){
        $("#"+id+"Error").text("请填写验证码")
        showError($("#"+id+"Error"));
        return false;
    }
    if(value.length != 4){
        $("#"+id+"Error").text("验证码错误")
        showError($("#"+id+"Error"));
        return false;
    }
    //验证码是否正确验证
    $.ajax({
        url: "/UserServlet",
        data: {method:"ajxvalidateverifyCode", verifyCode:value},
        type:"POST",
        dataType: "json",
        async:false,
        cache:false,
        success:function (result) {
            if(!result){
                $("#"+id+"Error").text("验证码错误");
                showError($("#"+id+"Error"));
                return false;
            }
        }
    })
}

function showError(ele){
    var txt = ele.text();
    if(txt){
        ele.css("display", "");
    }
    else{
        ele.css("display", "none")
    }
}
/*
*注册登录按钮动态实现
* 可能有bug
 */
function _change() {
    $("#vCode").attr("src", "http://119.29.89.110:8883//VerifyCodeServlet?a=" + new Date().getTime());
}


