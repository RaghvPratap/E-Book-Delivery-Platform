package com.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.bookorder;

public class bookOrderImpl implements bookOrder {

    private Connection con = null;

    public bookOrderImpl(Connection con) {
        super();
        this.con = con;
    }

    @Override
    public int getOrderNo() {
        int i = 1;
        try {
            String sql = "SELECT * FROM booksorders";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public boolean saveOrder(List<bookorder> blist) {
        boolean f = false;
        try {
           
            String sql = "INSERT INTO booksorders(uname, email, address, bookname, pincode, author, price, payment, order_id,unam) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            
         
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sql);

          
            for (bookorder b : blist) {
                ps.setString(1, b.getUsername());
                ps.setString(2, b.getEmail());
                ps.setString(3, b.getFullAddress());
                ps.setString(4, b.getBookname());
                ps.setString(5, b.getPincode());
                ps.setString(6, b.getAuthor());
                ps.setInt(7, b.getPrice());
                ps.setString(8, b.getPayment());
                ps.setString(9, b.getOrder_id());
                ps.setString(10,b.getUname());
                ps.addBatch();
            }

           
            int[] count = ps.executeBatch();
            
            
            con.commit();
            f = true;
        } catch (Exception e) {
            try {
               
                if (con != null) {
                    con.rollback();
                }
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
              
                if (con != null) {
                    con.setAutoCommit(true);
                }
            } catch (Exception finalEx) {
                finalEx.printStackTrace();
            }
        }
        return f;
    }

	public List<bookorder> getBook(String uname) {
		List<bookorder> list=new ArrayList<bookorder>();
		bookorder o=null;
		
		
		
		
		try {
			String sql="select uname,email,address,bookname,pincode,author,price,payment,order_id from booksorders where unam=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, uname);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new bookorder();
				o.setUsername(rs.getString(1));
				o.setEmail(rs.getString(2));
				o.setFullAddress(rs.getString(3));
				o.setBookname(rs.getString(4));
				o.setPincode(rs.getString(5));
				o.setAuthor(rs.getString(6));
				o.setPrice(rs.getInt(7));
				o.setPayment(rs.getString(8));
				o.setOrder_id(rs.getString(9));
				list.add(o);
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print(list);
		return list;
	}

	@Override
	public List<bookorder> getBook() {
		List<bookorder> list=new ArrayList<bookorder>();
		bookorder o=null;
		
		
		
		
		try {
			String sql="select uname,email,address,bookname,pincode,author,price,payment,order_id from booksorders ";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new bookorder();
				o.setUsername(rs.getString(1));
				o.setEmail(rs.getString(2));
				o.setFullAddress(rs.getString(3));
				o.setBookname(rs.getString(4));
				o.setPincode(rs.getString(5));
				o.setAuthor(rs.getString(6));
				o.setPrice(rs.getInt(7));
				o.setPayment(rs.getString(8));
				o.setOrder_id(rs.getString(9));
				list.add(o);
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	

    }

