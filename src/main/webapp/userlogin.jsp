<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #ff8a00, #e52e71);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #fff;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
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

input {
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
    cursor: pointer;
    font-size: 1rem;
}

button:hover {
    background-color: #e52e71;
}

.signup-container {
    text-align: center;
    margin-top: 1rem;
}

.signup-image-link {
    color: #ff8a00;
    text-decoration: none;
}

.signup-image-link:hover {
    text-decoration: underline;
}

</style>
</head>
<body>
  <div class="container">
    <h2>User Login Page</h2>
    <form action="userlog.jsp" method="post">
      <div class="form-group">
        <label for="uname">User Name:</label>
        <input type="text" id="uname" name="uname">
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password">
      </div>
      <button type="submit">Login</button>
      <div class="signup-container">
        <a href="userreg.jsp" class="signup-image-link">Create account for User</a>
      </div>
    </form>
  </div>
  
  <input type="hidden" id="state" value="<%=request.getAttribute("status")%>" >
  <script>
  if(state.value=="fail"){
    	alert("Bhaag yha se..")
  }
  </script>
</body>
</html>
