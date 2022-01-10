<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<!-- 등록부분 -->
 <div align="center">
    	<ul class="mainmenu" >
    	 <li><a href="/MasterProductList.do">상품등록</a></li>
          <li><a href="/payList.do">결제관리</a></li>
          <li><a href="/memManagement.do?nowPage=1">회원관리</a></li>
          <li><a href="/notice.do">공지사항</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
	<br>
<div  align="center">
    <form role="form" id="writeForm" method="post" action="noticeProc.do" style="width: 40%; height: 50%;">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">게시글 작성</h3>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요">
                </div>
                 <div class="form-group">
                    <label for="writer">작성자</label>
                    <input class="form-control" id="id" name="id">
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10"
                              placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                </div>
            </div><br>
            <div class="box-footer">
                <div class="pull-right">
                	<button type="button" class="btn btn-primary" onclick="location.href='notice.do'"><i class="fa fa-list"></i> 목록</button>
                    <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                    <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
                </div>
            </div>
        </div>
    </form>
</div>