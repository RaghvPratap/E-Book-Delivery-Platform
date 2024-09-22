<%@page import="com.net.connection.Connect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.net.DAO.BooksDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>


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
</style>
</head>
<body>

<div class="navbar">
    <a href="#home"><i class="fa-solid fa-house"></i> Home</a>
    <a href="#news">News</a>
    <a href="#contact"><i class="fa-solid fa-gear"></i> Contact</a>
    <a href="#about">About</a>
</div>

<h3>Welcome Admin</h3>

<table class="table">
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Image</th>
            <th scope="col">Book Name</th>
            <th scope="col">Author Name</th>
            <th scope="col">Price</th>
            <th scope="col">Genre</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
            BooksDAOImpl dao = new BooksDAOImpl(Connect.getConnection());
            List<BookDetails> list = dao.getAllBooks();
            for (BookDetails b : list) {
        %>
        <tr>
            <th scope="row"><%= b.getBookid() %></th>
           <td><img src="./uploads/<%=b.getPhoto() %>" style="width:50px;height:50px;"></td>
             <td><%= b.getBname() %></td>
            <td><%= b.getAuthor() %></td>
            <td><%= b.getPrice() %></td>
            <td><%= b.getGenre() %></td>
            <td><%= b.getStatus() %></td>
            <td>
                <a href="admin/editBook.jsp?id=<%= b.getBookid() %>" class="btn btn-primary">Edit</a>
                <a href="./delete?id=<%=b.getBookid()%>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>
    </tbody>
</table>
</body>
</html>
