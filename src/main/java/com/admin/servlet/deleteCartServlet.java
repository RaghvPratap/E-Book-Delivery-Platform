package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.net.DAO.BooksDAOImpl;
import com.net.DAO.CartDAOImpl;
import com.net.connection.Connect;

@WebServlet("/deleteCart")
public class deleteCartServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            int id = Integer.parseInt(request.getParameter("id"));
	            CartDAOImpl dao = new CartDAOImpl(Connect.getConnection());
	            boolean f = dao.deletecart(id);
	            
	            response.sendRedirect("cart.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

}