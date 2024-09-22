package com.net.DAO;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BooksDAOImpl implements BooksDAO {
    
	
	
	

	private Connection con;
	
	public BooksDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addBooks(BookDetails b) {
		boolean f=false;
		try {
			String sql="insert into book(bname,author,genre,status,photo,price) values(?,?,?,?,?,?)";
		    PreparedStatement ps=con.prepareStatement(sql); 
		    ps.setString(1, b.getBname());
		    ps.setString(2, b.getAuthor());
		    ps.setString(3, b.getStatus());
		    ps.setString(4, b.getGenre());
		    ps.setString(5, b.getPhoto());
		    ps.setString(6, b.getPrice());
		    
		    int i=ps.executeUpdate();
		    if(i==1) {
		    	
		    	f=true;
		    }
		    
		} catch (Exception e) {
			
		}
		return false;
	}

	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		
		try {
			
			String sql="select * from book ";
			PreparedStatement ps=con.prepareStatement(sql);
			
					
		    ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				BookDetails b=new BookDetails();
				b.setBookid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setGenre(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setPrice(rs.getString(7));
				list.add(b);
			}
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public BookDetails getBookById(int id) {
		BookDetails b=null;
		try {
			String sql="select * from book where book_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				 b=new BookDetails();
				b.setBookid(rs.getInt(1));
				b.setBname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setGenre(rs.getString(4));
				b.setStatus(rs.getString(5));
				b.setPhoto(rs.getString(6));
				b.setPrice(rs.getString(7));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return b;
	}

	@Override
	public boolean updateEditBooks(BookDetails b) {
		boolean f=false;
		
		try {
			
			String sql="update book set bname=?,author=?,status=?,price=? where book_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, b.getBname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getStatus());
			ps.setString(4, b.getPrice());
			ps.setInt(5, b.getBookid());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
		  e.printStackTrace();
		}
		
		
		
		return f;
	}

	@Override
	public boolean deleteBooks(int id) {
	    boolean f=false;
		
	    		try {
					String sql="delete from book where book_id=?";
					PreparedStatement ps=con.prepareStatement(sql);
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

	@Override
	public List<BookDetails> getNewBook() {
	    List<BookDetails> list = new ArrayList<>();
	    BookDetails b = null;
	   
	    String gen = "Fiction";
	    String act = "active";
	    try {
	        String sql = "SELECT * FROM book WHERE genre=? and status=?";
	        String sql1 = "SELECT * FROM book where genre=?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1,gen);
	        ps.setString(2, act);
	        ResultSet rs = ps.executeQuery();
	      
		        
	        while (rs.next()) {
	        
	            b = new BookDetails();
	            b.setBookid(rs.getInt("book_id"));  // Assuming 'bookid' is the column name
	            b.setBname(rs.getString("bname"));  // Assuming 'bname' is the column name
	            b.setAuthor(rs.getString("author"));  // Assuming 'author' is the column name
	            b.setGenre(rs.getString("genre"));  // Assuming 'genre' is the column name
	            b.setStatus(rs.getString("status"));  // Assuming 'status' is the column name
	            b.setPhoto(rs.getString("photo"));  // Assuming 'photo' is the column name
	            b.setPrice(rs.getString("price"));  // Assuming 'price' is the column name
	            list.add(b);
	        }
	       
	        
	    } catch (SQLException e) {
	        e.printStackTrace();  // Consider logging this instead
	    }
	    
	    return list;
	}

	@Override
	public List<BookDetails> getRecentBook() {
		  List<BookDetails> list = new ArrayList<>();
		    BookDetails b = null;
		   
//		    String gen = "Fiction";
		    String act = "active";
		    try {
//		        String sql = "SELECT * FROM book WHERE and status=?";
		        String sql1 = "SELECT * FROM book where status=? ORDER BY book_id DESC";
		        PreparedStatement ps = con.prepareStatement(sql1);
//		        ps.setString(1,gen);
		        ps.setString(1, act);
		        ResultSet rs = ps.executeQuery();
		      
			       
		        while (rs.next()) {
		        
		            b = new BookDetails();
		            b.setBookid(rs.getInt("book_id"));  // Assuming 'bookid' is the column name
		            b.setBname(rs.getString("bname"));  // Assuming 'bname' is the column name
		            b.setAuthor(rs.getString("author"));  // Assuming 'author' is the column name
		            b.setGenre(rs.getString("genre"));  // Assuming 'genre' is the column name
		            b.setStatus(rs.getString("status"));  // Assuming 'status' is the column name
		            b.setPhoto(rs.getString("photo"));  // Assuming 'photo' is the column name
		            b.setPrice(rs.getString("price"));  // Assuming 'price' is the column name
		            list.add(b);
		        }
		       
		        
		    } catch (SQLException e) {
		        e.printStackTrace();  // Consider logging this instead
		    }
		    
		
		return list;
	}

	@Override
	public List<BookDetails> getOldBook() {
		
		List<BookDetails> list = new ArrayList<>();
	    BookDetails b = null;
	   
//	    String gen = "Fiction";
	    String act = "inactive";
	    try {
//	        String sql = "SELECT * FROM book WHERE and status=?";
	        String sql1 = "SELECT * FROM book where status=? ORDER BY book_id DESC";
	        PreparedStatement ps = con.prepareStatement(sql1);
//	        ps.setString(1,gen);
	        ps.setString(1, act);
	        ResultSet rs = ps.executeQuery();
	      
		        
	        while (rs.next() ) {
	        
	            b = new BookDetails();
	            b.setBookid(rs.getInt("book_id"));  // Assuming 'bookid' is the column name
	            b.setBname(rs.getString("bname"));  // Assuming 'bname' is the column name
	            b.setAuthor(rs.getString("author"));  // Assuming 'author' is the column name
	            b.setGenre(rs.getString("genre"));  // Assuming 'genre' is the column name
	            b.setStatus(rs.getString("status"));  // Assuming 'status' is the column name
	            b.setPhoto(rs.getString("photo"));  // Assuming 'photo' is the column name
	            b.setPrice(rs.getString("price"));  // Assuming 'price' is the column name
	            list.add(b);
	        }
	       
	        
	    } catch (SQLException e) {
	        e.printStackTrace();  // Consider logging this instead
	    }
	    
		
		
		return list;
	}

	@Override
	public List<BookDetails> getAllNewBook() {
		 List<BookDetails> list = new ArrayList<>();
		    BookDetails b = null;
		   
		    String gen = "Fiction";
		    String act = "active";
		    try {
		        String sql = "SELECT * FROM book WHERE genre=? and status=?";
		        String sql1 = "SELECT * FROM book where genre=?";
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setString(1,gen);
		        ps.setString(2, act);
		        ResultSet rs = ps.executeQuery();
		      
			        
		        while (rs.next()) {
		        
		            b = new BookDetails();
		            b.setBookid(rs.getInt("book_id"));  // Assuming 'bookid' is the column name
		            b.setBname(rs.getString("bname"));  // Assuming 'bname' is the column name
		            b.setAuthor(rs.getString("author"));  // Assuming 'author' is the column name
		            b.setGenre(rs.getString("genre"));  // Assuming 'genre' is the column name
		            b.setStatus(rs.getString("status"));  // Assuming 'status' is the column name
		            b.setPhoto(rs.getString("photo"));  // Assuming 'photo' is the column name
		            b.setPrice(rs.getString("price"));  // Assuming 'price' is the column name
		            list.add(b);
		        }
		       
		        
		    } catch (SQLException e) {
		        e.printStackTrace();  // Consider logging this instead
		    }
		    

		return list;
	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		List<BookDetails> list = new ArrayList<>();
	    BookDetails b = null;
	   
//	    String gen = "Fiction";
	    String act = "active";
	    try {
//	        String sql = "SELECT * FROM book WHERE and status=?";
	        String sql1 = "SELECT * FROM book where status=? ORDER BY book_id DESC";
	        PreparedStatement ps = con.prepareStatement(sql1);
//	        ps.setString(1,gen);
	        ps.setString(1, act);
	        ResultSet rs = ps.executeQuery();
	      
		       
	        while (rs.next()) {
	        
	            b = new BookDetails();
	            b.setBookid(rs.getInt("book_id"));  // Assuming 'bookid' is the column name
	            b.setBname(rs.getString("bname"));  // Assuming 'bname' is the column name
	            b.setAuthor(rs.getString("author"));  // Assuming 'author' is the column name
	            b.setGenre(rs.getString("genre"));  // Assuming 'genre' is the column name
	            b.setStatus(rs.getString("status"));  // Assuming 'status' is the column name
	            b.setPhoto(rs.getString("photo"));  // Assuming 'photo' is the column name
	            b.setPrice(rs.getString("price"));  // Assuming 'price' is the column name
	            list.add(b);
	        }
	       
	        
	    } catch (SQLException e) {
	        e.printStackTrace();  // Consider logging this instead
	    }
	    
	
	return list;

		
	}

	@Override
	public List<BookDetails> getAllOldBook() {
		List<BookDetails> list = new ArrayList<>();
	    BookDetails b = null;
	   
//	    String gen = "Fiction";
	    String act = "inactive";
	    try {
//	        String sql = "SELECT * FROM book WHERE and status=?";
	        String sql1 = "SELECT * FROM book where status=? ORDER BY book_id DESC";
	        PreparedStatement ps = con.prepareStatement(sql1);
//	        ps.setString(1,gen);
	        ps.setString(1, act);
	        ResultSet rs = ps.executeQuery();
	      
		        
	        while (rs.next() ) {
	        
	            b = new BookDetails();
	            b.setBookid(rs.getInt("book_id"));  // Assuming 'bookid' is the column name
	            b.setBname(rs.getString("bname"));  // Assuming 'bname' is the column name
	            b.setAuthor(rs.getString("author"));  // Assuming 'author' is the column name
	            b.setGenre(rs.getString("genre"));  // Assuming 'genre' is the column name
	            b.setStatus(rs.getString("status"));  // Assuming 'status' is the column name
	            b.setPhoto(rs.getString("photo"));  // Assuming 'photo' is the column name
	            b.setPrice(rs.getString("price"));  // Assuming 'price' is the column name
	            list.add(b);
	        }
	       
	        
	    } catch (SQLException e) {
	        e.printStackTrace();  // Consider logging this instead
	    }
	    
		
		
		return list;
		
	}

	
	
  
}
