<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
	<h1>content</h1>
	<ul>
		<li>번호</li>
		<li>${vo.no }</li>
		<li>제목</li>
		<li>${vo.subject }
		<li>조회수 : ${vo.hit }, 등록일 : ${vo.writedate }</li>
		<li>글내용</li>
		<li>${vo.content }</li>
	</ul>
	
</div>