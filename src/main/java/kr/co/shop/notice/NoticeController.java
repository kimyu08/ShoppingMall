package kr.co.shop.notice;

import java.io.InputStream;
import java.util.List;

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


@Controller
public class NoticeController {

	public NoticeController() {
		System.out.println("--MemController() 객체 생성");
	}
	
	@RequestMapping("/notice.do")
	public ModelAndView join(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/notice/boarderList");
		Object s_rights= session.getAttribute("s_rights");
		mav.addObject("s_rights",s_rights);
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<NoticeDTO> list=sql.selectList("notice.selectNotice");
			for(int i=0;i<list.size(); i++) {
				NoticeDTO dto=list.get(i);
				System.out.print(dto.getNoticeno() + " ");
				System.out.print(dto.getSubject() + " ");
				System.out.print(dto.getDate() + " ");
				System.out.println("");
			}//for end
			mav.addObject("dto", list);
		} catch (Exception e) {
			System.out.println("checkOrder db실패: "+e);
		}	
		
		return mav;
		
	}
	
	@RequestMapping(value="/noticeProc.do", method = RequestMethod.POST)
	public ModelAndView WriteNotice(NoticeDTO dto,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			sql.insert("notice.insertNotice",dto);
			
		} catch (Exception e) {
			System.out.println("checkOrder db실패: "+e);
		}		
		return mav;		
	}
	
	@RequestMapping("/noticeWrite.do")
	public String NoticeForm() {
		return "/notice/boarder";
	}//join() end
	
	
}