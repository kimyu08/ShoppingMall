package kr.co.shop.product;

import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ProductController {
	
	public ProductController() {
		System.out.println("--ProductController()객체 생성");
	}
	
	
	@RequestMapping(value="productList.do")
	public ModelAndView Plist(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/product/productList");
		String list=req.getParameter("list");
		System.out.println(list);
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			if(list.equals("best")) {
				List<ProductDTO> list1=sql.selectList("product.selectAll");
				mav.addObject("dto",list1);
			}else if(list.equals("new")) {
				List<ProductDTO> list1=sql.selectList("product.selectAll");
				mav.addObject("dto",list1);
			}else if(list.equals("outer")) {
				List<ProductDTO> list1=sql.selectList("product.selectPgroup","OUTER");
				mav.addObject("dto",list1);
			}else if(list.equals("top")) {
				List<ProductDTO> list1=sql.selectList("product.selectPgroup","TOP");
				mav.addObject("dto",list1);
			}else {//pants
				List<ProductDTO> list1=sql.selectList("product.selectPgroup","BOTTOM");
				mav.addObject("dto",list1);
			}
			
		} catch (Exception e) {
			System.out.println("productList db실패: "+e);
		}		
		return mav;
	}//productList.do end
	
	@RequestMapping(value="search.do")
	public ModelAndView Search(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/product/productList");
		String search=req.getParameter("search");
		System.out.println(search);
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			List<ProductDTO> list1=sql.selectList("product.searchProduct",search);
			mav.addObject("dto",list1);
		
			
		} catch (Exception e) {
			System.out.println("search db실패: "+e);
		}		
		return mav;
	}//search.do end
	
	@RequestMapping(value="productDetail.do")
	public ModelAndView Pdetail(HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/product/productDetail");
		String pcode=req.getParameter("pcode");
		System.out.println(pcode);
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
						
			List<ProductDTO> product=sql.selectList("product.selectProduct",pcode);
			mav.addObject("dto",product);
			
			List<ProductDTO> color=sql.selectList("product.selectColor",pcode);
			mav.addObject("colordto",color);
			
			List<ProductDTO> review=sql.selectList("review.selectPcodeReview",pcode);
			mav.addObject("reviewdto",review);
			
			
		} catch (Exception e) {
			System.out.println("productDetail db실패: "+e);
		}		
		return mav;
	}//productDetail.do end
	
	@RequestMapping(value="setSizeAjax.do",method = RequestMethod.POST)
	public void getSizeAjax(HttpServletResponse resp, ProductDTO dto) {
		System.out.println(dto.getPcode());
		System.out.println(dto.getColor());
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			JSONObject json=new JSONObject();
			
			List<ProductDTO> size=sql.selectList("product.selectSize",dto);
			long resultCnt=size.size();
			System.out.println(resultCnt);
			System.out.println(size.get(0).getSize());

			JSONArray jArray = new JSONArray();//배열이 필요할때
			for (int i = 0; i < resultCnt; i++)//배열
			{
				JSONObject sObject = new JSONObject();//배열 내에 들어갈 json
				sObject.put("size", size.get(i).getSize());
				sObject.put("stock", size.get(i).getStock());
				jArray.add(sObject);
			}

			
			
			json.put("resultCnt", resultCnt);
			json.put("size", jArray);
			System.out.println(json.toString());
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print(json.toString());
			out.flush(); //out객체에 남아있는 내용을 버퍼의 내용을 클리어
			out.close();
			
		} catch (Exception e) {
			System.out.println("productDetail db실패: "+e);
		}	

	}//productDetail.do end
	
	
}
