<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">
<div class = "report_container">
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
		<a href = "/report/reportList?nowPage=${prvo.nowPage }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>">목록</a>
		<c:if test = "${ManagerStatus == 'Y' }">
			<a href = "/report/reportEdit/${reportVO.no }">수정</a>
			<a href = "/report/reportDelete/${reportVO.no}">삭제</a>
		</c:if>
	</div>
</div>
