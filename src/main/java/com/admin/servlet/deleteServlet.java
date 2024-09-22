package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.net.DAO.BooksDAOImpl;
import com.net.connection.Connect;

@WebServlet("/delete")
public class deleteServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BooksDAOImpl dao = new BooksDAOImpl(Connect.getConnection());
            boolean f = dao.deleteBooks(id);

            HttpSession session = request.getSession();
            if (f) {
                session.setAttribute("status", "Book deleted successfully.");
            } else {
                session.setAttribute("status", "Failed to delete book.");
            }

            response.sendRedirect("allBooks.jsp");

        }  catch (Exception e) {
            e.printStackTrace();
        }
    }
}
