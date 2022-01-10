package kr.co.shop.order;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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

import kr.co.shop.cart.CartDTO;
import kr.co.shop.member.MemDTO;

@Controller
public class OrderController {

	public OrderController() {
		System.out.println("--OderCheckController() 객체 생성");
	}
	
	@RequestMapping("/checkorder.do")
	public ModelAndView checkOrder(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("order/checkOrder");
		Object obs_id=session.getAttribute("s_id");
		String s_id=(String)obs_id;
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<OrderDTO> list=sql.selectList("order.checkOrder",s_id);
			mav.addObject("dto",list);
		} catch (Exception e) {
			System.out.println("checkOrder db실패: "+e);
		}
				
		return mav;
	}//checkOrder() end

	@RequestMapping(value="/addOrder.do", method = RequestMethod.POST)
	public ModelAndView addCartandOrder(HttpSession session, CartDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/order/orderForm");
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;	//강제형변환으로 스트링으로 변경해줌.
		dto.setId(s_id);
		System.out.println("=======addOrder.do=============");
		System.out.println(dto.getId());
		System.out.println(dto.getPcode());
		System.out.println(dto.getColor());
		System.out.println(dto.getSize());
		System.out.println(dto.getQuantity());
		System.out.println("=======addOrder.do=============");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			sql.insert("cart.insertCart",dto);	//장바구니 등록
			String cartno=sql.selectOne("cart.selectCartno", s_id); //가장 최신의 장바구니번호 가져오기(현재 등록된거)
			List<CartDTO> list1=new ArrayList<CartDTO>();			
			list1 =sql.selectList("cart.readCnoCart2",cartno);				
			mav.addObject("cartdto", list1);
			MemDTO list2=sql.selectOne("mem.selectMem",s_id);						
			mav.addObject("memdto", list2);
			}catch (Exception e) {
			System.out.println("addCartandOrder실패: "+ e);
			}//end
		return mav;
	}//order.do end
	
	@RequestMapping("/order.do")
	public ModelAndView cartForm(HttpSession session, HttpServletRequest req,HttpServletResponse resp) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/order/orderForm");
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;	//강제형변환으로 스트링으로 변경해줌.
		System.out.println("세션아이디:"+s_id);
		String cartno[]=req.getParameterValues("cartno");
		for(int i=0;i<cartno.length;i++) {
			System.out.println("장바구니 번호: "+cartno[i]); 
		}		
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<CartDTO> list1=new ArrayList<CartDTO>();			
			list1 =sql.selectList("cart.readCnoCart",cartno);				
			mav.addObject("cartdto", list1);
			MemDTO list2=sql.selectOne("mem.selectMem",s_id);						
			mav.addObject("memdto", list2);
			}catch (Exception e) {
			System.out.println("order실패: "+ e);
			}//end
		return mav;
	}//order.do end

	@RequestMapping(value = "/order.do", method=RequestMethod.POST)
	public ModelAndView orderProc(HttpSession session, HttpServletRequest req, OrderDTO orderdto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;	//강제형변환으로 스트링으로 변경해줌.
		orderdto.setId(s_id);
		System.out.println("opcode:"+orderdto.getOpcode());
		System.out.println("수량:"+orderdto.getQuantity());
		
		String cartno[]=req.getParameterValues("cartno");
		for(int i=0;i<cartno.length;i++) {
		System.out.println("장바구니"+cartno[i]);
		}		
		System.out.println("ID: "+orderdto.getId());
		System.out.println("이름: "+orderdto.getMname());
		System.out.println("전화번호: "+orderdto.getPhone());
		System.out.println("주소1: "+orderdto.getAddress1());
		System.out.println("주소2: "+orderdto.getAddress2());
				
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			for(int i=0;i<cartno.length;i++) {
				orderdto.setCartno(cartno[i]);
				int result=sql.insert("order.insertOrder",orderdto);
				sql.delete("cart.deleteCart", cartno[i]);
				sql.update("product.updateStock", orderdto);
			}
					
			}catch (Exception e) {
			System.out.println("order.do post실패: "+ e);
			}//end
		return mav;
	}//orderProc() end
	
	@RequestMapping("deleteOrder.do")
	public String updateOrder(HttpServletRequest req, HttpServletResponse resp, String ono) {
		
		System.out.println("=====================");
		System.out.println("결제취소 번호:"+ono);
		System.out.println("=====================");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			int result=sql.delete("order.updateOrder", ono);
			
			PrintWriter out=resp.getWriter();
			out.print("<script>");
			out.print("window.onload=function(){location.href='checkorder.do';}");
			out.print("</script>");
			out.flush();
		} catch (IOException e) {
			System.out.println("결제취소 실패: "+e);
		}
		return null;
	}//deleteOrder.do end
	
	@RequestMapping("MasterdeleteOrder.do")
	public ModelAndView deleteOrder(HttpServletRequest req, HttpServletResponse resp, String ono) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:payList.do");
		System.out.println("=====================");
		System.out.println("결제취소 번호:"+ono);
		System.out.println("=====================");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			int result=sql.delete("order.updateOrder", ono);
			
		} catch (IOException e) {
			System.out.println("MasterdeleteOrder 실패: "+e);
		}
		return mav;
	}//MasterdeleteOrder.do end
	
	@RequestMapping("updateOrder.do")
	public ModelAndView updateOrder(HttpServletRequest req, OrderDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:payList.do");
		
		String ono=req.getParameter("ono");
		String state=req.getParameter("state");
		int states=Integer.parseInt(state);
		dto.setOno(ono);
		dto.setState(states);
		System.out.println("=====================");
		System.out.println("결제취소 번호:"+ono);
		System.out.println("바꿀 상태:"+states);
		System.out.println("=====================");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			sql.update("order.MasterupdateOrder",dto);
		

		} catch (IOException e) {
			System.out.println("updateOrder 실패: "+e);
		}
		return mav;
	}//deleteCart.do end
	
}
