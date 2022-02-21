<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">    
<title>FAV. 모든 채식 스타일를 위해</title>
<link rel="stylesheet" href="css/z_ui.css">
<link rel="stylesheet" href="css/z_paging.css">
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">

</head>

<body>
    <div class="container">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
        <div id="introduceFAV" class="videoCont">
            <video id="videobg" autoplay="autoplay" muted="muted" loop="loop" preload="none">
                <source src="media/video/aboutbg1.mp4" type="video/mp4">
                <source src="media/video/aboutbg1.webm" type="video/webm">
                <source src="media/video/aboutbg1.ogg" type="video/ogg">
            </video>

            <div class="brandTitle">
                <h1>FAV.</h1>
                <p>거창한 뜻은 없습니다.</p>
                <p>다양한 스타일의 식생활로 더 나은 삶을 추구합니다.</p>
            </div>
        </div>

		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
	<script type="text/javascript" src="js/z_script.js"></script>

</body>

</html>