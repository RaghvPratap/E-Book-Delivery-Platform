package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import com.entity.BookDetails;
import com.net.connection.*;
import com.net.DAO.BooksDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("aname");
			String price = req.getParameter("price");
			String genre = req.getParameter("genre");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String filename = part.getSubmittedFileName();

			BookDetails b = new BookDetails(bookName, author, price, genre, status, filename);
			BooksDAOImpl dao = new BooksDAOImpl(Connect.getConnection());

			boolean f = dao.addBooks(b);
			String path = getServletContext().getRealPath("") + "uploads";
			File fle = new File(path);

			
			part.write(path + File.separator + filename);

			
			if (f) {
				


				session.setAttribute("status", "Success");

			} else {
				session.setAttribute("status", "Failed");
			}
			resp.sendRedirect("admin/addBooks.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
