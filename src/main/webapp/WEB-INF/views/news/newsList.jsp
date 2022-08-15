<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

.newsbanner {

	display: flex;
	width: 100%;
	
}
.newswrite{
	padding-top: 30px;
	padding-left: 30px;
}

.button {
	background-color: black; /* Green */
  	border: none;
  	color: white;
  	padding: 15px 32px;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 16px;
}

.button:hover {
	background-color: gray;
}

.newscontent {

	padding: 30px;
	align: center;
	
}
a>img {
	width: 100%;
	transition: all 0.2s linear;
	overflow:hidden;
	
}

a>img:hover {
	transform: scale(1.01);
	
}

.grid-container {
	
	display: grid;
	grid-gap: 30px;
	grid-template-columns: 1fr 1fr 1fr;
	
	
	
}
.date {
	padding: 10px;
	font-size: 1.1em;
	color: orange;
}
.title {
	padding: 10px;
	font-weight: bold;
	font-size: 2.5em;
}
.desc {
	padding-left: 10px;
	font-size: 1.5em;
}


</style>

<div class = "newstop">
	<img class = "newsbanner" src="../img/news/news_banner.jpg">
</div>

<div class = "newswrite">
	<button class="button" onclick="location.href='/news/newsForm';">글 작성하기</button>
</div>


<div class = "newscontent">

	<div class= "grid-container">
	
		<div class  = "news-listing">
			<a target = "_blank" href = "../img/news/news_gallery1.jpeg">
				<img src = "../img/news/news_gallery1.jpeg"  width="400" height="300">
			</a>
			<div class = "date">16 Jun 2022</div>
			<div class = "title">기후위기 대응, 전 세계가 더 과감해져야 할 때</div>
			<p class = "desc"> 
				기후변화 대응과 파리협정 이행을 중간 점검하는 국제 회의가 열렸다. 올해 11월 이집트에서 개최되는 제27차 유엔 기후변화협약 당사국총회(UNFCCC COP27)를 앞두고 지난 6월 6일부터 16일까지 독일 본에서 제56차 유엔 기후변화협약 부속기구회의(SB56)가 진행됐다. 
			</p>
		</div>
		
		<div class  = "news-listing">
			<a target = "_blank" href = "../img/news/news_gallery2.jpeg">
				<img src = "../img/news/news_gallery2.jpeg"  width="400" height="300">
			</a>
			<div class = "date">date</div>
			<div class = "title">Title</div>
			<p class = "desc"> 
				Add a description here
			</p>
		</div>
		
		<div class  = "news-listing">
			<a target = "_blank" href = "../img/news/news_gallery3.jpeg">
				<img src = "../img/news/news_gallery3.jpeg"  width="400" height="300">
			</a>
			<div class = "date">date</div>
			<div class = "title">Title</div>
			<p class = "desc"> 
				Add a description here
			</p>
		</div>
		
		<div class  = "news-listing">
			<a target = "_blank" href = "../img/news/news_gallery4.jpeg">
				<img src = "../img/news/news_gallery4.jpeg"  width="400" height="300">
			</a>
			<div class = "date">date</div>
			<div class = "title">Title</div>
			<p class = "desc"> 
				Add a description here
			</p>
		</div>
		
		<div class  = "news-listing">
			<a target = "_blank" href = "../img/news/news_gallery5.jpeg">
				<img src = "../img/news/news_gallery5.jpeg"  width="400" height="300">
			</a>
			<div class = "date">date</div>
			<div class = "title">Title</div>
			<p class = "desc"> 
				Add a description here
			</p>
		</div>
		
		<div class  = "news-listing">
			<a target = "_blank" href = "../img/news/news_gallery6.jpeg">
				<img src = "../img/news/news_gallery6.jpeg"  width="400" height="300">
			</a>
			<div class = "date">date</div>
			<div class = "title">Title</div>
			<p class = "desc"> 
				Add a description here
			</p>
		</div>
	
	</div>
	
	<!-- grid container 영역 끝  -->

</div>


<div class = "newsbottom">
	

</div>