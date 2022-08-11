<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<style>
	#list{
		overflow:auto;
		list-style:none;
   
	}
	#list>li{
		float:left;
		height:40px;
		line-height:40px;
		border-bottom:1px solid #ddd;
		width:10%;
	}
	#list>li:nth-child(5n+2){
		width:60%;
	}
</style>
<div class="container">

	<h1 style="color:Orange;">QNA</h1>
	<h2 style=" font-size:10px; color:red;">*질문글 게시 이후 답변에는 3~5일 가량 소요될 수 있습니다.</h2>
	<c:if test="${logStatus=='Y' }">
			<div><a href="/qnaboard/write">질문글 작성하기</a></div>
	</c:if>
	
	<ul id="list">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>조회수</li>
		<li>등록일</li>
		
		<li>01</li>
		<li>테스트 글</li>
		<li>DONG</li>
		<li>0</li>
		<li>2022-08-10</li>
		
		<li>02</li>
		<li>테스트 글</li>
		<li>DONG</li>
		<li>0</li>
		<li>2022-08-10</li>
	
	
	</ul>


</div>
