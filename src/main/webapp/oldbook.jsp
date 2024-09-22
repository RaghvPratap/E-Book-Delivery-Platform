<%@page import="com.net.connection.Connect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.net.DAO.BooksDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Bookstore</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

header {
    background: linear-gradient(90deg, #ff8a00, #e52e71);
    color: #fff;
    padding: 1rem 0;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

nav ul {
    list-style: none;
    padding: 0;
    display: flex;
    justify-content: center;
    gap: 1rem;
}

nav ul li {
    margin: 0;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s;
}

nav ul li a:hover {
    color: #1e72b7;
}

main {
    padding: 2rem;
}

.book-list {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem; /* Reduced gap */
    justify-content: center;
}

.book-item {
    background-color: #fff;
    align-items: center;
    padding: 1.5rem;
    border: 5px solid #ef5807;
    border-radius: 8px;
    width: calc(33.333% - 2rem);
    box-sizing: border-box;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s;
    flex: 1 1 250px;
    margin: 5px;
}

.book-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.add-cart-btn button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 15px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.add-cart-btn button:hover {
    background-color: #0056b3;
}

footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 1rem 0;
    position: fixed;
    width: 100%;
    bottom: 0;
}

.top {
    padding-top: 80px;
    padding-bottom: 50px;
    display: flex;
    gap: 3rem; /* Reduced gap */
    justify-content: center;
    flex-wrap: wrap;
}

.one, .two {
    padding-top: 80px;
    padding-bottom: 50px;
    display: flex;
    gap: 3rem; /* Reduced gap */
    justify-content: center;
    flex-wrap: wrap;
}

.raghu {
    padding-bottom: 5px;
}

.center-text {
    text-align: center;
}
</style>
<%@include file="all_component/allCSS.jsp" %>
</head>
<body>

<header>
    <h1>Welcome to Our Online Bookstore</h1>
    <%@include file="all_component/navbar.jsp" %>
</header>
<main>
    <h1 class="center-text">New Books</h1>
    <section class="book-list">
        <div class="top">
             <%
    BooksDAOImpl dao = new BooksDAOImpl(Connect.getConnection());
    List<BookDetails> list = dao.getOldBook();
   
    for (BookDetails b : list) {
       %>
       
    <article class="book-item text-center">
        <img src="<%= "./uploads/" + b.getPhoto() %>" alt="Book Image" style="width: 250px; height: 250px;">
        <h2><%= b.getBname() %></h2>
        <p>Author: <%= b.getAuthor() %></p>
        <p>Price: <%= b.getPrice() %></p>
        <div class="add-cart-btn raghu">
            <button>Add to Cart</button>
        </div>
        <div class="add-cart-btn">
            <button>View All</button>
        </div>
    </article>
<%
    }
   
    
%>
        </div>
    </section>
    
    
    
    
        
</main>

<footer>
    <p>© 2024 Online Bookstore. All rights reserved.</p>
</footer>

</body>
</html>
