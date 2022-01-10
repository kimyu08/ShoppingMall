package kr.co.shop.mypage;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.shop.member.MemDTO;
import kr.co.shop.page.PageDTO;

@Controller
public class MyPageController {

	public MyPageController() {
		System.out.println("--MyPageController() 객체 생성");
	}
	
//	@RequestMapping("/memManagement.do")
//	public ModelAndView myPage(Pageable pageable) {
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("mypage/memManagement");
//		try {
//			String resource="config/jdbc.xml";
//			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
//			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
//			System.out.println("--DB연결 성공!!");
//			SqlSession sql=ssf.openSession(true);
//			
//			List<MemDTO> list=sql.selectList("mem.selectAllMem");
//			mav.addObject("dto",list);
//			
//		} catch (Exception e) {
//			System.out.println("회원정보 조회 실패: "+e);
//		}		
//		return mav;
//	}//memManagement.do end
	
	@RequestMapping("/memManagement.do")
	public ModelAndView pageMyPage(int nowPage) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/memManagement");
		System.out.println("현재페이지:"+nowPage);
		int nowRecord=nowPage-1;
		if(nowRecord>0) {
			nowRecord=nowRecord*10;
		}
		System.out.println("순번 조회:"+nowRecord);
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			int totalRecord=sql.selectOne("page.pageSelectCountMem");
			int endPage=(totalRecord/10)+1;
			System.out.println("총 레코드:"+totalRecord+"\n끝페이지:"+endPage);
			List<MemDTO> list=sql.selectList("page.pageSelectAllMem",nowRecord);
			mav.addObject("dto",list);
			mav.addObject("endPage",endPage);
			
		} catch (Exception e) {
			System.out.println("회원정보 조회 실패: "+e);
		}		
		return mav;
	}//memManagement.do end
	
	

}
