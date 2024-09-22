
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#"><i class="fa-solid fa-gear"></i> Settings</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-book"></i> Books</a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">New Books</a></li>
                    <li><a class="dropdown-item" href="#">Old Books</a></li>
                    <li><a class="dropdown-item" href="#">Recent Books</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Previous Bought</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#"><i class="fa-regular fa-address-book"></i> Contact Us</a>
            </li>
        </ul>
        <div class="d-flex ml-auto align-items-center">
            <form class="form d-flex">
                <input class="form-control mr-sm-1 raghu" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-1 my-sm-0 me-1 raghu" type="submit">Search</button>
            </form>
            <button class="btn btn-outline-primary login-btn my-1 my-sm-0 me-1 raghu" type="button">
                <a href="adminlog.jsp">Login</a>
            </button>
            <button class="btn btn-outline-secondary register-btn my-1 my-sm-0 me-1 raghu" type="button">
                <a href="adminreg.jsp">Register</a>
            </button>
        </div>
    </div>
</nav>
