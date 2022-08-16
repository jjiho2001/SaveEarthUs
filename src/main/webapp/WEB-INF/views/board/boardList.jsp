<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<style>
	#board {
		background-color : white;
		border : 2px ridge orange;
		border-radius : 1%
	}
	#board, #page{
		overflow:auto;
	}
	#board li{
		list-style: none;
		float : left;
		line-height : 40px;
		border-bottom : 1px solid orange;
		width : 10%;
	}
	#board li:nth-child(6n+1){
		width : 5%;
	}
	#board li:nth-child(6n+3){
		width : 55%;
		white-space : nowrap;
		overflow : hidden;
		text-overflow : ellipsis;
	}
	
	/* page */
	#page li{
		list-style: none;
		background-color:white;
		float : left;
		padding : 10px;
	}
	
</style>
<script>
	$(function(){
		$("#searchFrm").submit(function(){
			if($("#searchWord").val()==""){
				alert("내용을 입력하시오");
				return false;
			}
			return true;
		});
		
		// list 전체 선택
		$("#allChk").click(function(){
			$("#board input[type=checkbox]").prop("checked", $("#allChk").prop("checked"));
		});
		
		// 선택된 개수를 구하여 여러 개 삭제하도록 함.
		$("#multiDel").click(function(){
			// check 개수 확인
			var countChk = 0;
			$("#board input[name=noList]").each(function(idx, obj){
				if(obj.checked){ // input tag가 checked 이면
					countChk++;
				}
			});
			
			if(countChk <= 0){
				alert("삭제할 목록을 선택하세요.");
				return false;
			}
			
			$("#listFrm").submit();
		});
	});
</script>

<html>
<script src="https://kit.fontawesome.com/8146b558d6.js" crossorigin="anonymous"></script>

</html>
<div class = "container">
	<h1 style="color: Orange;">QNA<i class="fa-solid fa-circle-question"></i></h1>
	<h2 style="font-size: 10px; color: red;">*질문글 게시 이후 답변에는 3~5일 가량
		소요될 수 있습니다.</h2>
	<c:if test = "${logStatus == 'Y' }">
		<div>
		
			<a href = "/board/boardForm" style="font-size:1.5em; font-weight:bold;">글쓰기</a>
		
		</div>
	</c:if>
	<div>
		${pvo.totalPage } / ${pvo.nowPage }, total record : ${pvo.totalRecord }
	</div>
	<div>
		Total page / current page
	</div>
	<div>
		<input type = "button" value = "전체삭제" id = "multiDel">
	</div>
	<form method = "post" action = "/board/multiDel" id = "listFrm">
		<ul id = "board">
			<li style = "font-size : 0.5em"><input type = "checkbox" id = "allChk">전체선택</li>
			<li><b>번호</b></li>
			<li><b>제목</b></li>
			<li><b>작성자</b></li>
			<li><b>조회수</b></li>
			<li><b>등록일</b></li>
			
			<c:forEach var = "vo" items = "${list }">
				<li><input type = "checkbox" name = "noList" value = "${vo.no }"></li>
				<li>${vo.no }</li>
				<li><a href = "/board/boardView?no=${vo.no }&nowPage=${pvo.nowPage}<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">${vo.subject }
					<c:if test = '${vo.reply_num > 0 }'>[${vo.reply_num }]</c:if></a></li>
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
				<li><a href = "/board/boardList?nowPage=${pvo.nowPage-1 }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }&userid=${pvo.userid }</c:if>">prev</a></li>
			</c:if>
			
			<c:forEach var = "p" begin = "${pvo.startPage }" end = "${pvo.startPage + pvo.onePageCount - 1 }">
				<!-- 출력할 page 번호가 총 page보다 작거나 같을 때 -->
				<c:if test = "${p <= pvo.totalPage}">
					
					<li 
					
					<c:if test = "${p == pvo.nowPage }">
						style = "background-color : white;"; color : orange;"
					</c:if>
					
					><a href = "/board/boardList?nowPage=${p }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }&userid=${pvo.userid }</c:if>">${p }</a></li>
					
				</c:if>
			</c:forEach>
			
			<!-- 다음 page -->
			<c:if test = "${pvo.nowPage < pvo.totalPage }">
				<li><a href = "/board/boardList?nowPage=${pvo.nowPage + 1 }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }&userid=${pvo.userid }</c:if>">next</a></li>
			</c:if>
		</ul>
	</div>
	
	<div>
		<form method = "get" action = "/board/boardList" id = "searchFrm">
			<select name = "searchKey">
				<option value = "subject">제목</option>
				<option value = "userid">작성자</option>
				<option value = "content">글내용</option>
			</select>
			<input type = "text" name = "searchWord" id = "searchWord">
			<input type = "submit" name = "Search" value="검색하기">
		</form>
	</div>
</div>
