<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Your Order</title>
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
    animation: fadeIn 1s ease-in-out;
}

.container {
    background-color: #fff;
    padding: 2rem;
    padding-top:150px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
    animation: slideIn 0.5s ease-in-out;
}

h2 {
    text-align: center;
    margin-bottom: 1.5rem;
    color: #333;
    animation: fadeInDown 1s ease-in-out;
}

.form-group {
    margin-bottom: 1rem;
}

label {
    display: block;
    margin-bottom: 0.5rem;
    color: #333;
}

input, select {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
    transition: border-color 0.3s;
}

input:focus, select:focus {
    border-color: #ff8a00;
    outline: none;
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
    transition: background-color 0.3s, transform 0.3s;
}

button:hover {
    background-color: #e52e71;
    transform: scale(1.05);
}

button:active {
    transform: scale(0.95);
}

.signup-container {
    text-align: center;
    margin-top: 1rem;
    color: #333;
}

/* Keyframes for animations */
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes slideIn {
    from {
        transform: translateY(20px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes fadeInDown {
    from {
        transform: translateY(-20px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}
</style>
</head>
<body>
  <div class="container">
    <h2>Place Order</h2>
  
    <form action="order" method="post">
     <input type="hidden" value="<%= (String) session.getAttribute("adminun") %>" name="raghv">
   
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone No.:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
         <div class="form-group">
            <label for="address">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
        </div>
        
        <div class="form-group">
            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>
        </div>
        
        <div class="form-group">
            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>
        </div>
        
        <div class="form-group">
            <label for="pincode">Pin Code:</label>
            <input type="text" id="pincode" name="pincode" required>
        </div>
        
        <div class="form-group">
            <label for="payment">Payment Type</label>
            <select id="payment" name="payment" required>
                <option value="noselect">....select....</option>
                <option value="COD">Cash On Delivery</option>
                 <option value="net">Net Baking</option>
                  <option value="upi">UPI</option>
                   <option value="cc">Credit Card</option>
                   <option value="dc">Debit Card</option>
            </select>
        </div>
        
        <button href="orderPlaced.jsp" type="submit">Confirm Order</button>
    </form>
   </div>

   <input type="hidden" id="orderStatus" value="<%= request.getAttribute("status") %>" >
   <script>
       var state = document.getElementById("orderStatus").value;
       if (state === "success") {
           alert("Thank you for shopping with us...");
       } else if (state === "fail") {
           alert("Order failed..");
       }
   </script>
</body>
</html>
