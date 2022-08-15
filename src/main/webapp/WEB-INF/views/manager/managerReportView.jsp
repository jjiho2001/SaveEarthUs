<link rel = "stylesheet" href = "/js_css/manager/manager.css" type = "text/css">
<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">

<script type="text/javascript" src = "/js_css/report/report_edit.js"></script>
<div class = "container">
	<div id = "manager_top">
		<ul>
			<li><a href = "/manager/managerForm">관리자</a></li>
			<li><a href = "/manager/managerReport?category=1">자료</a></li>
			<li>후원</li>
		</ul>
	</div>
	
	<div id = "report_view">
		<ul>
			<li>번호</li>
			<li>${reportVO.no }</li>
			<li>조회수 : ${reportVO.hit }</li>
			<li>첨부 보고서 : <a href = "/upload/report/${reportVO.filename_t }" download>${reportVO.filename_t }</a></li>
			<li>제목</li>
			<li>${reportVO.subject }</li>
			<li>글내용</li>
			<li>${reportVO.content }</li>
		</ul>
	</div>
	<div>
		<a href = "/manager/managerReport?category=${reportVO.category }&nowPage=${prvo.nowPage }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>">목록</a>
		<c:if test = "${ManagerStatus == 'Y' }">
			<a href = "/manager/managerReportEdit/${reportVO.no }">수정</a>
			<a href = "/manager/managerReportDelete/${reportVO.no}">삭제</a>
		</c:if>
	</div>
</div>
