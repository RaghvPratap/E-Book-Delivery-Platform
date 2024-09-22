<%@page import="com.net.DAO.adminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    background: linear-gradient(to right, #ff7e5f, #feb47b);
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    text-align: center;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.container:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

button {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s;
}

button:hover {
    background-color: #45a049;
    transform: scale(1.05);
}

button:active {
    transform: scale(0.95);
}
</style>
</head>
<body>
<div class="container">
    <h1>Admin Login</h1>
    <jsp:useBean id="obj" class="com.net.Bean.adminBean"></jsp:useBean>
    <jsp:setProperty property="*" name="obj"/>
    <%
        int status = adminDAO.Login(obj);
        if(status > 0) {
            session.setAttribute("adminun", obj.getUname());
            out.print("<script>alert('Login Success....');" + 
                      "window.open('home.jsp','_self');</script>");
        } else {
            out.print("<script>alert('Login Failed....');" + 
                      "window.open('adminlogin.jsp','_self');</script>");
        }
    %>
</div>
</body>
</html>
