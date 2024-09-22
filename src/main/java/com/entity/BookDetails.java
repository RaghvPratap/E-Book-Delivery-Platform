package com.entity;

public class BookDetails {
  private int bookid;
  private String bname;
  private String author;
  private String price;
  private String status;
  private String genre;
  private String photo;

  
  
  public BookDetails() {
	  super();
	
  }

  
  public BookDetails(String bname, String author, String price, String status, String genre, String photo) {
	super();
	this.bname = bname;
	this.author = author;
	this.price = price;
	this.status = status;
	this.genre = genre;
	this.photo = photo;
}




public int getBookid() {
	return bookid;
}


public void setBookid(int bookid) {
	this.bookid = bookid;
}


public String getBname() {
	return bname;
}


public void setBname(String bname) {
	this.bname = bname;
}


public String getAuthor() {
	return author;
}


public void setAuthor(String author) {
	this.author = author;
}


public String getPrice() {
	return price;
}


public void setPrice(String price) {
	this.price = price;
}


public String getStatus() {
	return status;
}


public void setStatus(String status) {
	this.status = status;
}


public String getGenre() {
	return genre;
}


public void setGenre(String genre) {
	this.genre = genre;
}


public String getPhoto() {
	return photo;
}


public void setPhoto(String photo) {
	this.photo = photo;
}
@Override
public String toString() {
	return "BookDetails [bookid=" + bookid + ", bname=" + bname + ", author=" + author + ", price=" + price
			+ ", status=" + status + ", genre=" + genre + ", photo=" + photo + "]";
}

}
