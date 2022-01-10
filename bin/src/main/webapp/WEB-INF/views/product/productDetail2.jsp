<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ include file="../header.jsp" %>
<%-- 본문시작 template.jsp --%>
	<!-- 메인 메뉴 시작 -->
    <div align="center">
    	<ul class="mainmenu" >
          <li><a href="productList.do?list=best">Best</a></li>
          <li><a href="productList.do?list=new">New</a></li>
          <li><a href="productList.do?list=outer">OUTER</a></li>
          <li><a href="productList.do?list=top">TOP</a></li>
          <li><a href="productList.do?list=pants">PANTS</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
<br><br><br><br><br>
		 <input type="text" id="pcode" value="gd">
		 <div align="center">
		 	<c:forEach var="dto" items="${dto}">
		 	
		 		<div style="display: inline-block;" >
		 			<img style="width: 500px" src="storage/${dto.photo}" class="img-fluid" >
		 		</div>
		 	</c:forEach>
	
		 	<div style="display: inline-block; margin-left: 200px; text-align: left"  >
		 	
			 	<form name="selectOption">
			 	
			 	<table>
			 		
			 		<c:forEach var="dto" items="${dto}">
			 		
			 			<tr>
			 			<th><h2 class="title">${dto.pname}</h2></th>
			 			</tr>
			 			
			 			<tr>
			 				<td>상품 가격</td>
			 				<td><h5>${dto.price}원</h5></td>
			 			</tr>
			 			<tr><td><h3><br></h3></td></tr>
			 			<tr>
			 				<td colspan="2"><p class="description">${dto.content}</p></td>
			 			</tr>
	            		
	            		
	            	</c:forEach>
	            	<tr>
	            		<td>색상</td>
	            		<td>
	            		<select name="color" onchange="setSelectBox(this)">
		            		<option value="*">[필수] 색상을 선택해주세요</option>
		            		<c:forEach var="option" items="${optiondto}">
		            			<option value="${option.color}">${option.color}</option>
		            		</c:forEach>
		            	</select>
		            	</td>
	            	</tr>
	            	<tr><td><h3><br></h3></td></tr>
	          		<tr>
	          			<td>사이즈</td>
	          			<td>
	          				<select name="size" id="size">
			            	<option value="*">[필수] 사이즈을 선택해주세요</option>
			            	<c:forEach var="option" items="${optiondto}">
			            		<option value="${option.size}">${option.size}size-재고:${option.stock}개</option>
			            	</c:forEach>
			            	</select>   
	          			</td>
	          		</tr>
	          		<tr><td><h3><br></h3></td></tr>
			   		<tr>
			   			<td><input type="submit" value="장바구니" formaction="addCart.do" formmethod="post"></td>
			   			<td><input type="submit" value="주문하기" ></td>
			   			
			   		</tr>
		        </table>
	         	</form>
         	</div>
	         
	     </div><input type="button" value="값가져오기" onclick="getpcode()">
         <br><br><br> <br><br><br> <br><br><br>
         <script>
         	function setSelectBox(color){
         		var color=color.value;
         		var pcode=$('#pcode').val();
         		$("#size > option").remove();
         		$("#size").append("<option value="">옵션추가</option>");
         		//ajax
         		$.post("/setSizeAjax.do",{"color":color},function(rs){
         			if(rs.result>0){
         				var sizelist = eval(res.resultList);
         				var loop = res.resultCnt;
         				
         				for(var i=0; i<loop; i++){
         					var slist=sizelist[i];
         					$("#size").append('<option value="' + slist.size + '">' + slist.size + '-재고:' + slist.stock + '개');
         				}
         			}
         		}){
         			
         		}
         		
         	}
         	
		
         </script>
         <script>
         function getpcode(){
 			var pcode=$('#pcode').val();
 			
 			alert(pcode);
         </script>
         
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>