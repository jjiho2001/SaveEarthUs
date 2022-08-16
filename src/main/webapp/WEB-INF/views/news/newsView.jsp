<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#replyList li{
		border-bottom: 1px solid #ddd;
		margin: 5px;
	}
</style>
<script>
	function newsDel(){
		if(confirm("삭제하시겠습니까?")){
			location.href="/news/newsDel?no=${vo.no}";
		}
	}

</script>
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
		<div>
		<a href = "/news/newsList?nowPage=${pvo.nowPage }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">목록</a>
		<c:if test = "${vo.userid == logId}">
			<a href = "/news/newsEdit/${vo.no }">수정</a>
			<a href = "javascript:newsDel();">삭제</a>
		</c:if>
	</div>
	<hr/>

	
</div>