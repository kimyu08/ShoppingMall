<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="../header.jsp"%>
<%-- 본문 시작 --%>
<br>

<div align="center">
<h2>상품 등록</h2>

<br>
<br>

<form id="form1" name="form1" enctype="multipart/form-data" action="/productProc.do" method="post" >
    <table border="1">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="pname" id="pname"></td>
            <td>색상</td>
            <td><input type="text" name="color" id="color"></td>
        </tr>
        <tr>
            <td>상품코드</td>
            <td><input type="text" name="pcode" id="pcode"></td>
            <td>사이즈</td>
            <td><input type="text" name="size" id="size"></td>
        </tr>
        <tr>
            <td>상품그룹</td>
            <td>
            	<select name="pgroup" id="pgroup">
            		<option value="*">-그룹 선택-</option>
            		<option value="OUTER">OUTER</option>
            		<option value="TOP">TOP</option>
            		<option value="BOTTOM">BOTTOM</option>
            	</select>
            </td>

        </tr>
        <tr>
            <td>가격</td>
            <td><input type="text" name="price" id="price"></td>
            <td>재고</td>
            <td><input type="text" name="stock" id="stock"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="5" cols="50" name="content" id="content"></textarea></td>
        </tr>
        <tr>
            <td>상품이미지</td>
            <td><input type='file' name='photoMF' size='50'></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
                <button type="button" class="btn btn-primary" onclick="location.href='productList.do'"><i class="fa fa-list"></i> 목록</button>
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