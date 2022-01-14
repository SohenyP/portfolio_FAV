<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="css/a_welcome.css">
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">


</head>

<body>

	<input type="hidden" name="specificPart" id="specificPart" value="${requestScope.part}" />
	<div id="containerWelcome">
		<header>
			<nav>
				<span><a href="welcome">Welcome</a></span> <span><a href="home">Home</a></span>
			</nav>
			<aside>
				<ul>
					<li><a href="">■</a><span>FAV. </span></li>
					<li><a href="">■</a><span>플렉시</span></li>
					<li><a href="">■</a><span>폴로</span></li>
					<li><a href="">■</a><span>페스코</span></li>
					<li><a href="">■</a><span>락토 오보</span></li>
					<li><a href="">■</a><span>오보 </span></li>
					<li><a href="">■</a><span>락토</span></li>
					<li><a href="">■</a><span>비건 </span></li>
					<li><a href="">■</a><span>프루테리언</span></li>
					<li><a href="">■</a><span>시작</span></li>
				</ul>
			</aside>	
			<i class="fas fa-angle-double-down"></i>
		</header>
		<div class="part" id="part0">
			<div class="inner">
				<div class="wheelevent" id="forwheel"></div>
			</div>
		</div>
		<div class="part" id="part1">
			<div class="inner">
				<div id="food1" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part2">
			<div class="inner">
				<div id="food2" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part3">
			<div class="inner">
				<div id="food3" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part4">
			<div class="inner">
				<div id="food4" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part5">
			<div class="inner">
				<div id="food5" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part6">
			<div class="inner">
				<div id="food6" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part7">
			<div class="inner">
				<div id="food7" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part8">
			<div class="inner">
				<div id="food8" class="wheelevent"></div>
			</div>
		</div>
		<div class="part" id="part9">
			<div class="inner">
				<div id="beforeHome" class="wheelevent forwheel">
					<h1>오늘 
					마음에 드는 채식 스타일을 
					시도해보는건 어떤가요?</h1>
					<h1>FAV.가 여러분을 기다립니다.</h1>
					<h1>
						<a href="home">시작합니다.</a>
					</h1>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="js/a_welcome.js"></script>
</body>
</html>