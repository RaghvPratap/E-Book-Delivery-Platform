<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Placed</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #ff8a00, #e52e71);
        color: white; /* Changed text color to white */
        text-align: center;
        padding: 50px;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        animation: fadeIn 1s ease-in-out;
    }
    h1 {
        color: #ffffff; /* Changed text color to white */
        margin-bottom: 20px;
        animation: fadeInDown 1s ease-in-out;
    }
    a {
        text-decoration: none;
        background-color: white; /* Changed button color to white */
        color: #ff8a00; /* Changed text color to orange */
        padding: 10px 20px;
        margin: 10px;
        border-radius: 5px;
        display: inline-block;
        font-size: 18px;
        transition: background-color 0.3s, color 0.3s, transform 0.3s;
    }
    a:hover {
        background-color: #f2f2f2; /* Slightly darker white for hover */
        color: #e52e71; /* Darker orange for hover */
        transform: scale(1.05);
    }
    a:active {
        transform: scale(0.95);
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
    <div>
        <h1>Your Order has been placed successfully....</h1>
        <h1>Thank you for shopping with us....</h1>
        <a href="index.jsp" class="btn-btn-primary mt-3">Home</a>
        <a href="viewOrder.jsp" class="btn-btn-primary mt-3">View Order</a>
    </div>
</body>
</html>
