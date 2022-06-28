<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<head>
    <title>登录验证</title>
</head>
<body>
<% String name=request.getParameter("userName").toString();
    String passwd=request.getParameter("userPwd").toString();


        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/jsptest?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8";
        String user="root";
        String password="111111";
        Connection conn=DriverManager.getConnection(url,user,password);
        String sql="select * from tb_user where userName = '" + name + "' and userPwd = '" + passwd + "'";
        PreparedStatement ps=conn.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();

        if(name==null){
            out.println("<script language='javascript'>alert('用户名不能为空，请重新输入');window.location.href='login.jsp';</script>");
        }
        if(passwd==null)
        {
            out.println("<script language='javascript'>alert('密码不能为空，请重新输入');window.location.href='login.jsp';</script>");
        }
        if(rs.next())
        {
            out.println("<script language='javascript'>alert('登录成功！');</script>");
            request.setAttribute("userName",name);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }
        else {
            out.println("<script language='javascript'>alert('登录失败,请重试');window.location.href='login.jsp';</script>");
        }
        ps.close();
        conn.close();


%>
<br>
<a href="login.jsp">返回</a>
</body>
</html>