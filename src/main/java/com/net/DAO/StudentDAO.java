package com.net.DAO;
import java.sql.*;

import com.net.Bean.StudentBean;
import com.net.connection.Connect;

public class StudentDAO {
  static Connection con = null;
  static PreparedStatement ps = null;
  static int rowCount = 0;
  static ResultSet rs = null;
  
  public static int Register(StudentBean sb) {
	  try {
		  con = Connect.getConnection();
		String sql = "insert into registration values(?,?,?,?,?);";
		ps = con.prepareStatement(sql);
		
		ps.setString(1, sb.getName());
		ps.setInt(2, sb.getAge());
		ps.setString(3, sb.getEmail());
		ps.setString(4, sb.getUname());
		ps.setString(5, sb.getPassword());
		
    	rowCount = ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return rowCount;
  }

  public static int Login(StudentBean sb) {
	  try {
		  con = Connect.getConnection();
String sql = "select * from registration where username=? and password=?;";
		ps = con.prepareStatement(sql);
		
		ps.setString(1, sb.getUname());
		ps.setString(2, sb.getPassword());
		
    	rs = ps.executeQuery();
    	
    	if(rs.next())
    		 rowCount = 1;
    	else
    		rowCount = 0;
    	
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return rowCount;
  }

  public static ResultSet Show(StudentBean sb) {
	  try {
		  con = Connect.getConnection();
        String sql = "select * from registration";
		ps = con.prepareStatement(sql);
//		ps.setString(1, sb.getUname());
		
    	rs = ps.executeQuery();    	
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return rs;
  }



  
}
