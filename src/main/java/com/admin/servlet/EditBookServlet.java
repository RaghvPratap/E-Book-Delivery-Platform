package com.admin.servlet;

import java.io.IOException;

import com.entity.BookDetails;
import com.net.DAO.BooksDAOImpl;
import com.net.connection.Connect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/editbooks")
public class EditBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("aname");
			String price = req.getParameter("price");
		 
			String status = req.getParameter("status");
			
			BookDetails b=new BookDetails();
			b.setBookid(id);
			b.setBname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			
			BooksDAOImpl dao = new BooksDAOImpl(Connect.getConnection());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("status", "success");
			}else {
				session.setAttribute("status", "fail");
					
			}
			resp.sendRedirect("allBooks.jsp");
		} catch (Exception e) {
		  e.printStackTrace();	
		
		}
		
	}

}
