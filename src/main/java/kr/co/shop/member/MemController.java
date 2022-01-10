package kr.co.shop.member;

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
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemController {

	public MemController() {
		System.out.println("--MemController() 객체 생성");
	}
	
	@RequestMapping("/join.do")
	public String join() {
		return "/member/agreement";
	}//join() end
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "/member/joinForm";
	}//join() end
	
	@RequestMapping("/deleteInfo.do")
	public String deleteForm() {
		return "/mypage/deleteInfo";
	}//deleteForm() end
	
	@RequestMapping("/mypage.do")
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		Object os_rights=session.getAttribute("s_rights");
		String s_rights=(String)os_rights;
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;
		System.out.println(s_rights);
		if(s_rights.equals("2")) {
			mav.setViewName("mypage/managerPage");
		}else {
			mav.setViewName("mypage/myPage");
			try {
				String resource="config/jdbc.xml";
				InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
				System.out.println("--DB연결 성공!!");
				SqlSession sql=ssf.openSession(true);
				
				MemDTO list=sql.selectOne("mem.selectMem",s_id);
				mav.addObject("dto",list);
				
			} catch (Exception e) {
				System.out.println("내정보 조회 실패: "+e);
			}
		}
		return mav;
	}//mypage.do end
	
	@RequestMapping(value = "changeInfo.do",method = RequestMethod.POST )
	public ModelAndView updateMem(HttpSession session,MemDTO dto) {
		ModelAndView mav=new ModelAndView();
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;
		
			try {
				String resource="config/jdbc.xml";
				InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
				System.out.println("--DB연결 성공!!");
				SqlSession sql=ssf.openSession(true);
				dto.setId(s_id);
				
				sql.selectOne("mem.updateMem",dto);
				
				
			} catch (Exception e) {
				System.out.println("정보 업데이트 실패: "+e);
			}
		mav.setViewName("home");
		return mav;
	}//changeInfo.do end
	
	@RequestMapping("/location.do")
	public ModelAndView myPageLocation(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;
			mav.setViewName("mypage/updateLocation");
			try {
				String resource="config/jdbc.xml";
				InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
				System.out.println("--DB연결 성공!!");
				SqlSession sql=ssf.openSession(true);
				
				MemDTO list=sql.selectOne("mem.selectMem",s_id);
				mav.addObject("dto",list);
				
			} catch (Exception e) {
				System.out.println("내정보 조회 실패: "+e);
			}
		
		return mav;
	}//location.do end
	
	@RequestMapping(value = "updateLoc.do",method = RequestMethod.POST )
	public ModelAndView updateLocation(HttpSession session,MemDTO dto) {
		ModelAndView mav=new ModelAndView();
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;
		
			try {
				String resource="config/jdbc.xml";
				InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
				System.out.println("--DB연결 성공!!");
				SqlSession sql=ssf.openSession(true);
				dto.setId(s_id);
				
				sql.selectOne("mem.updateLoc",dto);
				
				
			} catch (Exception e) {
				System.out.println("정보 업데이트 실패: "+e);
			}
			mav.setViewName("home");
		return mav;
	}//updateLoc.do end
	
	@RequestMapping(value = "deleteInfo.do",method = RequestMethod.POST )
	public ModelAndView deleteInfo(HttpSession session,MemDTO dto,HttpServletResponse resp) {
		resp.setCharacterEncoding("UTF-8"); 
		resp.setContentType("text/html; charset=UTF-8");
		ModelAndView mav=new ModelAndView();
		Object obs_id=session.getAttribute("s_id"); //리턴형이 오브젝트라 
		String s_id=(String)obs_id;
			try {
				String resource="config/jdbc.xml";
				InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
				System.out.println("--DB연결 성공!!");
				SqlSession sql=ssf.openSession(true);
				dto.setId(s_id);
				System.out.println(dto.getId());
				System.out.println(dto.getPw());
				Integer result=sql.selectOne("mem.dlogin", dto); //비밀번호 맞는지 확인
				if(result==1) {//맞다면
					sql.selectOne("mem.outMem",dto); //회원 탈퇴
				}
				else {

					PrintWriter out=resp.getWriter();
					out.print("<script>");
					out.print("alert('비밀번호가 틀립니다.')");
					out.print("</script>");
					out.flush();
				}
			} catch (Exception e) {
				System.out.println("회원 탈퇴 실패: "+e);
			}
			session.invalidate();
			mav.setViewName("home");
		return mav;
	}//updateLoc.do end
	
	@RequestMapping(value="/joinForm.do",method = RequestMethod.POST)
	public ModelAndView joinForm(MemDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
		
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			int result=sql.insert("mem.insertRow",dto);
		} catch (Exception e) {
			System.out.println("insert db연결 실패: " + e);
		}
		
		return mav;
	}//join() end
	
	
	
	@RequestMapping("idCheckProc.do")
	public void idCheckProc(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			
			
			String id=req.getParameter("id");
			Integer result=sql.selectOne("mem.checkId", id);
			System.out.println(id);
			int cnt=0;
			
			if(result==1) {
				cnt=1;
			}//if end
			//1)text응답 ---------------------------------------------
			/*
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print(cnt);
			out.flush(); //out객체에 남아있는 내용을 버퍼의 내용을 클리어
			out.close();
			*/
			//2)JSON응답 ---------------------------------------------
			//<!-- json-simple 라이브러리 --> 필요함 pom.xml에 의존성 추가.
			
			JSONObject json=new JSONObject();
			json.put("count", cnt);//key , value
			
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print(json.toString());
			out.flush(); //out객체에 남아있는 내용을 버퍼의 내용을 클리어
			out.close();
			
			
		}catch (Exception e) {
			System.out.println("아이디 중복확인 쿠키 실패: "+ e);
		}//end
	}//idCheckProc() end
	
	@RequestMapping("idCheckProc4.do")
	public void idCheckProc4(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String id=req.getParameter("id");
			System.out.println(id);
			int cnt=0;
			if(id.equals("soldesk") || id.equals("webmaster")) {
				cnt=1;
			}//if end
			//1)text응답 ---------------------------------------------
			/*
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print(cnt);
			out.flush(); //out객체에 남아있는 내용을 버퍼의 내용을 클리어
			out.close();
			*/
			//2)JSON응답 ---------------------------------------------
			//<!-- json-simple 라이브러리 --> 필요함 pom.xml에 의존성 추가.
			
			JSONObject json=new JSONObject();
			json.put("count", cnt);//key , value
			
			resp.setContentType("text/plain; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print(json.toString());
			out.flush(); //out객체에 남아있는 내용을 버퍼의 내용을 클리어
			out.close();
			
			
		}catch (Exception e) {
			System.out.println("아이디 중복확인 쿠키 실패: "+ e);
		}//end
	}//idCheckProc4() end
	
	@RequestMapping("/login.do")
	public String loginForm() {
		return "/member/loginForm";
	}//loginForm() end
	
	@RequestMapping("/test.do")
	public String test() {
		return "/member/test";
	}//test() end
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}//logout() end
	
	@RequestMapping(value="/loginProc.do", method = RequestMethod.POST)
	public ModelAndView loginProc(HttpSession session,MemDTO dto ,HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
		
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);	//파일 형태로 만들기.
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			String rights=sql.selectOne("mem.login",dto);
			System.out.println(rights);
			if(rights==null) {
				mav.addObject("msg", "아이디 또는 비밀번호가 틀립니다.");
				mav.addObject("url", "login.do");
				mav.setViewName("/member/loginFail");
			}else {
				session.setAttribute("s_id", dto.getId());
				session.setAttribute("s_rights", rights);
				System.out.println("s_id:"+dto.getId());
				System.out.println("s_rigths:"+rights);
				String c_id=req.getParameter("c_id");
				System.out.println(c_id);
				Cookie cookie=null;
				if(c_id!=null){
					//아이디 저장체크 시
					//쿠키변수 선언 new Cookie("쿠키변수명",값)
					cookie=new Cookie("c_id",dto.getId());
					//쿠키의 생존기간 1개월
					cookie.setMaxAge(60*60*24*30);
				}else{
					//아이디 저장 체크 안했을 시
					cookie=new Cookie("c_id",null);
					cookie.setMaxAge(0);
				}
				//요청한 사용자 PC에 쿠키값을 저장
				resp.addCookie(cookie);
			}
		} catch (Exception e) {
			System.out.println(dto.getId()+dto.getPw()+"longin db연결 실패: " + e);
		}
		
		
		return mav;
	}//login() end
	
	@RequestMapping("/findID.do")
	public String findID() {
		return "/member/findID";
	}//join() end
	
	@RequestMapping("/findPW.do")
	public String findPW() {
		return "/member/findPW";
	}//join() end
	
	@RequestMapping("/findID2.do")
	public ModelAndView findID2(MemDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/member/findID2");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			String id=sql.selectOne("mem.selectID", dto);
			
			if(id==null) {
				mav.setViewName("/member/failfindID");
			}
			
			mav.addObject("id", id);
			System.out.println(id);
			
		} catch (Exception e) {
			System.out.println("findID List db실패: "+e);
		}	
		
		return mav;
		
	}
	
	@RequestMapping("/findPW2.do")
	public ModelAndView findPW2(MemDTO dto) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/member/findPW2");
		try {
			String resource="config/jdbc.xml";
			InputStream is=Resources.getResourceAsStream(resource);
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(is);
			System.out.println("--DB연결 성공!!");
			SqlSession sql=ssf.openSession(true);
			
			String pw=sql.selectOne("mem.selectPW", dto);
			
			if(pw==null) {
				mav.setViewName("/member/failfindPW");
			}
			
			mav.addObject("pw", pw);
			System.out.println(pw);
			
		} catch (Exception e) {
			System.out.println("findID List db실패: "+e);
		}	
		
		return mav;
		
	}

}
