package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.bookorder;
import com.net.DAO.CartDAO;
import com.net.DAO.CartDAOImpl;
import com.net.DAO.bookOrder;
import com.net.DAO.bookOrderImpl;

import com.net.connection.Connect;

@WebServlet("/order")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("pincode");
			String payment = request.getParameter("payment");
			String uname=request.getParameter("raghv");
			
			String fulladd=address+","+city+","+state+","+pincode;
			
			
			
			CartDAOImpl dao=new CartDAOImpl(Connect.getConnection());
			
			List<Cart> list=dao.getBookByUser(request.getParameter("raghv"));
			bookOrderImpl dao2=new bookOrderImpl(Connect.getConnection());
			bookorder o=null;
			int i=dao2.getOrderNo();
			ArrayList<bookorder> ordlist=new ArrayList<bookorder>();
			for(Cart c:list) {
				o=new bookorder();
				o.setOrder_id("00"+i);
				o.setUsername(name);
				o.setEmail(email);
				o.setPhone(phone);
				o.setBookname(c.getBname());
				o.setFullAddress(fulladd);
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice());
				o.setPayment(payment);
				o.setPincode(pincode);
				o.setUname(uname);
				
				ordlist.add(o);
				i++;
			}
			if("noselect".equals(payment)) {
				response.sendRedirect("cart.jsp");
			}else {
			boolean f=	dao2.saveOrder(ordlist);
			if(f) {
				response.sendRedirect("orderPlaced.jsp");
			}else {
				System.out.print("Order fail");
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}