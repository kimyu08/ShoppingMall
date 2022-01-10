package kr.co.shop.member;

public class MemDTO {
	private String id ;
	private String pw ;
	private String mname;
	private String phone ;
	private String email ;
	private String zipcode ;
	private String address1 ;
	private String address2 ;
	private String rights ;
	private String date ;
	private int age;
	
	//기본생성자
	public MemDTO() {}
	
	public MemDTO(String id, String pw, String mname, String phone, String email, String zipcode, String address1, String address2) {
		this.id=id;
		this.pw=pw;
		this.mname=mname;
		this.phone=phone;
		this.email=email;
		this.zipcode=zipcode;
		this.address1=address1;
		this.address2=address2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getRights() {
		return rights;
	}

	public void setRights(String rights) {
		this.rights = rights;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
}
