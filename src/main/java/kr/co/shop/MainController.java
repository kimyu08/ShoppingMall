package kr.co.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	public MainController() {
		System.out.println("--MainController() 객체 생성");
	} 
	
	//http://localhost:8080/home.do
	
	@RequestMapping("home.do")
	public String Home() {
		return "home";
	}
	
}
