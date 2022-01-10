package kr.co.shop.cart;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.shop.product.ProductDTO;

@Controller
public class CartController {

	public CartController() {
		System.out.println("--CartController() 객체 생성");
	}
	
	
	@RequestMapping("/cart.do")
	public ModelAndView cartForm(HttpSession session, HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/cart/cartForm");
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;	//강제형변환으로 스트링으로 변경해줌.
		System.out.println(s_id);
		
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<CartDTO> list=sql.selectList("cart.readCart",s_id);		//mem.xml의 namespace가 mem이고 실행시킬 sql문의 id가 selectAll이므로 mem.selectAll
			for(int i=0;i<list.size(); i++) {
				CartDTO dto=list.get(i);
				System.out.print(dto.getCartno() + " ");
				System.out.print(dto.getPname() + " ");
				System.out.print(dto.getPhoto() + " ");
				System.out.print(dto.getColor() + " ");
				System.out.print(dto.getSize() + " ");
				System.out.print(dto.getPrice() + " ");
				System.out.print(dto.getTotalprice() + " ");
				System.out.println("");
			}//for end
			
			mav.addObject("dto", list);
			}catch (Exception e) {
			System.out.println("cart.do실패: "+ e);
			}//end
		return mav;
	}//cartForm() end
	
	@RequestMapping(value="/addCart.do",method = RequestMethod.POST)
	public ModelAndView addCart(HttpSession session, HttpServletRequest req, CartDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/cart.do");
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;	//강제형변환으로 스트링으로 변경해줌.
		System.out.println(s_id);
		dto.setId(s_id);
		System.out.println(dto.getPcode());
		System.out.println(dto.getPrice());
		System.out.println("색상"+dto.getColor());
		System.out.println(dto.getSize());
		System.out.println(dto.getQuantity());
		
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			sql.insert("cart.insertCart",dto);		//mem.xml의 namespace가 mem이고 실행시킬 sql문의 id가 selectAll이므로 mem.selectAll
			
			}catch (Exception e) {
			System.out.println("실패: "+ e);
			}//end
		return mav;
	}//addCart.do end
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(HttpServletRequest req, HttpServletResponse resp, String cartno) {
	
		System.out.println("=====================");
		System.out.println("카트삭제 번호:"+cartno);
		System.out.println("=====================");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			int result=sql.delete("cart.deleteCart", cartno);
			
			PrintWriter out=resp.getWriter();
			out.print("<script>");
			out.print("window.onload=function(){location.href='cart.do';}");
			out.print("</script>");
			out.flush();
		} catch (IOException e) {
			System.out.println("장바구니삭제 실패: "+e);
		}
		return null;
	}//deleteCart.do end
 
}
