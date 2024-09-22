<%@page import="com.net.DAO.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User  Log</title>

</head>
<body>
 <jsp:useBean id="obj" class="com.net.Bean.StudentBean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj" />




	<%
	int status = StudentDAO.Login(obj);
	if (status > 0) {
		//	out.print("<br> Registration Success..."); 
		session.setAttribute("adminun", obj.getUname());
		out.print("<script> alert('Login Success....'); " + " window.open('index.jsp','_self')</script>");
	} else {
		//	out.print("<br> Registration Failed..."); 	 

		out.print("<script> alert('Login Failed....'); " + " window.open('userlogin.jsp','_self')</script>");
	}
	%>
</body>
</html>
