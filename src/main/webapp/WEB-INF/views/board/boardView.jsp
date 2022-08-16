<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<style>
	#replyList li{
		border-bottom : 1px solid #ddd;
		margin : 5px;
	}
	.container ul{
		list-style : none;
		line-height : 20px;
		border-bottom : 1px solid #ddd;
	}
	.container h1{
		color : orange;
	}
</style>
<script>
	function boardDel(){
		if(confirm("삭제하시겠습니까?")){
			location.href="/board/boardDel?no=${vo.no}";
		}
	}
	
	$(function(){
		function replyAllList(){
			// 기존 목록 지우기
			$("#replyList>ul").empty(); // $("#replyList>ul").html(""), $("#replyList>ul").text("") 다 같은거임
			
			// 비동기식으로 서버에 접속하여 댓글 목록 가져옴
			var url = "/reply/replyList";
			var params = {no : ${vo.no}};
			console.log(params);
			
			$.ajax({
				url: url,
				data: params,
				success: function(result){
					var $reply = $(result);
					
					$reply.each(function(idx, vo){
						tag = "<li>";
						tag += "<div><b>" + vo.userid + "(" + vo.writedate + ")" + "</b>";
						
						// 수정,삭제 버튼 (자신이 쓴 댓글일 경우)
						if(vo.userid == '${logId}'){ // 'ddd' = ddd 따옴표 없으면 이렇게 나옴
							tag += "<input type='button' value = 'Edit'>";
							tag += "<input type='button' value = 'Del' title='"+vo.reply_no+"'>"
						}
						
						tag += "<br>" + vo.comment + "</div>";
						// 로그인 아이디와 댓글 쓴 사람이 같으면 폼을 만들어줌
						if(vo.userid == '${logId}'){
							tag += "<div style = 'display:none'><form method = 'post'>";
							tag += "<input type='hidden' name = 'reply_no' value = '" + vo.reply_no + "'>";
							tag += "<textarea name='comment' rows='4' cols='50'>" + vo.comment + "</textarea>";
							tag += "<input type = 'submit' value = '수정'>";
							
							tag += "</form></div>"
						}
						
						tag += "</li>";
						
						$("#replyList>ul").append(tag);
						
					});
				}, error: function(e){
					console.log(e.responseText);
				}
			});
		}
		$("#replyFrm").submit(function(){
			// 해당 원글의 댓글 목록 가져오기
			
			// 기본 event 제거하기
			event.preventDefault();
			console.log(1111111);
			// var params = "no="+$("no").val()+"&comment="+$("#comment").val();// 아래랑 같은 값임
			var params = $("#replyFrm").serialize(); // form 값을 전송값으로 변환하는 함수
			
			$.ajax({
				url: "/reply/replyWrite",
				data: params,
				type: "POST",
				success: function(result){
					console.log("댓글등록 수 :", result);
					
					// 이미 등록된 글 지우기
					$("#comment").val("");
					
					replyAllList();
				}, error: function(e){
					console.log(e.responseText);
				}
			});
		});
		
		// 댓글 수정하기(폼보기)
		// $("#replyList input[value=Edit]").click(); 이거 안됨 -> jquery의 실행 순서에 의해 안됨
		$(document).on('click','#replyList input[value=Edit]',function(){
			$(this).parent().css("display","none");
			$(this).parent().next().css("display","block");
		});
		
		// 댓글 수정(DB)
		$(document).on('submit','#replyList form', function(){
			event.preventDefault();
			var url = "/reply/replyEdit";
			var params = $(this).serialize();
			
			$.ajax({
				url: url,
				data: params,
				type: "POST",
				success: function(result){
					replyAllList();
				}, error:function(e){
					console.log(e.responseText);
				}
			
			});
		});
		
		// 댓글 삭제
		$(document).on('click','#replyList input[value=Del]',function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
				var params = {reply_no : $(this).attr('title')};
				
				$.ajax({
					url: "/reply/replyDel",
					data: params,
					success: function(result){
						replyAllList();
					}, error: function(e){
						console.log(e.responseText);
					}
				});
			}
		});
		replyAllList(); // 댓글 목록
	});
</script>
<html>
<script src="https://kit.fontawesome.com/8146b558d6.js" crossorigin="anonymous"></script>

</html>
<div class = "container">
	<h1>QNA<i class="fa-solid fa-circle-question"></i></h1>
	<ul>
		<li><b>-번호</b></li>
		<li>${vo.no }</li>
		<li><b>-작성자</b></li>
		<li>${vo.userid }</li>
		<li><b>-제목</b></li>
		<li>${vo.subject }</li>
		<li><b>-조회수</b></li> 
		<li>${vo.hit }</li>
		</li><b>-등록일</b></li>
		<li>${vo.writedate }</li>
		</br>
		</br>
		<li><b>-글내용</b></li>
		</br>
		<li>${vo.content }</li>
		</br>
		</br>
		</br>
		</br>
		</br>
	</ul>
	<div>
		<a href = "/board/boardList?nowPage=${pvo.nowPage }<c:if test='${pvo.searchWord!=null }'>&searchKey=${pvo.searchKey }&searchWord=${pvo.searchWord }</c:if>">목록</a>
		<c:if test = "${vo.userid == logId}">
			<a href = "/board/boardEdit/${vo.no }">수정</a>
			<a href = "javascript:boardDel();">삭제</a>
		</c:if>
	</div>
	<hr>
	<div>
		<form method = "post" id = "replyFrm">
			<input type = "hidden" name = "no" value = "${vo.no }">
			<textarea maxlength = "100" name = "comment" id = "comment" cols = "50" rows = "3"></textarea>
			<input type = "submit" value = "등록">
		</form>
	</div>
	
	<div id = "replyList">
		<ul>
			
		</ul>
	</div>
</div>
