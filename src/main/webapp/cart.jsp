<%@page import="com.entity.Cart"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.net.DAO.BooksDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="com.net.DAO.CartDAOImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Book List</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
.button-container {
    text-align: center; /* Center the button container */
    margin-top: 20px; /* Add some space above the button */
}
button {
    background-color:white; /* Blue background */
    color: orange; /* White text */
    padding: 10px 20px; /* Some padding */
    border: none; /* Remove borders */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer/hand icon */
    text-align: center; /* Center the text inside the button */
    display: inline-block; /* Make it behave like a button */
    font-size: 16px; /* Increase font size */
    transition: background-color 0.3s ease; /* Smooth transition for hover effect */
}
button:hover {
    background-color: #3977e0; /* Darker blue on hover */
}
</style>
</head>
<body>

<div class="navbar">
    <a href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <a href="#news">News</a>
    <a href="#contact"><i class="fa-solid fa-gear"></i> Settings</a>
    <a href="#about">About</a>
</div>

<h3>Cart Items</h3>

<table class="table">
    <thead>
        <tr>
            <th scope="col">Book Name</th>
            <th scope="col">Author Name</th>
            <th scope="col">Price</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
    
   <%
    // Retrieve the username from the session
    String uname = (String) session.getAttribute("adminun"); // Cast to String

    // Instantiate the DAO and call the method
    CartDAOImpl dao = new CartDAOImpl(Connect.getConnection());
    List<Cart> list = dao.getBookByUser(uname);
    int total = 0;
    for(Cart c : list){
        total += c.getTotal();
    %>

       <tr>
       <th scope="row"><%=c.getBname() %></th>
       <td><%=c.getAuthor()%></td>       
       <td><%=c.getPrice()%></td>
       <td>
       <a href="./deleteCart?id=<%=c.getCid() %>" class="btn btn-sm btn-danger">Delete</a> 
       </td>
       
       </tr>
    <%
    }
    %>
    <tr>
    <td>Total Price</td>
    <td></td>
    <td><%=total %></td>
    <td></td>
    </tr>
       
    </tbody>
</table>

<!-- Centered Place Order Button -->
<div class="button-container">
    <button onclick="window.location.href='order.jsp';">Place Order</button>
</div>

</body>
</html>
