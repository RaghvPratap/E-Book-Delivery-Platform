<nav class="navbar navbar-expand-lg navbar-light bg-light">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item"><a href="index.jsp" class="nav-link active"
				aria-current="page" ><i class="fa-solid fa-house"></i>Home</a>
			</li>
			<li class="nav-item"><a class="nav-link active" href="cart.jsp">
			<i class="fa-solid fa-cart-shopping"></i>Go To Cart</a></li>
			<li class="nav-item dropdown"><a class="nav-link active"
				href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
				aria-expanded="false"> <i class="fa-solid fa-book"></i>Books
			</a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				  <li><a class="dropdown-item" onclick="location.href='newbook.jsp';">New Books</a></li>
                    <li><a class="dropdown-item" onclick="location.href='oldbook.jsp';">Old Books</a></li>
                    <li><a class="dropdown-item" onclick="location.href='recentbook.jsp';">Recent Books</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Previous Bought</a></li>
				</ul></li>
			<li class="nav-item"><a class="nav-link active" href="#"><i
					class="fa-regular fa-address-book"></i>Contact Us</a></li>
		</ul>
		<form class="form-inline d-flex ml-auto">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0 me-2"
				type="submit">Search</button>
		</form>
		<div class="d-flex">
			<button class="btn btn-outline-primary login-btn me-2" type="button">
				<a href="userlogin.jsp">Login</a>
			</button>
			<button class="btn btn-outline-secondary register-btn" type="button" onclick="confirmLogout()">Logout</button>

<script>
    function confirmLogout() {
        if (confirm('Are you sure you want to logout?')) {
            window.location.href = 'userlogin.jsp';
        }
    }
</script>
		</div>
	</div>
</nav>