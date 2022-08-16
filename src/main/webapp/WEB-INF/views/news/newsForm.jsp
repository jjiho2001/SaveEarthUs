<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
<style>
	ul, li{
		margin:10px;
		padding:0;
		list-style-type:none;
	}

</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		
		$("#newsFrm").submit(function(){
			if($("#subject").val()==""){
				alert("제목을 입력하세요.");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글내용을 입력하세요.");
				return flase;
			}
			return true;
		});
	});
</script>
<div class="containter">
	<h1>글쓰기</h1>
	<form method="post" action="/news/newsWriteOk" id="newsFrm">
	<ul>
		<li>제목</li>
		<li><input type="text" name="subject" id="subject"/></li>
		<li>글내용</li>
		<li><textarea name="content" id="content"></textarea></li>
		<li><input type="submit" value="글등록"/></li>
	</ul>
	</form>
</div>
