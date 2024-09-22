package com.net.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet("/AdminReg")
public class AdminReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter obj=response.getWriter();
		obj.print("Hello in Register Servlet..." );
		Connection con=null;
		PreparedStatement ps=null;
		RequestDispatcher rd=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
			
			ps=con.prepareStatement("insert into admin values(?,?,?,?,?)");
			ps.setString(1,request.getParameter("name"));
			ps.setInt(2,Integer.parseInt(request.getParameter("adminID")));
			ps.setString(3,request.getParameter("email"));
			ps.setString(4,request.getParameter("uname"));
			ps.setString(5,request.getParameter("password"));
			
			
			int rc=ps.executeUpdate();
			rd=request.getRequestDispatcher("adminreg.jsp");
			if(rc>0) {
				request.setAttribute("status","success");
			}else {
				
				request.setAttribute("status", "fail");
			}
			rd.forward(request, response);
			
		}catch(Exception e) {
			obj.print("\n\n Error:"+e);
			e.printStackTrace();
		}
	}

}
