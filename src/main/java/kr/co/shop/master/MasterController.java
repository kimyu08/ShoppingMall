package kr.co.shop.master;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.shop.member.MemDTO;
import kr.co.shop.notice.NoticeDTO;
import kr.co.shop.order.OrderDTO;
import kr.co.shop.product.ProductDTO;
import kr.co.shop.product.UploadSaveManager;


@Controller
public class MasterController {

	public MasterController() {
		System.out.println("--MasterController()객체 생성");
	}
	
	@RequestMapping("/MasterProductList.do")
	public ModelAndView join() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/master/productList");
		
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<ProductDTO> list=sql.selectList("product.MasterSelectProduct");
			mav.addObject("dto", list);
			
			
		} catch (Exception e) {
			System.out.println("NoticeList db실패: "+e);
		}	
		
		return mav;
		
	}
	
	@RequestMapping("/productAdd.do")
	public String NoticeForm() {
		return "/master/productAdd";
	}//join() end
	

	@RequestMapping(value="/productProc.do", method = RequestMethod.POST)
	public ModelAndView Writemaster(ProductDTO dto,HttpSession session, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:MasterProductList.do");
		System.out.println(dto.getPname());
		//첨부된 파일 처리
		//->실제 파일은 /storage폴더에 저장
		//->저장된 파일 관련 정보는 media테이블에 저장.	
		//파일 저장 폴더의 실제 물리적인 경로 가져오기
		session=req.getSession();
		String basePath=session.getServletContext().getRealPath("/storage");
		
		//1)<input type='file' name='posterMF' size='50'>
		//파일 가져오기
		MultipartFile photoMF=dto.getPhotoMF();	//파일 가져오기
		//storage폴더에 파일을 저장하고, 리네임된 파일명 변환
		String photo=UploadSaveManager.saveFileSpring30(photoMF, basePath);
		dto.setPhoto(photo);//리네임된 파일명을 dto객체에 담기
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			Integer result=sql.selectOne("product.countPcode", dto.getPcode());
			if(result<1){
				sql.insert("product.insertProduct",dto);
			}
			sql.insert("product.insertOption",dto);
			
		} catch (Exception e) {
			System.out.println("productProc db실패: "+e);
		}		
		return mav;		
	}
	
	
	@RequestMapping("/payList.do")
	public ModelAndView checkOrder(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("master/payList");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<OrderDTO> list=sql.selectList("order.MastercheckOrder");
			mav.addObject("dto",list);
		} catch (Exception e) {
			System.out.println("checkOrder db실패: "+e);
		}
				
		return mav;
	}
	
	@RequestMapping(value = "MasterdeleteMem.do" )
	public ModelAndView deleteMem(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:memManagement.do");
		String id=req.getParameter("id");
			try {
				String resource="config/jdbc.xml";
				InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
				System.out.println("--DB연결 성공!!");
				SqlSession sql=ssf.openSession(true);
				
				sql.update("mem.deleteMem", id); //회원삭제
				
			} catch (Exception e) {
				System.out.println("회원 탈퇴 실패: "+e);
			}

		return mav;
	}//updateLoc.do end



}
