package kr.co.shop.cart;

public class CartDTO {

	private String cartno;
	private String id;
	private String pname;
	private String photo;
	private String color;
	private String size;
	private String pcode;
	private String opcode;
	private int quantity;
	private int price;
	private int totalprice;
	private String date; 
	
	public CartDTO() {}
	
	public CartDTO(String cartno, String id, String opcode, int quantity, int price) {
		this.cartno=cartno;
		this.id=id;
		this.opcode=opcode;
		this.quantity=quantity;
		this.price=price;
	}

	public String getCartno() {
		return cartno;
	}

	public void setCartno(String cartno) {
		this.cartno = cartno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOpcode() {
		return opcode;
	}

	public void setOpcode(String opcode) {
		this.opcode = opcode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPname() {
		return pname;
	}

	public void setPanme(String pname) {
		this.pname = pname;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	
	
	
	
	
}
