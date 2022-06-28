<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册页</title>
    <link rel="stylesheet" href="css/style2.css" type="text/css">
    <script type="text/javascript">
        function check()
        {
            var username=document.getElementById("userName").value;
            var password=document.getElementById("userPwd").value;
            if(username==''){
                alert("用户名不能为空");return false;
            }
            else if(password==''){
                alert("密码不能为空");return false;
            }
            else
            {
                return true;
            }
        }
    </script>
</head>
<body>
<div id="login-box">
    <h1>Login</h1>
    <form action="doregister.jsp",method='post'>
        <div class="input-box">
            <input type="text"  name="userName" id="userName"  placeholder="Usrname">
        </div>
        <div class="input-box">
            <input type="password" name="userPwd" id="userPwd" placeholder="Password">
        </div>
        <button type="submit"   onclick="return check()">注册</button>
    </form>
    <br>
    <br>
    <br>

</div>
</body>
</html>