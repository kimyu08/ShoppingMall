package kr.co.shop.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	//tb_product   
   private String pcode;
   private String pgroup;
   private String pname;
   private String photo;
   private String content;
   private int price;
   private String date;
   //tb_option
   private String opcode;
   private String color;
   private String size;
   private int stock;
   //첨부된 파일을 저장하기 위해
	  //1)스프링 파일 객체 멤버 변수 선언
	  //<input type='file' name='photoMF' size='50'>   
   private MultipartFile photoMF;

   
   public ProductDTO() {}

   public String getPcode() {
      return pcode;
   }

   public void setPcode(String pcode) {
      this.pcode = pcode;
   }

   public String getPgroup() {
      return pgroup;
   }

   public void setPgroup(String pgroup) {
      this.pgroup = pgroup;
   }

   public String getPname() {
      return pname;
   }

   public void setPname(String pname) {
      this.pname = pname;
   }

   public String getPhoto() {
      return photo;
   }

   public void setPhoto(String photo) {
      this.photo = photo;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public String getDate() {
      return date;
   }

   public void setDate(String date) {
      this.date = date;
   }

public String getOpcode() {
	return opcode;
}

public void setOpcode(String opcode) {
	this.opcode = opcode;
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

public int getStock() {
	return stock;
}

public void setStock(int stock) {
	this.stock = stock;
}

public MultipartFile getPhotoMF() {
	return photoMF;
}

public void setPhotoMF(MultipartFile photoMF) {
	this.photoMF = photoMF;
}


   
   
}