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
		
        <main>
            <div class="makeAccount-cont">
                <h1>일반회원가입</h1>
                <div class="account-form">
                    <form action="makeAccount" method="post" id="forFaver">
                        <p><span>*</span>필수입력사항</p>
                        <table>
                            <tbody>
                               <tr id="idPart">
									<th>아이디<span>*</span></th>
									<td>
										<!-- 아이디 : 6~30자 사이 영대소문자 숫자 --> 
										<input type="text" name="newId" id="newId" maxlength="30" required spellcheck="false"
										placeholder="6자리 이상의 영문 또는 영문+숫자" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9]/g,'');" pattern="^([A-Za-z0-9]).{5,30}$"> 
										<input type="hidden" name="checkDuplicatedId" required value=""/>
										<button type="button" id="checkid" class="checkInform">중복확인</button>
									</td>
								</tr>
                               <tr id="idRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="idRule">
											<li id="lengthId" class="invalid">6자리 이상 30자리 이하 영문 또는 영문+숫자</li>
											<li id="duplicateId" class="invalid">아이디 중복확인</li>
										</ul>
									</td>
								</tr>
                                <tr id="pwPart">
									<th>비밀번호<span>*</span></th>
									<td>
										<!-- 비밀번호 : 8~30자 사이 영대소문, 숫자, 특문 꼭 포함 --> 
										<input type="password" name="newPw" id="newPw" maxlength="30" required autocomplete="off"
										spellcheck="false" placeholder="비밀번호를 입력해주세요" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9#?!@$ %^&*-]/g,'');"
										pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,30}$">
									</td>
								</tr>
								<tr id="pwRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="pwRule">
											<li id="length" class="invalid">8자리 이상 30자리 이하</li>
											<li id="upper" class="invalid">영어 대문자 포함</li>
											<li id="number" class="invalid">숫자 포함</li>
											<li id="special" class="invalid">특수문자 포함</li>
										</ul>
									</td>
								</tr>
                               <tr id="pwPart2">
									<!-- 위와 동일 비번입력 -->
									<th>비밀번호 확인<span>*</span></th>
									<td>
										<input type="password" name="newPwCheck" id="newPwCheck" maxlength="30" autocomplete="off" required spellcheck="false"
										placeholder="비밀번호를 한 번 더 입력해주세요" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9#?!@$ %^&*-]/g,'');"
										pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,30}$"> 
										<span id="wrong">비밀번호가 
										다릅니다!</span>
									</td>
								</tr>
                                <tr>
                                    <!-- 한글만 입력 -->
                                    <th>이름<span>*</span></th>
                                    <td><input type="text" name="newName" id="newName" maxlength="5" required spellcheck="false" placeholder="이름을 입력하세요" onKeyup="this.value=this.value.replace(/[^가-힣]/g,'');" pattern="^([가-힣]){2,5}$"></td>	
                                </tr>
                               <tr>
									<th>이메일<span>*</span></th>
									<td>
										<!-- 이메일 : 아이디 위와 상동, @ + 나머지 --> <input type="text" name="newEmail" id="newEmail" maxlength="50" required spellcheck="false"
										placeholder="ex : fav@xxxxx.com" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9@-_.]/g,'');"
										pattern="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$"> 
										<button type="button" id="checkemail" class="checkInform">중복확인</button>
									</td>
								</tr>
								<tr id="emailRuleRow">
									<th></th>
									<td colspan="2">
										<ul id="emailRule">
											<li id="duplicateEmail" class="invalid">이메일 중복확인</li>
										</ul>
									</td>
								</tr>
                                <tr>
                                    <th>휴대폰<span>*</span></th>
                                    <td>
                                        <!-- 휴대폰 :  숫자만 입력 11자리까지 가능 -->
                                        <input type="text" name="newPhone" id="newPhone" maxlength="11" required
                                            spellcheck="false" placeholder="- 없이 숫자만 입력하세요"
                                            onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
                                            pattern="^^(010|011|016|019|018|017)([0-9]{3,4})([0-9]{4})$">
                                        <button type="button" id="checkphone">인증번호 받기</button>
                                    </td>
                                </tr>
                                <tr id="birthTr">
                                    <th>생년월일</th>
                                    <td>
                                        <div class="newBirth">
                                            <input type="text" name="yyyy" id="yyyy" maxlength="4" min="2002" max="1920" placeholder="YYYY"
                                                required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" pattern="^[1-2]{1}+[0-9]{3})$">
                                            <span></span>
                                            <input type="text" name="mm" id="mm" maxlength="2" min="01" max="12" placeholder="MM" required
                                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" pattern="^[0-9]{2}$">
                                            <span></span>
                                            <input type="text" name="dd" id="dd" maxlength="2" min="01" max="31" placeholder="DD" required
                                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" pattern="^[0-9]{2}$">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
									<th>이용약관동의<span>*</span></th>
									<td>
										<div class="all_agree">
											<input type="checkbox" name="allagrees" id="allagrees" value="all" onclick="checkedAll()"> 
											<label for="allagrees"> 
												<span class="label-text">전체 동의합니다</span>
											</label>
										</div>
										<div class="user-check1">
											<input type="checkbox" name="userChkbox" id="userChkbox1" value="Y" class="userChkbox" onclick="checkSelectAll()"> 
											<label for="userChkbox1">
												<span class="label-text">이용약관 동의</span>
											</label> 
											<button type="button">약관보기></button>
										</div>
										<div class="user-check2">
											<input type="checkbox" name="userChkbox" value="Y" id="userChkbox2" class="userChkbox" required onclick="checkSelectAll()"> 
											<label for="userChkbox2"> 
												<span class="label-text">개인정보 수집 • 이용 동의</span> 
												<span class="mandy">(필수)</span>
											</label> 
											<button type="button">약관보기></button>
										</div>
										<div class="user-check3">
											<input type="checkbox" name="userChkboxC" value="N" id="userChkbox3" class="userChkbox" onclick="checkSelectAll()"> 
											<label for="userChkbox3">
												<span class="label-text">개인정보 수집 • 이용 동의</span> 
												<span class="mandy">(선택)</span>
											</label> 
											<button type="button">약관보기></button>
										</div>
										<div class="user-check4">
											<input type="checkbox" name="userChkbox" value="Y" id="userChkbox4" class="userChkbox" required onclick="checkSelectAll()"> 
											<label for="userChkbox4">
												<span class="label-text">본인은 14세 이상입니다.</span> 
												<span class="mandy">(필수)</span> 
											</label>
										</div>
									</td>
								</tr>
                            </tbody>
                        </table>
                        <button type="submit" id="join">가입하기</button>
                    </form>
                </div>
        	</div>
        </main>
        
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
		
        <div id="modalCont-id">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>아이디를 입력해주세요.</p>
                <button id="makeAccountBtn1">확인</button>
            </div>
        </div>
        <div id="modalCont-email">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>이메일을 입력해주세요.</p>
                <button id="makeAccountBtn2">확인</button>
            </div>
        </div>
        <div id="modalCont-phone">
            <div class="modal">
                <div class="title">
                    <h2>알림메세지</h2>
                </div>
                <p>휴대폰 번호를 입력해주세요.</p>
                <button id="makeAccountBtn3">확인</button>
            </div>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/layout/mobileBar.jsp"/>
	
	<script type="text/javascript" src="js/z_backward.js"></script>
    <script src="js/d_makeAccount.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/z_script.js"></script>
</body>

</html>