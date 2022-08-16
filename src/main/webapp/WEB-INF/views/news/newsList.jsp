<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>




</style>

<script>
	$(function(){
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==""){
				alert("검색어를 입력하세요.");
				return false;
			}
			return true;
		});
		
		// list 전체 선택
		$("#allChk").click(function(){
			$("#news input[type=checkbox]").prop("checked", $("#allChk").prop("checked"));
		});
		
		// 선택된 개수를 구하여 여러 개 삭제하도록 함.
		$("#multiDel").click(function(){
			// check 개수 확인
			var countChk = 0;
			$("#news input[name=noList]").each(function(idx, obj){
				if(obj.checked){ // input tag가 checked 이면
					countChk++;
				}
			});
			
			if(countChk <= 0){
				alert("선택하하고 삭제하세요.");
				return false;
			}
			
			$("#listFrm").submit();
		});
	});
</script>

<div class = "newstop">
	<img class = "newsbanner" src="../img/news/news_banner.jpg">
</div>


<div class = "container">
	<h1>news list</h1>
	<c:if test = "${logStatus == 'Y' }">
		<div>
		
			<a href = "/news/newsForm">글쓰기</a>
		
		</div>
	</c:if>
	<div>
		${pvo.totalPage } / ${pvo.nowPage }, total record : ${pvo.totalRecord }
	</div>
	<div>
		Total page / current page
	</div>
	<div>
		<input type = "button" value = "전체삭제" id = "multiDel">s
	</div>
	<form method = "post" action = "/news/multiDel" id = "listFrm">
		<ul id = "news">
			<li style = "font-size : 0.5em"><input type = "checkbox" id = "allChk">전체선택</li>
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>조회수</li>
			<li>등록일</li>
			
			<c:forEach var = "vo" items = "${list }">
				<li><input type = "checkbox" name = "noList" value = "${vo.no }"></li>
				<li>${vo.no }</li>
				<li><a href = "/news/newsView?no=${vo.no }&nowPage=${pvo.nowPage}<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">${vo.subject }</a></li>
					<!-- 댓글수 -->
					<c:if test="${vo.reply_count>o }">
						[${vo.reply_count }]
					</c:if>
				<li>
				<li>${vo.userid }</li>
				<li>${vo.hit }</li>
				<li>${vo.writedate }</li>
				
			</c:forEach>
		</ul>
	</form>
	<div>
		<ul id = "page">
		<!-- page 번호 -->
			<c:if test = "${pvo.nowPage > 1 }"><!-- 이전 page가 있을 때 -->
				<li><a href = "/news/newsList?nowPage=${pvo.nowPage-1 }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">prev</a></li>
			</c:if>
			
			<c:forEach var = "p" begin = "${pvo.startPage }" end = "${pvo.startPage + pvo.onePageCount - 1 }">
				<!-- 출력할 page 번호가 총 page보다 작거나 같을 때 -->
				<c:if test = "${p <= pvo.totalPage}">
					
					<li 
					
					<c:if test = "${p == pvo.nowPage }">
						style = "background-color : #f00"; color : #fff;"
					</c:if>
					
					><a href = "/news/newsList?nowPage=${p }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">${p }</a></li>
					
				</c:if>
			</c:forEach>
			
			<!-- 다음 page -->
			<c:if test = "${pvo.nowPage < pvo.totalPage }">
				<li><a href = "/news/newsList?nowPage=${pvo.nowPage + 1 }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">next</a></li>
			</c:if>
		</ul>
	</div>
	
	<div>
		<form method = "get" action = "/news/newsList" id = "searchFrm">
			<select name = "searchKey">
				<option value = "subject">제목</option>
				<option value = "userid">작성자</option>
				<option value = "content">글내용</option>
			</select>
			<input type = "text" name = "searchWord" id = "searchWord">
			<input type = "submit" name = "Search">
		</form>
	</div>
</div>
v>