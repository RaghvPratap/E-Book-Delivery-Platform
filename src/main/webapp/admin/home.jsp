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
	/* Gradient background */
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}
.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
h1 {
	color: #333;
	text-align: center;
	padding: 20px;
}
.card {
	padding: 30px;
	border: 1px solid #ddd;
	border-radius: 8px;
	transition: transform 0.3s, box-shadow 0.3s;
}
.card-body {
	padding: 20px;
}
.top {
	padding-top: 30px;
}
.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}
.row {
	display: flex;
	flex-wrap: wrap;
}
.col-md-3 {
	flex: 0 0 25%;
	max-width: 25%;
	padding: 15px;
	box-sizing: border-box;
}
a {
	text-decoration: none;
	color: inherit;
}

/* New CSS Effects */
.card-body i {
	animation: bounce 2s infinite;
}

.card-body h4 {
	position: relative;
	animation: fadeIn 1.5s ease-in-out;
}

.card-body h4::after {
	content: '';
	position: absolute;
	left: 0;
	bottom: -10px;
	width: 100%;
	height: 2px;
	background-color: #333;
	animation: underline 1.5s ease-in-out;
}

@keyframes bounce {
	0%, 20%, 50%, 80%, 100% {
		transform: translateY(0);
	}
	40% {
		transform: translateY(-20px);
	}
	60% {
		transform: translateY(-10px);
	}
}

@keyframes fadeIn {
	from {
		opacity: 0;
	}
	to {
		opacity: 1;
	}
}

@keyframes underline {
	from {
		width: 0;
	}
	to {
		width: 100%;
	}
}
</style>
<%@include file="allCSS.jsp"%>
</head>
<body>
	<h1>Admin Home Page</h1>
	<%@include file="navbar.jsp"%>
	<div class="top">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			   <a href="addBooks.jsp"></a>
				<div class="card">
					<div class="card-body">
						<center>
							<i class="fa-solid fa-plus fa-3x"></i><br>
							<h4><a href="addBooks.jsp">Add Books</a></h4>
							-----------------
						</center>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<center>
							<i class="fa-solid fa-book fa-3x"></i><br>
							<h4><a href="../allBooks.jsp">All Books</a></h4>
							-----------------
						</center>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<center>
							<i class="fa-solid fa-cart-shopping fa-3x"></i><br>
							<h4><a href="adminOrders.jsp">Order</a></h4>
							-----------------
						</center>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<center>
							<i class="fa-solid fa-right-from-bracket fa-3x"></i><br>
							<h4><a href="adminlogin.jsp" onclick="return confirm('Are you sure you want to log out?')">Log Out</a></h4>

							-----------------
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	</div>
</body>
</html>
