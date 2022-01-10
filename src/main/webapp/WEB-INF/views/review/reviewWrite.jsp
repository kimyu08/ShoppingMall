<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="../header.jsp"%>
<%-- 본문 시작 --%>
<br>

<div align="center">
<h2>리뷰 등록</h2>

<br>
<br>

<form id="form1" name="form1" enctype="multipart/form-data" action="ReviewProc.do" method="post" >
    <table border="1">
        <tr>
            <td>상품코드</td>
            <td>
            	<select name="pcode">
            		<c:forEach var="dto" items="${dto}">
            			<option value="${dto.pcode}">${dto.pcode}</option>
            		</c:forEach>
            	</select>
            </td>
            
        </tr>
        <tr>
            <td>리뷰 내용</td>	
            <td><textarea rows="5" cols="50" name="content" id="content"></textarea></td>
       
        </tr>
        <tr>
       
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
                <button type="button" class="btn btn-primary" onclick="location.href='review.do'"><i class="fa fa-list"></i> 목록</button>
            </td>
        </tr>
    </table>
</form>
</div>
<br>
<br>
<br>
<br>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp"%>