<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<script type="text/javascript" src = "/js_css/manager/managerSearch.js"></script>
<script type="text/javascript" src = "/js_css/manager/managerDelete.js"></script>
<div class = "container">
	<div id = "manager_top">
		<ul>
			<li>관리자</li>
			<li>자료</li>
			<li>후원</li>
		</ul>
	</div>
	<div id = "manager_bottom">
		<form method = "post" action = "/manager/managerInsert" id = "managerInsertForm">
			추가할 아이디 : 
			<input type = "text" name = "userid" id = "userid">
			<input type = "hidden" name = "username" id = "username">
			<input type = "button" value = "유저찾기" id = "managerSearch">
			<input type = "submit" value = "매니저 추가">
		</form>
		<form method = "get" action = "/manager/managerDelete" id = "managerDeleteForm">
			<ul id = "manager_list">
				<li>아이디</li>
				<li>이름</li>
				<li>&nbsp;</li>
	
				<c:forEach var = "managerList" items = "${managerList }">
					<li>${managerList.userid }</li>
					<li>${managerList.username }</li>
					<li class = "managerDelete">삭제</li>
				</c:forEach>
			</ul>
		</form>
	</div>
</div>
