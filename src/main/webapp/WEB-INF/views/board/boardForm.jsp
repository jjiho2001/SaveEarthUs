<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#boardFrm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요.");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("내용을 입력하세요.");
				return false;
			}
			
			return true;
		});
	});
</script>
	<div class = "container">
		<h1>write form</h1>
		<form method = "post" action = "/board/boardFormOk" id = "boardFrm">
			<ul>
				<li>제목</li>
				<li><input type = "text" name = "subject" id = "subject"></li>
				<li>글 내용</li>
				<li><textarea name = "content" id = "content"></textarea></li>
				<li><input type = "submit" value = "등록"></li>
			</ul>
		</form>
	</div>
