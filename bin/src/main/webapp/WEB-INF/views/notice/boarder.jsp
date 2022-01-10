<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<!-- 등록부분 -->
<div class="col-lg-12">
    <form role="form" id="writeForm" method="post" action="noticeProc.do">
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
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="30"
                              placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                </div>
                <div class="form-group">
                    <label for="writer">작성자</label>
                    <input class="form-control" id="id" name="id">
                </div>
            </div>
            <div class="box-footer">
                <button type="button" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
                <div class="pull-right">
                    <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                    <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
                </div>
            </div>
        </div>
    </form>
</div>