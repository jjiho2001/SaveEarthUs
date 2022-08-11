<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js_css/home/jquery.easing.1.3.js"></script>
<script src="/js_css/home/jquery.bxslider.js"></script>
<link rel="stylesheet" href="/js_css/home/jquery.bxslider.css" type="text/css">
<style>
	#imgSlider img{width:100%; height:750px; }
	ul,li{margin:0; padding:0;list-style-type:none;}
</style>
<script>
	$(function(){
		$("#imgSlider").bxSlider({
			mode:'horizontal' //화면전환방식 'horizontal'(기본) 'vertical' 'fade'
			,slideWidth:1688 //슬라이드 폭
			,slideHeight:800 //슬라이드 높이
			,speed:3000 //속도
			,auto:true //자동시작 true, false(기본)
			,randomStart:true //랜덤 시작 true, false(기본)
			,captions:true //title속성의 값을 설명으로 표시 true,false(기본)
			,infiniteLoop:true //반복여부
			,hideControlOnEnd:true //좌우컨트롤 보여주기 true:처음과마지막에 컨트롤 표시안함
			,useCSS:false //easing 사용여부 true(easing사용안함),false(사용)
			,easing:'linear'
			/*,onSliderLoad: function(){ //slide가 로딩이 완료되면 호출되는 콜백함수
				alert("onSliderLoad 콜백함수 실행됨..")
			}*/
			,onSlideAfter:function(){//슬라이드가 움직인 후 호출되는 콜백함수
				console.log("onSlideAfter 실행됨...")
			}
		});
	})
</script>
<div id = "main_container">
	<div id="banner">
		<ul id="imgSlider">
			<li><a href="https://www.nate.com"><img src="/img/banner1.jpg" ></a></li>
			<li><a href="https://www.naver.com"><img src="/img/banner2.jpg" ></a></li>
			<li><a href=""><img src="/img/banner3.jpg" ></a></li>
			<li><a href=""><img src="/img/banner4.jpg" ></a></li>
		</ul>
	</div>
	<div id="recent_news">
		<div><h2>최신 소식</h2></div>
		<div id="recentList">
			<ul id="recentItem">
				<li>
					<a href="#">
						<img src="/img/09.jpg"/>
					</a>
					<div class="info">
						<a href="#" class="title">순환경제 컨퍼런트에 초대합니다!</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="/img/03.jpg"/>
					</a>
					<div class="info">
						<a href="#" class="title">유엔 생물다양성협약 제 15차 당사국총회 ...</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="/img/06.jpg"/>
					</a>
					<div class="info">
						<a href="#" class="title">STE, 한국생태환경연구소 물 환원 프로젝트 ...</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
