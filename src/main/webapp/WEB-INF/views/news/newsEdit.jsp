<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
	 	$("#newsFrm").submit(function(){
	 		if($("#subject").val())==""){
	 		alert("제목을 입력하세요.");
	 		return false;
	 		
	 	}
	 	if(CKEDITOR.instances.content.getData()==""){
	 		alert("글내용을 입력하세요.");
	 		return false;
	 	}
	 	return true;
	 	});
	});
</script>

<div class="containter">
	<h1>News 수정 form</h1>
	<form method="post" action="/news/newsEditOK" id="newsFrm">
	<input type="hidden" name="no" value="${vo.no }"/>
	<ul>
		<li>제목</li>
		<li><input type="text" name="subject" id="subject" value="${vo.no }"/></li>
		<li>News 내용</li>
		<li><textarea name="content" id="content">${vo.content }</textarea>
		<li><input type="submit" value="뉴스수정"/></li>
	</ul>
	</form>
</div>
