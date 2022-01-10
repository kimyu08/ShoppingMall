<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- 본문시작 template.jsp --%>
	<!-- 메인 메뉴 시작 -->
	<div align="right">
		<form class="searchForm" action="search.do" style="margin-right: 150px">
			<input type="text" name="search" id="search">
			<input type="image" src="storage/search.png" style="width: 20px">
		</form>    
	</div>
    <div align="center">
    	<ul class="mainmenu" >
           <li><a href="productList.do?list=best">Best</a></li>
          <li><a href="productList.do?list=new">New</a></li>
          <li><a href="productList.do?list=outer">OUTER</a></li>
          <li><a href="productList.do?list=top">TOP</a></li>
          <li><a href="productList.do?list=pants">PANTS</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
    <br><br><br>

    
		 <div class="row" align="center">
		 	<c:forEach var="dto" items="${dto}">
    		<div class="col-lg-4 col-md-4">
              	<a href="productDetail.do?pcode=${dto.pcode}"><img src="storage/${dto.photo}" class="img-fluid" width="400"></a><h4 class="title"><a href="">${dto.pname} &nbsp;</a>${dto.price}원</h4>
              	<p class="description">${dto.content}</p><br><br>
            </div>
            </c:forEach> 
        </div>    
        
        
	         
        
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>