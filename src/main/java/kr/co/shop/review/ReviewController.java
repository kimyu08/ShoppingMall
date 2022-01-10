package kr.co.shop.review;

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

import kr.co.shop.notice.NoticeDTO;
import kr.co.shop.review.ReviewDTO;

@Controller
public class ReviewController {

	public ReviewController() {
		System.out.println("--ReviewController() 객체 생성");
	}
	
	@RequestMapping("/review.do")
	public ModelAndView join() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/review/reviewList");
		
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<ReviewDTO> list=sql.selectList("review.selectReview"); // ([xml이름].~)
			mav.addObject("dto", list);
		} catch (Exception e) {
			System.out.println("NoticeList db실패: "+e);
		}	
		
		return mav;
		
	}
	
	@RequestMapping("/reviewWrite.do")
	public ModelAndView NoticeForm(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/review/reviewWrite");
		Object obs_id=session.getAttribute("s_id"); //세션 id 갖고오기
		String s_id=(String)obs_id;
		System.out.println(s_id);
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<ReviewDTO> list=sql.selectList("review.getOrder",s_id);
			
			System.out.println(list.toString());
			mav.addObject("dto",list);
		} catch (Exception e) {
			System.out.println("noticeProc db실패: "+e);
		}		
		
		return mav;
	}//join() end
	
	
	@RequestMapping(value="/ReviewProc.do", method = RequestMethod.POST)
	public ModelAndView WriteReview(ReviewDTO dto,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		Object obs_id=session.getAttribute("s_id"); //세션 id 갖고오기
		String s_id=(String)obs_id;
		mav.setViewName("redirect:review.do");
		dto.setId(s_id);
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			sql.insert("review.insertReview",dto);
			
		} catch (Exception e) {
			System.out.println("noticeProc db실패: "+e);
		}		
		return mav;		
	}
}
