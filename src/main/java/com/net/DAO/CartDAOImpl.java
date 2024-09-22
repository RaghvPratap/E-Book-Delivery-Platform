package com.net.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;
public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
	  this.conn=conn;	
	}
	
	
	
	
	
	public boolean addCart(Cart c) {
		boolean f=false;
		try {
			String sql="insert into usercart(bid,uname,bname,author,price,total) values(?,?,?,?,?,?)"; 	
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setString(2, c.getUname());
			ps.setString(3, c.getBname());
			ps.setString(4, c.getAuthor());
			ps.setInt(5, c.getPrice());
			ps.setInt(6, c.getTotal());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	public boolean deletecart(int id) {
		 boolean f=false;
			
		try {
				String sql="delete from usercart where cid=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, id);
				int i=ps.executeUpdate();
				if(i==1) {
					f=true;
				}
			
			} catch (Exception e) {
				e.printStackTrace();
				
				
			}
	
	return f;
		
		
		
	}

 
	public List<Cart> getBookByUser(String uname) {
		List<Cart> list=new ArrayList<Cart>();
		int total=0;
		try {
			String sql="select * from usercart where uname=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, uname);
		    ResultSet rs=ps.executeQuery();
		    
		    while(rs.next()) {
		    	Cart c = new Cart();
		    	c.setCid(rs.getInt(1));
		    	c.setBid(rs.getInt(2));
		    	c.setUname(rs.getString(3));
		    	c.setBname(rs.getString(4));
		    	c.setAuthor(rs.getString(5));
		    	c.setPrice(rs.getInt(6));
		    	
		    	total=total+rs.getInt(7);
		    	c.setTotal(total);
		    	list.add(c);
		    }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}