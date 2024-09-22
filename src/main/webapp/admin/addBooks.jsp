<% if (session.getAttribute("adminun") == null) {
    response.sendRedirect("adminlogin.jsp");
} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>
<%@include file="allCSS.jsp" %>
<style type="text/css">
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #ff8a00, #e52e71);
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
}
.navbar {
    width: 100%;
    background-color: #333;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    position: fixed;
    top: 0;
    z-index: 1000;
    display: flex;
    align-items: center;
    padding: 0 20px;
    box-sizing: border-box;
}
.navbar a {
    color: #f2f2f2;
    text-align: center;
    padding: 16px 20px;
    text-decoration: none;
    font-size: 1rem;
}
.navbar .search-container {
    display: flex;
    align-items: center;
    margin-left: auto;
    top:10px;
}
.navbar input[type="text"] {
    padding: 8px;
    margin-right: 10px;
    font-size: 1rem;
    border: none;
    border-radius: 4px;
}
.navbar button {
    padding: 8px 16px;
    background-color: #ff8a00;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    box-sizing:border-box;
    width: 125px;
    height: 50px;
    margin-left:5px;
}
.navbar button:hover {
    background-color: #e52e71;
}
.container {
    background-color: #fff;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    margin-top: 100px;
}
h2 {
    text-align: center;
    margin-bottom: 1.5rem;
}
.form-group {
    margin-bottom: 1rem;
}
label {
    display: block;
    margin-bottom: 0.5rem;
}
input, select {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}
button {
    width: 100%;
    padding: 0.75rem;
    background-color: #ff8a00;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor:pointer;
    font-size: 1rem;
}
.signup-container {
    text-align: center;
    margin-top: 1rem;
}
.raghu {
    margin-top: 5px;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container">
    <h2>Add Books</h2>
    <form action="../add_books" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="bname">Book Name:</label>
            <input type="text" id="bname" name="bname">
        </div>
        <div class="form-group">
            <label for="aname">Author Name:</label>
            <input type="text" id="aname" name="aname">
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" id="price" name="price">
        </div>
        <div class="form-group">
            <label for="genre">Genre:</label>
            <select id="genre" name="genre">
                <option selected>--select--</option>
                <option value="Fiction">Fiction</option>
                <option value="Fiction">New</option>
                <option value="Non-Fiction">Non-Fiction</option>
                <option value="Mystery">Mystery</option>
                <option value="Fantasy">Fantasy</option>
                <option value="Others">Others</option>
            </select>
        </div>
        <div class="form-group">
            <label for="availability">Status:</label>
            <select id="availability" name="status">
                <option selected>--select--</option>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleFormControlFile1">Upload Photo</label>
            <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
        </div>
        <button type="submit">Submit</button>
    </form>
    <div class="signup-container">
        <p>Not a member? <a href="#signup">Sign up now</a></p>
    </div>
</div>
<input type="hidden" id="state" value="<%= session.getAttribute("status") %>">
<script>
    const state = document.getElementById("state").value;
    if (state === "success") {
        alert("Book Added Successfully");
    } else if (state === "failed") {
        alert("Failed, Something went wrong");
    }
</script>
</body>
</html>
