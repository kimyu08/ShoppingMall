<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- 본문시작 template.jsp --%>
	<!-- 메인 메뉴 시작 -->
    <div align="center">
    	<ul class="mainmenu" >
    	 <li><a href="/MasterProductList.do">상품등록</a></li>
          <li><a href="/payList.do">결제관리</a></li>
          <li><a href="/memManagement.do?nowPage=1">회원관리</a></li>
          <li><a href="/notice.do">공지사항</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>