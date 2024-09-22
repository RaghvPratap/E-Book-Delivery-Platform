package com.entity;

public class bookorder {

    private String username;
    private String phone;
    private String payment;
    private String email;
    private String fullAddress;
    private String author;
    private String pincode;
    private int price;
    private String bookname;
    private String id;
    private String order_id;
    private String uname;

    public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	// Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String i) {
        this.order_id = i;
    }

    // Overriding toString method for better debug output
    @Override
    public String toString() {
        return "bookorder{" +
                "username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", payment='" + payment + '\'' +
                ", email='" + email + '\'' +
                ", fullAddress='" + fullAddress + '\'' +
                ", author='" + author + '\'' +
                ", pincode='" + pincode + '\'' +
                ", price=" + price +
                ", bookname='" + bookname + '\'' +
                ", id='" + id + '\'' +
                ", order_id='" + order_id + '\'' +
                '}';
    }
}
