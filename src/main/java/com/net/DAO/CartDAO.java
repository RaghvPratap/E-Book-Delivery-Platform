package com.net.DAO;


import java.util.List;

import com.entity.*;

public interface CartDAO {
 
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(String uname);
	 public boolean deletecart(int id);	
 
}
