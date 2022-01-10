<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>

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
<br><br><br><br><br>

 <div align="center">
		 	<c:forEach var="dto" items="${dto}">
		 	
		 		<div style="display: inline-block;" >
		 			<img style="width: 500px" src="storage/${dto.photo}" class="img-fluid" >
		 		</div>
		 	</c:forEach>
	
		 	<div style="display: inline-block; margin-left: 200px; text-align: left"  >
		 	
			 	<form name="selectOption" onsubmit="return formCheck()" >
			 	
			 	<table>
			 		
			 		<c:forEach var="dto" items="${dto}">
			 		<input type="hidden" name="pcode" id="pcode" value="${dto.pcode}">
		 			<input type="hidden" name="price" id="price" value="${dto.price}">
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
	            		<select name="color" id="color" onchange="setSelectBox(this)">
		            		<option value="*">[필수] 색상을 선택해주세요</option>
		            		<c:forEach var="option" items="${colordto}">
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
	          		<tr>
	          			<td>수량</td>
	          			<td><input type="text" id="quantity" name="quantity" value=0>
	          			<input type=button value="+" onClick="javascript:quantity.value++;">
						<input type=button value="-" onClick="javascript:quantity.value--;">
						</td>
	          		</tr>
	          		<tr><td><h3><br></h3></td></tr>
			   		<tr>
			   			<td><input type="submit" value="장바구니" formmethod="post" formaction="addCart.do"></td>
			   			<td><input type="submit" value="주문하기" formmethod="post" formaction="addOrder.do"></td>
			   			
			   		</tr>
		        </table>
	         	</form>
         	
    </div></div><br>
    <div align="center">
    	<table width=50%, style="text-align: center;">
    		<tr style="border-top: 1px solid black;border-bottom:1px solid black; height: 50px;">
    			<th>번호</th><th>id</th><th>내용</th><th>날짜</th>
    		</tr>
    		<c:forEach var="reviewdto" items="${reviewdto}">
    			<c:set var="i" value="${i+1}" />
    			<tr style="border-bottom:1px solid lightgray; height: 50px;">
	    			<td>${i}</td>
	    			<td>${reviewdto.id}</td>
	    			<td width=50%>${reviewdto.content}</td>
	    			<td>${reviewdto.dates}</td>
    			</tr>
    		</c:forEach>
    	</table>
    </div><br><br>
	 
	 <script>
         	function setSelectBox(color){
         		var color=color.value;
         		var pcode=$('#pcode').val();       		
         		$('#size').children('option:not(:first)').remove();
				
         		$.ajax({
         		    type : 'POST',
         		    url:"/setSizeAjax.do",
         		    data: {"pcode":pcode, "color":color},
         		    error : function(error) {
         		        console.log("Error!"+ error);
         		    },
         		    success : function(data) {
					var s=JSON.stringify(data);      
					var p=JSON.parse(data);
					console.log(p);
					console.log(p.size[0].stock);
					for(var i=0; i<p.resultCnt;i++){
						$('#size').append('<option value='+p.size[i].size+'>'+p.size[i].size+' - 재고:'+p.size[i].stock+'개'+'</option>');	
					}
 		   
         		    }//success end

         		});//ajax end



         		
         	
         	}
         		
         </script>
	<script>
		function getpcode(){
			var pcode=$('#pcode').val();
			
			alert(pcode);
		}
	</script>
	<script>
		function formCheck(){
			var color=$('#color').val();
			var size=$('#size').val();
			var quantity=$('#quantity').val();
			
			if(color=="*"){
				alert('색상을 선택해주세요');
				return false;
			}
			if(size=="*"){
				alert('사이즈를 선택해주세요');
				return false;
			}
			if(quantity<1){
				alert('수량을 입력해주세요(1개 이상)');
				return false;
			}
			
			return true;
		}
	</script>


<%@ include file="../footer.jsp" %>