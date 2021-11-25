<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="user.model.vo.User, reserv.model.vo.Reserv, rooms.model.vo.Rooms" %>

<%
	User loginUser = (User)session.getAttribute("loginUser");
	Reserv r = (Reserv)request.getAttribute("reserv");
	Rooms room = (Rooms)request.getAttribute("rooms");
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<title>예약페이지</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
		integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link rel="stylesheet" href="<%= request.getContextPath() %>/style/main.css" />
	<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>


	<!-- 아임포트 라이브러리 : jQuery 1.0이상 필요-->
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<meta charset="UTF-8">
	<style>
		.main-navi {
			/* 화면상단에 붙어있는 포지션 */
			padding-right: 100px;
			position: sticky;
			top: 0;
			background-color: #f2bba7;
			width: 100%;
			height: 90px;
			padding: 5 70px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		header {
			margin: 0px;
			padding: 0px;
		}
		.content {
			font-size: 100%;
			margin-left: 100px;
			margin-right: 100px;
		}
		.checkboxDescription {
			display: inline;
			font-size: 0.8em;
		}
		#paymentChoice {
			width: 400px;
			height: 30px;
		}
		#refund_notice {
			border: 1px solid black;
			width: 100%;
			height: 100px;
			overflow-y: scroll;
			font-size: 0.8em;
		}
		#charge_info {
			border: 1px solid black;
			width: 100%;
			height: 100px;
		}
		.agree {
			font-size: 0.8em;
			display: inline-block;
		}
		#mandatory {
			font-size: 0.8em;
			color: blue;
		}
		#choice {
			font-size: 0.8em;
			color: gray;
		}
		input {
			padding: 5px;
			border: 1px solid #dedede
		}
		input:read-only {
			background-color: #dedede
		}
		select {
			padding: 7px;
			vertical-align: middle
		}
		.info {
			width: 200px;
		}
		.em_red {
			color: red;
		}
		.dyrmatpqn {
			font-size: 1.0em;
		}
		.dyrmatpqn1 {
			padding-left: 15px;
		}
		.rDateForm {
			width: 300px;
		}
		.rDateForm tr {
			text-align: middle;
		}
	</style>
	<title>Insert title here</title>
</head>

<body>
	<form action="<%= request.getContextPath() %>/" method="post" id="reservationForm" name="reservationForm">

		<nav class="main-navi">
			<div class="logo">
				<a href="../index.jsp">
					<div class="logo">
						<img src="<%= request.getContextPath() %>/img/logo.png" width="80px" height="80px" alt="잠자리"
							class="mx-2" />
					</div>
				</a>
			</div>
			<div class="menu">
				<% if(loginUser == null) { %>
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/loginForm.us'"
					class="item menusolo hostdg">
					로그인/회원가입
				</button>
				<% } else { %>
				<div id="userInfo" align="right">
					<%-- <label> <%= loginUser.getUser_name() %> 님의 방문을 환영합니다. </label>
					<br clear="all"> --%>
					<div class="menu">
						<%-- <input type="button" class="item menusolo hostdg" value="내 정보 보기" onclick="location.href='<%= request.getContextPath() %>/myPage.me'">
						--%>
						<input type="button" class="item menusolo hostdg" value="로그 아웃"
							onclick="location.href='<%= request.getContextPath() %>/logout.me'">
					</div>
				</div>
				<div class="item menusolo">
				</div>
				<div class="button" type="button"
					onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">
					<img class="profile" src="<%= request.getContextPath() %>/img/public_img/profile.png" alt="마이페이지"
						id="profile" />
				</div>
				<% } %>
			</div>
		</nav>

		<div class="content">
			<br>
			<h2>예약정보</h2> <br />
			<p id="reservation_info">
				<!-- 받아와서 화면에 뿌려야할 부분들 : 숙소명, 체크인, 체크아웃, 숙소이름, 이름, 전화번호, 이메일 -->
				<b id="rName"><%= room.getRooms_name() %></b><br><br> <!-- 숙소명 -->
				<b id="rDate">날짜</b><br />
				<table class="rDateForm">
					<tr>
						<td>체크인</td>
						<td>체크아웃</td>
					</tr>
					<tr>
						<th><%= r.getCheck_in() %></th> <!-- reserv 체크인 -->
						<th><%= r.getCheck_out() %></th> <!-- reserv 체크아웃 -->
					</tr>
				</table>
				<br>
				<b id=rGuest>게스트</b><br />
				<%= r.getPersonnel() %>
			</p>
			<br>

			<hr /><br />
			<h2 style="display: inline">예약자 정보</h2>
			<br /><br>
			<table>
				<tr>
					<th scope="row">이름 <span class="em_red">*</span></th> <!-- loginuser -->
					<td></td>
					<td></td>
					<td></td>
					<td>
						<!-- 						<input type="text" id="name" name="name" class="info" placeholder="이름을 입력해주세요" required /> -->
						<%= loginUser.getUser_name() %>
					</td> <!-- LoginUser로 받아오기 -->
				</tr>
				<tr>
					<th scope="row">전화번호 <span class="em_red">*</span></th>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<!-- 						<input type="tel" id="tel" name="tel" class="info" placeholder="'-'을 제외하고 입력해주세요" required />  LoginUser로 받아오기 -->
						<%= loginUser.getUser_phone() %>
					</td>
				</tr>
				<tr>
					<th scope="row">이메일 <span class="em_red">*</span></th>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<!-- LoginUser로 받아오기 -->
						<!-- 					<input type="text" name="email1" id="email1" class="info" placeholder="이메일"> @
						<input type="text" name="email2" id="email2" class="info" placeholder="이메일 도메인">
						<select class="select" title="이메일 도메인 주소 선택" name="select_email" onChange="selectEmail(this)">
							<option value="" selected>선택하세요</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="korea.com">korea.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="1">직접입력</option>
						</select>   -->
						<%= loginUser.getUser_email() %>
					</td>
				</tr>
			</table>
			<br /><br />

			<hr /><br />
			<h2>요금 세부 정보</h2><br />
			<div class="dyrmatpqn">
				<table>
					<tr>
						<th class="dyrmatpqn1">총 금액</th>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<p id="amount"><%= r.getReserv_Price() %></p>
						</td> <!-- reserv 받아오기 -->
						<td>원</td>
					</tr>
				</table>
			</div>
			<br>

			<hr />
			<br />

			<h2>환불정책</h2> <br />
			<div id="refund_notice">
				숙소 환불 정책<br />
				게스트가 전액 환불을 받을 수 있다고 할 때, '전액'은 숙박비를 지칭합니다.에어비앤비 게스트 수수료 환불 여부는 여러 요인에 따라 달라질 수 있습니다.<br />
				게스트가 체크인 전에 취소하면 호스트에게 청소비가 지급되지 않습니다.<br /><br />
				유연<br />
				게스트는 체크인 24시간 전까지 예약을 취소할 경우 전액 환불받을 수 있으며, 호스트에게는 대금이 지급되지 않습니다.<br />
				그 후에 취소하는 경우, 이미 숙박한 일수와 하루치의 숙박비 전액이 호스트에게 지급됩니다.<br /><br />
				일반<br />
				게스트가 체크인 5일 전까지 예약을 취소한다면 전액 환불받을 수 있으며, 호스트에게는 대금이 지급되지 않습니다.<br />
				그 후에 취소하는 경우, 이미 숙박한 일수와 하루치의 숙박비 전액 및 남은 숙박 일수에 대한 숙박비 50%가 호스트에게 지급됩니다.<br /><br />
				비교적 엄격<br />
				게스트는 체크인까지 30일 이상 남은 시점에 취소해야 전액 환불을 받을 수 있습니다.<br />
				체크인까지 7~30일이 남은 시점에 예약을 취소하면, 숙박비 50%가 호스트에게 지급됩니다.<br />
				체크인까지 7일이 채 남지 않은 시점에 예약을 취소하면, 숙박비 전액이 호스트에게 지급됩니다.<br />
				또한 게스트가 예약 후 48시간 이내에 취소하는 경우, 체크인까지 14일 이상 남았다면 전액 환불받을 수 있습니다<br /><br />
				엄격<br />
				게스트는 예약 후 48시간 이내에 취소하고 체크인까지 14일 이상이 남은 경우에만 전액 환불을 받을 수 있습니다.<br />
				체크인까지 7~14일이 남은 시점에 예약을 취소하면, 숙박비 50%가 호스트에게 지급됩니다.<br />
				그 후에 취소하는 경우, 숙박 대금 전액이 호스트에게 지급됩니다.<br /><br />
				장기 숙박<br />
				28박 이상의 예약에는 숙소의 표준 환불 정책이 아닌 에어비앤비 장기 숙박 환불 정책이 적용됩니다.<br /><br />
				게스트는 예약 후 48시간 이내에 취소하고 체크인까지 28일 이상이 남은 경우에만 전액 환불을 받을 수 있습니다.<br />
				그 후에 예약을 취소하는 경우, 이미 숙박한 날짜의 숙박비 전액과 추가 30일에 대한 숙박비가 호스트에게 지급됩니다.<br />
				게스트가 예약을 취소하는 시점에 남은 숙박 일수가 30일 미만이라면, 남은 숙박일 전체에 대한 숙박비가 호스트에게 지급됩니다.<br /><br />
				환불 불가 옵션<br />
				일부 호스트는 수입 증대를 위해 숙소에 환불 불가 옵션을 적용하기도 합니다.<br /><br />
				매우 엄격 30일 및 매우 엄격 60일<br />
				이 정책은 특수한 경우에 에어비앤비가 허용하는 호스트만 사용할 수 있습니다.
			</div> <br />


			<p class="checkboxDescription">취소 및 환불규칙에 동의</p>
			<input type="checkbox" name="refundCheck" id="refundCheck" value="refund_check" /><span
				class="em_red">*</span><br /><br />

			<hr /><br />

			<input type="checkbox" id="all" onclick="selectAll();" /> 전체동의
			<hr width="50%" align="left" />
			<table>
				<tr>
					<td><input type="checkbox" id="age14" name="agree" onclick="selectOne();" required /></td>
					<td></td>
					<td>만 14세 이상 이용 동의 </td>
					<td>
						<p id="mandatory">[필수]</p>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="personalInfo_collect" name="agree" onclick="selectOne();" required />
					</td>
					<td></td>
					<td>개인정보 수집 및 이용 동의</td>
					<td>
						<p id="mandatory">[필수]</p>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="3rdPartyConsent" name="agree" onclick="selectOne();" required /></td>
					<td></td>
					<td>개인정보 제 3자 제공 동의</td>
					<td>
						<p id="mandatory">[필수]</p>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="Accommodation_use" name="agree" onclick="selectOne();" required />
					</td>
					<td></td>
					<td>숙소 이용 규칙 동의</td>
					<td>
						<p id="mandatory">[필수]</p>
					</td>
				</tr>
				<tr>
					<td> <input type="checkbox" id="eventSms" name="agree" onclick="selectOne();" /></td>
					<td></td>
					<td>이메일 알림 메일 및 SMS수신</td>
					<td>
						<p id="choice">[선택]</p>
					</td>
				</tr>
			</table>
			<br />

			<input type="button" id="paymentBtn" value="결제하기">
	</form>

	<script>
		// 동의사항 선택 
		var all = document.getElementById("all");
		var agree = document.getElementsByName("agree");
		function selectAll() {
			if (all.checked) {
				for (var i = 0; i < agree.length; i++) {
					agree[i].checked = true;
				}
			} else {
				for (var i = 0; i < agree.length; i++) {
					agree[i].checked = false;
				}
			}
		}
		function selectOne() {
			var count = 0;
			for (var i = 0; i < agree.length; i++) {
				if (agree[i].checked) {
					count++;
				}
			}
			if (count != 5) {
				all.checked = false;
			} else {
				all.checked = true;
			}
		}
		// 이메일 폼 : 값을 loginuser에서 받아오고 난 후에는 지울것
		// 		function selectEmail(ele) {
		// 			// ele = this
		// 			var $ele = $(ele);
		// 			var $email2 = $('input[name=email2]'); // 속성선택자 [ ]
		// 			// '1'인 경우 직접입력 
		// 			if ($ele.val() == "1") {
		// 				$email2.attr('readonly', false);
		// 				$email2.val('');
		// 			} else {
		// 				$email2.attr('readonly', true);
		// 				$email2.val($ele.val());
		// 			}
		// 		}
		// 결제페이지로 연결 -> required를 인식하기는하는데 그전에 결제 창이 뜸 
		// => required는 submit을 할때만 걸러주는 애라서 해당 함수에서 window.open을 바로 연결하지 말고 모든 필드에 값이 들어왔을 때 열리게끔 로직을 추가
		document.getElementById('paymentBtn').onclick = function () {
			// 결제스크립트에 필요
			var pName = <%= loginUser.getUser_name() %> /* document.getElementById("name").value */ ;
			var pTel = <%= loginUser.getUser_phone() %> /* document.getElementById("tel").value */ ;
			var pEmail = <%= loginUser.getUser_email() %>
				/* document.getElementById("email1").value + "@" + document.getElementById("email2").value */
			;
			// SERVICE로 넘길 데이터 
			var price = <%= r.getReserv_Price() %>; // 숙소 가격
			var vCode = <%= r.getV_code() %>; // 예약 코드
			// 선택되어야 결제가능
			var refundCheck = document.getElementById('refundCheck'); // 취소, 환불규정
			var age14 = document.getElementById('age14'); // 14세 이상 동의
			var p_collect = document.getElementById('personalInfo_collect'); // 수집 이용 동의
			var partyConsent = document.getElementById('3rdPartyConsent'); // 3자 제공
			var accomodationUse = document.getElementById('Accommodation_use'); // 숙소이용규칙
			/* --------------------------------------------------------------------------------- */
			// ※ 아임포트 : 주문 페이지에 가맹점 식별코드를 이용하여 IMP 객체를 초기화합니다.
			var IMP = window.IMP;
			var code = "imp18406886";
			IMP.init(code);
			/* 
				가맹점 식별 코드 : imp18406886
				REST API 키 : 4301146235024506
				REST API secret : 65f31c8c86859ebe1d61ec55457158bbcf97cc98043d69a46a35e37f9eebb230b539ff31319a1fb9
			
			*/
			//  결제로 넘어가지 않아야 하는 경우 설정 
			if (refundCheck.checked == false || age14.checked == false || p_collect.checked == false || partyConsent
				.checked == false || accomodationUse.checked == false) {
				if (refundCheck.checked == false) {
					msg = "취소 및 환불규칙에 동의해주세요";
					refundCheck.focus();
				} else if (age14.checked == false || p_collect.checked == false || partyConsent.checked == false ||
					accomodationUse.checked == false) {
					msg = "동의사항을 확인해주세요";
				}
				alert(msg);
			} else { // 결제요청
				IMP.request_pay({
					pg: 'html5_inicis', // pg사
					pay_method: 'card', // 결제 방식
					merchant_uid: 'merchant_' + new Date().getTime(), // ★ 결제코드로 사용 가능?
					name: rName, // 주문명
					amount: price, // 가격
					buyer_email: pEmail, // 구매자 이메일
					buyer_name: pName, // 구매자 이름
					buyer_tel: pTel, // 구매자 전화번호 
				}, function (rsp) { // 4. 고객이 결제를 완료한 후 실행되는 함수(callback) 추가
					if (rsp
						.success
					) { // 5. 콜백 함수에서 쿼리 파라미터 전달하기 : jQuery로 HTTP 요청  / 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
						jQuery.ajax({
							url: '<%= request.getContextPath() %>/reservationPayment.do',
							// [√] reservationPayment.do일 경우 결제 완료후 그대로 Rv_design01페이지에 있음 (서블릿에 내용이 없어도 결제 가능)
							method: "POST",
							data: {
								imp_uid: rsp.imp_uid, // 고유 id
								merchant_uid: rsp.merchant_uid // 상점 거래 id
							}
						}).done(function (data) { // 가맹점 서버 결제 API 성공시 로직
							// 							        console.log("결제성공"); 
							// ※ 새로운 url 요청 -> 데이터 정보를 받아 db에 저장, 마지막 결제완료 페이지까지 연결 
							// 				location.href로 url만 보내면 데이터들이 안넘어갈테니까 쿼리스트링도 같이 넣어주기
							location.href = "<%= request.getContextPath() %>/payment.bo?vCode="  + vCode;
						})
					} else { // 결제 실패시 : 알림
						var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
						alert(msg);
						// 				                request.setAttribute("msg", "결제를 실패했습니다");
						// 				        		request.getRequestDispatcher("errorPage.jsp").forward(request, response);
					}
				});
			}
		}
	</script>
</body>

</html>
