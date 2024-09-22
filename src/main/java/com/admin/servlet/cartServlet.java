package com.admin.servlet;

import java.io.IOException;
import com.entity.BookDetails;
import com.entity.Cart;
import com.net.DAO.BooksDAOImpl;
import com.net.DAO.CartDAOImpl;
import com.net.connection.Connect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class cartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int bid = Integer.parseInt(req.getParameter("book_id"));
			String uname = req.getParameter("uname"); // Correctly use req to get parameters

			BooksDAOImpl dao = new BooksDAOImpl(Connect.getConnection());
			BookDetails b = dao.getBookById(bid);

			Cart c = new Cart();
			c.setBid(bid);
			c.setUname(uname); // Set the user name
			c.setBname(b.getBname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Integer.parseInt(b.getPrice())); // Ensure proper conversion
			c.setTotal(Integer.parseInt(b.getPrice())); // Assuming total equals price

			CartDAOImpl dao2 = new CartDAOImpl(Connect.getConnection());

			HttpSession session = req.getSession();
			boolean f = dao2.addCart(c);
			if (f) {
				session.setAttribute("addcart", "success");
			} else {
				session.setAttribute("addcart", "fail");
			} // Redirect back to the JSP page
			resp.sendRedirect("index.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
