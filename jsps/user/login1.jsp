<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 78740
  Date: 2021/12/3
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- Style -->
    <link rel="stylesheet" href="<c:url value='/jsps/css/user/style.css'/>" type="text/css" media="all" />
    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jsps/js/user/login1.js'/>"></script>
    <script type="text/javascript">
        $(function () {
            var loginname = window.decodeURI("${cookie.loginname.value}");
            if("${requestScope.loginForm.loginname}"){
                loginname = "${requestScope.loginForm.loginname}"
            }
            $("#loginname").val(loginname);
        })
    </script>
</head>
<body>
<section class="w3l-login">
    <div class="overlay">
        <div class="wrapper">
            <div class="logo">
                <a class="brand-logo" href="index.html">光速购物</a>
            </div>
            <div class="form-section">
                <h3>Login</h3>
                <h6>To continue with Us</h6>
                <td><label class="error" id="msg">${msg}</label></td>
                <form action="<c:url value='/UserServlet'/>" method="post" class="signin-form">
                    <input type="hidden" name="method" value="login" />
                    <div class="form-input">
                        <input type="text" name="loginname" id="loginname" placeholder="Username" required="" autofocus>
                    </div>
                    <td><label id="loginnameError" class="error">${error.loginname}</label></td>
                    <div class="form-input">
                        <input type="password" name="loginpass" id="loginpass" placeholder="Password" required="" value="${loginForm.loginpass}">
                    </div>
                    <td><label id="loginpassError" class="error">${error.loginpass}</label></td>
                    <button id="submit" type="submit" class="btn btn-primary theme-button mt-4">Log in</button>
                </form>
                <p class="signup">Don’t have account yet? <a href="<c:url value='/jsps/user/regist.jsp'/>" class="signuplink">Sign Up</a></p>
            </div>
        </div>
    </div>
    <div id='stars'></div>
    <div id='stars2'></div>
    <div id='stars3'></div>

    <!-- copyright -->
    <div class="copy-right">
        <p>&copy; Internet Web experiment work designed by <a target="_blank">lkz</a></p>
    </div>
    <!-- //copyright -->
</section>

<!-- /login form -->
</body>
</html>
