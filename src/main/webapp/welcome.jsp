<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <% out.print("Hello"+request.getAttribute("un")); %>
  <h1>Welcome to homepage</h1>
   <% out.print(request.getAttribute("status")); %>
  
</body>
</html>