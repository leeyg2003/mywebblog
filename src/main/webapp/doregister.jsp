<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<%
    String username=new String(request.getParameter("userName"));
    String password=new String(request.getParameter("userPwd"));
    // 数据库连接字符串
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/jsptest?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8";
    // 数据库用户名
    String user = "root";
    // 数据库密码
    String psw ="111111";
    Connection conn=DriverManager.getConnection(url,user,psw); //创建连接
    PreparedStatement pStmt = conn.prepareStatement("select * from tb_user where userName = '" + username + "'");
    ResultSet rs = pStmt.executeQuery();
    if(username==null){
        out.println("<script language='javascript'>alert('用户名不能为空，请重新注册');window.location.href='register.jsp';</script>");
    }
    if(password==null){
        out.println("<script language='javascript'>alert('密码不能为空，请重新注册');window.location.href='register.jsp';</script>");
    }
    if(rs.next()) {
        out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='register.jsp';</script>");
    }
    else {
        String sql = "insert into tb_user(userName,userPwd) values('" + username + "','" + password + "')";
        Statement stmt = conn.createStatement();                     //获取statement对象
        stmt.executeUpdate(sql);                                   //执行添加用户的sql语句
        out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='login.jsp';</script>");
    }
%>
</body>
</html>
