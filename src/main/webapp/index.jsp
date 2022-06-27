<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
欢迎,<%=request.getAttribute("userName")%>
<a href="login.jsp">返回</a>
</body>
</html>
