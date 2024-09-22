package com.net.DAO;

import java.util.List;

import com.entity.bookorder;

public interface bookOrder {
	
	public int getOrderNo();
	public boolean saveOrder(List<bookorder> b);
	public   List<bookorder> getBook(String uname);
	public   List<bookorder> getBook();
}
