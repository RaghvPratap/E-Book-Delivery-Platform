<%@page import="com.entity.bookorder"%>
<%@page import="java.util.List"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.net.DAO.bookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME ADMIN</title>

</head>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(135deg, #ff8a00, #e52e71);
}

.navbar {
	overflow: hidden;
	background-color: white;
}

.navbar a {
	float: left;
	display: block;
	color: #333;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #ddd;
	color: black;
}

h3 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	background-color: white;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #ddd;
}

.edit {
	color: blue;
	text-decoration: none;
}

.edit:hover {
	text-decoration: underline;
}
</style>
<body>

	<div class="navbar">
		<a href="#home"><i class="fa-solid fa-house"></i> Home</a> <a
			href="#news">News</a> <a href="#contact"><i
			class="fa-solid fa-gear"></i> Contact</a> <a href="#about">About</a>
	</div>

	<h1>
		<center>All Users Orders</center>
	</h1>
<body>
	
	
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No.</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody >
		<%
		 bookOrderImpl dao=new bookOrderImpl(Connect.getConnection());
		List<bookorder> blist=dao.getBook();
		for(bookorder b:blist){
		%>
		<tr>
				<th scope="row"><%=b.getOrder_id() %></th>
				<th><%=b.getUsername() %></th>
				<th><%=b.getEmail() %></th>
				<th><%=b.getFullAddress()%></th>
				<th><%=b.getPhone()%></th>
				<th><%=b.getBookname()%></th>
				<th><%=b.getAuthor() %></th>
				<th><%=b.getPrice() %></th>
				<th><%=b.getPayment() %></th>
			</tr>
			<%
			}
			%>
		
		
		
		</tbody>
	</table>
	
</body>
</html>
