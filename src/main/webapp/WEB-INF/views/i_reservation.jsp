<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAV. 모든 채식 스타일러를 위해</title>
<link rel="stylesheet" href="css/z_ui.css">
<link rel="stylesheet" href="css/z_paging.css">
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
</head>

<body>
    <div class="container">
		
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
        <main id="reserveMain">
            <div class="received-restau">
                <div class="restauInform">
                    <h1>${param.restauName}</h1>
                    <p>${param.restauAddr}</p>
                </div>
                <div id="backimg">
                    <div id="imagebox">
                        <img src="media/f_restaurent/${param.restauImg1}.jpg" alt="" class="fade">
                        <img src="media/f_restaurent/${param.restauImg2}.jpg" alt="" class="fade">
                        <img src="media/f_restaurent/${param.restauImg3}.jpg" alt="" class="fade">
                        <div class="nav">
                            <button id="left">⟨</button>
                            <button id="right">⟩</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="makeReserve-cont">
                <div class="reserve-form">
                    <form:form modelAttribute="reservationVO" action="reservationSubmit" method="post">
                        <table>
                            <tbody>
                                <tr>
                                    <!-- 한글만 입력 -->
                                    <th>예약자 이름<span>*</span></th>
                                    <td><form:input path="memberName" type="text" name="memberName" id="memberName" required="required" spellcheck="false" value="${sessionScope.account.memberName}" onKeyup="this.value=this.value.replace(/[^가-힣]/g,'');" pattern="^([가-힣]){2,5}$"/></td>
                                </tr>
                                <tr>
                                    <!-- JS로 현재시간보다 하루 이후로 설정 -->
                                    <th>날짜 / 시간<span>*</span></th>
                                    <td><form:input path="reservationDate" type="datetime-local" name="reservationDate" id="reservationDate" required="required"/></td>
                                </tr>
                                <tr>
                                    <th>인원<span>*</span></th>
                                    <td><form:input path="personnel" type="number" name="personnel" id="personnel" required="required" min="1" max="5"/></td>
                                </tr>
                                <tr>
                                    <th>휴대폰<span>*</span></th>
                                    <td>
                                        <form:input path="memberContact" type="text" name="memberContact" id="memberContact" maxlength="11" required="required" spellcheck="false" placeholder="- 없이 숫자만 입력하세요"
                                            onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${sessionScope.account.memberContact}"/>
                                    </td>
                                </tr>
                                <tr>
                                	<th>예약금(₩/원)<span>*</span></th>
                                    <td>
                                        <form:input path="charge" type="text" name="charge" id="charge" value="" readonly="readonly"/><br /><br />
                                        <input type="hidden" name="couponName" id="couponName" value=""/>
                                        <select id="selectedCP" name="selectedCP" onchange="checkTotal()">
                                        	<optgroup label="나의 쿠폰">
                                        		<option value="0" disabled="disabled" selected="selected">쿠폰을 선택하세요</option>
                                       	 		<c:forEach var="myCp" items="${myCoupon}">
                                        		<option value="${myCp.couponDC}">${myCp.couponName}</option>
                                       			</c:forEach>
                                       			<option value="0">선택안함</option>
                                        	</optgroup>
                                       	</select>
                                    </td>
                                </tr>
                                <tr>
                                	<form:hidden path="restauName" name="restauName" value="${param.restauName}"/>
                                	<form:hidden path="restauAddr" name="restauAddr" value="${param.restauAddr}"/>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="2" id="caution-title">&#10094;유의사항&#10095;</th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <ul style="text-align:left; margin-left:2rem;" id="cautionList">
                                            <li>* 본 예약은 예약금을 지불하는 선예약제 입니다.</li>
                                            <li>* 예약 확정 시 기재한 휴대폰 번호로 문자를 보내드립니다.</li>
                                            <li>* 예약금은 즉시 전달되므로 페이브를 통한 환불은 불가합니다.</li>
                                            <li id="caution-remark">&nbsp;&nbsp;&nbsp;(경우에 따라 예약한 식당을 통해 환불이 가능합니다.)
                                            </li>
                                            <li>*5명 이상 단체 예약은 식당에 직접 문의하시기 바랍니다.</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                        <button type="submit" id="reserveBtn">예약하기</button>
                    </form:form>
                </div>
              </div>  
        </main>
        
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
        <div id="modalContApproved">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>예약이 완료되었습니다. <br>마이페이브에서 내역을 확인하세요.</p>
                <button id="reservationModalBtn">확인</button>
            </div>
        </div>

    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
    <script type="text/javascript" src="js/z_script.js"></script>
    <script type="text/javascript" src="js/i_reservation.js"></script>
</body>
</html>