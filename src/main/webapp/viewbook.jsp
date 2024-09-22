<%@page import="com.entity.BookDetails"%>
<%@page import="com.net.connection.Connect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.net.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #ff8a00, #e52e71);
    margin: 0;
    padding: 0;
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
    margin: 20px 0;
}
.container {
    width: 90%;
    margin: 20px auto;
    background-color: #fff;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.row {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}
.col-md-6 {
    flex: 1;
    min-width: 300px;
    text-align: center;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
}
.col-md-6 img {
    width: 150px;
    height: 200px;
    margin-bottom: 20px;
}
.col-md-6 h3 {
    margin: 10px 0;
}
.icon-container {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}
.icon-container .icon {
    text-align: center;
}
.icon-container i {
    font-size: 3rem;
    margin-bottom: 10px;
    color: #333;
}
.buttons-container {
    text-align: center;
    margin-top: 30px;
}
.btn {
    background-color: #ff8a00;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    margin: 5px;
    transition: background-color 0.3s ease;
}
.btn:hover {
    background-color: #e52e71;
}
</style>
</head>
<body>

<div class="navbar">
    <a href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <a href="#news"></a>
    <a href="#contact"><i class="fa-solid fa-gear"></i> Settings</a>
    <a href="#about">About</a>
</div>

<h3>Welcome User</h3>

<%
int id = Integer.parseInt(request.getParameter("book_id"));
BooksDAOImpl dao = new BooksDAOImpl(Connect.getConnection());
BookDetails b = dao.getBookById(id);
%>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <img src="./uploads/<%=b.getPhoto() %>" alt="Book Image">
            <h3>Book Name: <span class="text-success"><%=b.getBname() %></span></h3>
            <h3>Author Name: <span class="text-success"><%=b.getAuthor() %></span></h3>
            <h3>Genre: <span class="text-success"><%=b.getGenre() %></span></h3>
        </div>
        
        <div class="icon-container">
            <div class="icon">
                <i class="fa-solid fa-indian-rupee-sign"></i>
                <p>Cash on Delivery</p>
            </div>
            <div class="icon">
                <i class="fa-solid fa-right-left"></i>
                <p>Return</p>
            </div>
           
        </div>

        <div class="buttons-container">
            <button class="btn">Buy Now</button>
            <button class="btn">Add to Cart</button>
            <button class="btn">View</button>
        </div>
    </div>
</div>

</body>
</html>
