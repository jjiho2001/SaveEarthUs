<link rel = "stylesheet" href = "/js_css/report/report.css" type = "text/css">
<script type="text/javascript" src = "/js_css/report/report_list.js"></script>
<div class = "report_container">
	
	<div id = "temp_write">
		<c:if test = "${ManagerStatus == 'Y'}">
			<a href = "/report/reportWrite">글쓰기</a>
		</c:if>
	</div>
	<div id = "report_category">
		<ul id = "category">
			<li><a href = "/report/reportList?category=1">연례보고서</a></li>
			<li><a href = "/report/reportList?category=2">지구생명보고서</a></li>
			<li><a href = "/report/reportList?category=3">국문보고서</a></li>
			<li><a href = "/report/reportList?category=4">영문보고서</a></li>
		</ul>
	</div>
	<div id = "report_list">
		<ul id = "report">
			<li>번호</li>
			<li>제목</li>
			<li>등록일</li>
			
			<c:forEach var = "reportList" items = "${reportList }">
				<li>${reportList.no }</li>
				<li><a href = "/report/reportView?no=${reportList.no }&nowPage=${prvo.nowPage}<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>" alt = "${reportList.no }">${reportList.subject }</a></li>
				<li>${reportList.writedate }</li>
			</c:forEach>
		</ul>
	</div>
	<div>
		<ul id = "page">
			<c:if test = "${prvo.nowPage > 1 }"><!-- 이전 page가 있을 때 -->
				<li><a href = "/report/reportList?category=${prvo.category }&nowPage=${prvo.nowPage-1 }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>">prev</a></li>
			</c:if>
			<c:forEach var = "p" begin = "${prvo.startPage }" end = "${prvo.startPage + prvo.onePageCount - 1 }">
				<!-- 출력할 page 번호가 총 page보다 작거나 같을 때 -->
				<c:if test = "${p <= prvo.totalPage}">
					
					<li 
					
					<c:if test = "${p == prvo.nowPage }">
						style = "background-color : #f00"; color : #fff;"
					</c:if>
					
					><a href = "/report/reportList?category=${prvo.category }&nowPage=${p }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>">${p }</a></li>
					
				</c:if>
			</c:forEach>
			
			<!-- 다음 page -->
			<c:if test = "${prvo.nowPage < prvo.totalPage }">
				<li><a href = "/report/reportList?category=${prvo.category }&nowPage=${prvo.nowPage + 1 }<c:if test='${prvo.searchWord!=null }'>&searchKey=${prvo.searchKey }&searchWord=${prvo.searchWord }</c:if>">next</a></li>
			</c:if>
		</ul>
	</div>
	
	<div>
		<form method = "get" action = "/report/reportList" id = "searchFrm">
			<select name = "searchKey">
				<option value = "subject">제목</option>
				<option value = "content">글내용</option>
			</select>
			<input type = "hidden" name = "category" value = "${prvo.category }">
			<input type = "text" name = "searchWord" id = "searchWord">
			<input type = "submit" name = "Search">
		</form>
	</div>
</div>
