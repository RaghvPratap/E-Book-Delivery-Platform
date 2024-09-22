package com.net.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		PrintWriter obj=response.getWriter();
    		
    		Connection con=null;
    		PreparedStatement ps=null;
    		ResultSet rs=null;
    		RequestDispatcher rd=null;
    		
    		try {
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/summer","root","");
    			
    			ps=con.prepareStatement("select * from registration where username=? and password=?;");
    			ps.setString(1,request.getParameter("uname"));
    			ps.setString(2,request.getParameter("password"));
    			
    			
    			rs=ps.executeQuery();
    			HttpSession session=request.getSession();
    			
    			
    			if(rs.next()) {
    				
    				request.setAttribute("status","success");
    				
                    request.setAttribute("un",request.getParameter("uname"));
    				rd=request.getRequestDispatcher("index.jsp");
    			}else {
    				
    				request.setAttribute("status", "fail");
    				rd=request.getRequestDispatcher("index.jsp");
    			}
    			rd.forward(request, response);
    			
    		}catch(Exception e) {
    			obj.print("\n\n Error:"+e);
    			e.printStackTrace();
    		}
	}

}
