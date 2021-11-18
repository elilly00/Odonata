<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title>예약페이지</title>
    
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
      integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <link rel="stylesheet" href="../style/main.css" />
    <script src="../js/jquery-3.6.0.min.js"></script>

    <!-- 아임포트 라이브러리 -->
<!--     <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<!--     iamport.payment.js -->
<!--    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script> -->

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
        display : inline-block;
      } 
      
      #mandatory{font-size: 0.8em; color: blue;}
      
      #choice{font-size: 0.8em; color: gray;}
      
      
       input{ padding:5px; border:1px solid #dedede}  
       input:read-only{background-color:#dedede}   
       select{padding:7px; vertical-align:middle}  
       
       .info{width: 200px;} 
       .em_red{color: red;}

	   .dyrmatpqn{
		font-size: 1.0em;
		
		
		
	   }
	   .dyrmatpqn1{
		   padding-left: 15px;
		   
	   }
	


    </style>
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/" method="post" id="reservationForm" name="reservationForm">
	<!-- form 태그의 action 문구로 인해 마이 페이지, 등을 누를시 다운로드 하는거 같음 -->

		<nav class="main-navi">
	      <div class="logo">
	        <a href="../index.jsp">
	          <div class="logo">
	            <img
	              src="../img/logo.png"
	              width="80px"
	              height="80px"
	              alt="잠자리"
	              class="mx-2"
	            />
	          </div>
	        </a>
	      	</div>
	      
	   <!-- ★ 마이페이지로 이동하는 버튼 필요 : 뭔가 잘못들어간듯 -->
	   <!-- 수정 완 -->
	   <div class="button" type="button" onclick="location.href='mypage.jsp'">
            <!-- <a href="mypage.jsp"> -->
              <img
                src="../images/profile.png"
                alt="마이페이지" 
                id="profile" style="height:40px;" />
              </a>
          </div>
	    </nav>
	    
	    <div class="content"> <!-- 본문 여백위한 div인데 왜 노란줄 뜨지 -> end tag밑에 있는데 없다고 뜸, css적용은 되는듯-->
			<!-- 음?.....  -->
		      <br>
		      
		      <h2>예약정보</h2> <br />
		      <!-- ★ 1, 2 둘중에 선택필요 -->

			  <!-- 전 1번이 더 괜찮아 보여요  -->

		      <!-- 1.  -->
		      <p id="reservation_info">
		        <b>날짜</b><br/>
		       	 입력받아온 데이터 필요<br/><br/>
		        <b>게스트</b><br/>
		     	   입력받아온 데이터 필요
		      </p>
		      <br>
		      <!-- 2. -->
		      <table>
		      	<tr>
		      		<th>날짜</th>
		      		<td></td><td></td><td></td>
		      		<td> 입력받아온 데이터 필요</td>
		      		
		      	</tr>
		      	<tr>
		      		<th>게스트</th>
		      		<td></td><td></td><td></td>
		      		<td> 입력받아온 데이터 필요</td>
		      	</tr>
		      </table>
		      <br/>
		      
		
		      <hr/><br/> 
		      <h2 style="display: inline">예약자 정보</h2>
		      <p class="checkboxDescription"> &nbsp;&nbsp;&nbsp;&nbsp;회원 정보와 일치할 시 체크</p> <!-- ☆ check시 회원정보 받아오는 기능 필요 -->
		      <input type="checkbox" value="equalGuest_check" />
		      
		      <br /><br>
		      
		      <table>
		      	<tr>
		      		<th scope="row">이름 <span class="em_red">*</span></th>
		      		<td></td><td></td><td></td>
		      		<td><input type="text" id="name" name="name"  class="info" placeholder="이름을 입력해주세요" required /></td>
		      	</tr>
		      	<tr>
		      		<th scope="row">전화번호 <span class="em_red">*</span></th>
		      		<td></td><td></td><td></td>
		      		<td><input type="tel" id="tel" name="tel"  class="info" placeholder="'-'을 제외하고 입력해주세요" required /></td>
		      	</tr>
		      	<tr>
		      		<!-- type=email이 적용되지 않음 : submit에서만 적용됨 따라서 따로 정의가 필요  -->	
		      		<th scope="row">이메일 <span class="em_red">*</span></th>
		      		<td></td><td></td><td></td>
					<td> 
					
				    <input type="text" name="email1" id="email1" class="info"  placeholder="이메일" > @ 
				    <input type="text" name="email2" id="email2" class="info"  placeholder="이메일 도메인" >
				    
				    <select class="select" title="이메일 도메인 주소 선택" name="select_email" onChange="selectEmail(this)" >
						<option value="" selected>선택하세요</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="nate.com">nate.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="1">직접입력</option>
					</select>

<!-- 					<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;"> -->
<!-- 					</select> -->
					</td>
		      	</tr>
		      </table>
			  <br /><br />
		
		      <hr />
			  <br /> 
		      <h2>결제 수단</h2>  <!-- ★ 이거 구현 가능..? -->
		      <br>
		      <form> 
		        <select id="paymentChoice">
		          <!-- EditPayment design02 : 결제정보 수정 틀 디자인 -->
		          <option value="card1">카드1 : 구현가능?</option>
		          <option value="card2">카드2</option>
		          <option value="card3">카드3</option>
		        </select>
		      </form>
		
		      <br />
		      <input type="button" value="쿠폰/할인코드 입력" onclick="location.href='<%= request.getContextPath() %>/couponSelect.do'"> 
		      <!-- window open으로 작성  -->
		      <br /><br />
		    
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
		      <input type="checkbox" name="refundCheck" id="refundCheck" value="refund_check" /><span class="em_red"> *</span><br /><br /> 
		      
		
		      <hr /><br />
		      <h2>요금 세부 정보</h2><br /> <!-- 이부분 수정 필요 -->
<!-- 		      <div id="charge_info"> -->
<!-- 		      	숙박비<br /> -->
<!-- 		      	할인<br />  -->
<!-- 		      	<hr> -->
<!-- 		      	총 합계 -->
<!-- 		      </div> -->
		      <div class="dyrmatpqn">
		      	<table>
		      		<tr>
		      			<th class="dyrmatpqn1">숙박비</th>
		      			<td></td>
		      		</tr>
		      		<tr>
		      			<th>할인</th>
		      			<td></td>
		      		</tr>
		      		<tr></tr>
		      		<tr></tr>
		      		<tr></tr>
		      		<tr></tr>
		      		<tr>
		      			<th class="dyrmatpqn1">총 합계</th>
		      			<td></td>
		      		</tr>
		      	</table>
				</div>
		      
		      <br />
		      <hr /><br />
		      
		    
		      <input type="checkbox" id="all" onclick="selectAll();" /> 전체동의
		      <hr width="50%" align="left" />
		      <table>
		      	<tr>
		      		<td><input type="checkbox" id="age14" name="agree" onclick="selectOne();" required /></td>
		      		<td></td>
		      		<td>만 14세 이상 이용 동의 </td>
		      		<td><p id="mandatory">[필수]</p></td>
		      	</tr>
		      	<tr>
		      		<td><input type="checkbox" id="personalInfo_collect" name="agree" onclick="selectOne();" required /></td>
		      		<td></td>
		      		<td>개인정보 수집 및 이용 동의</td>
		      		<td><p id="mandatory">[필수]</p></td>
		      	</tr>
		      	<tr>
		      		<td><input type="checkbox" id="3rdPartyConsent" name="agree" onclick="selectOne();" required /></td>
		      		<td></td>
		      		<td>개인정보 제 3자 제공 동의</td>
		      		<td><p id="mandatory">[필수]</p></td>
		      	</tr>
		      	<tr>
		      		<td><input type="checkbox" id="Accommodation_use" name="agree" onclick="selectOne();" required /></td>
		      		<td></td>
		      		<td>숙소 이용 규칙 동의</td>
		      		<td><p id="mandatory">[필수]</p></td>
		      	</tr>
		      	<tr>
		      		<td> <input type="checkbox" id="eventSms" name="agree" onclick="selectOne();" /></td>
		      		<td></td>
		      		<td>이메일 알림 메일 및 SMS수신</td>
		      		<td><p id="choice">[선택]</p></td>
		      	</tr>
		      </table>
		       <br />
		      
		      <input type="button" id="paymentBtn" value ="결제하기">
<!-- 		      <button id="paymentBtn" value ="결제하기">결제하기 </button> -->
	      </form>
      </div> <!-- 본문 여백위한 div인데 왜 노란줄 뜨지 -> Start tag위에 있는데 없다고 뜸, css적용은 되는듯-->
      
      
      <script>
      // 동의사항 선택 
      	var all = document.getElementById("all");
      	var agree = document.getElementsByName("agree");
      	
      	function selectAll(){
      		if(all.checked){
      			for(var i = 0; i < agree.length; i++){
      				agree[i].checked = true;
      			}
      		} else {
      			for(var i = 0; i < agree.length; i++){
      				agree[i].checked = false;
      			}
      		}
      	}
      	
      	function selectOne(){
      		var count = 0;
      		
      		for(var i = 0; i < agree.length; i++){
      			if(agree[i].checked){
      				count++;
      			}
      		}
      		
      		if(count != 5){
      			all.checked = false;
      		} else {
      			all.checked = true;
      		}
      	}
      	
      	// 쿠폰 사용 링크 연결 
      	function discLink(){
      		window.open('', 'width=300, height=400');
      	}
      	
      	// 이메일 폼
       function selectEmail(ele){ 
      		// ele = this
      		var $ele = $(ele); 
      		var $email2 = $('input[name=email2]'); // 속성선택자 [ ]
      		// '1'인 경우 직접입력 
      		if($ele.val() == "1"){ 
      			$email2.attr('readonly', false); 
      			$email2.val(''); 
      		} else { 
      			$email2.attr('readonly', true); 
      			$email2.val($ele.val()); 
      		} 
      	}
      	
      	

      	// 결제페이지로 연결 -> required를 인식하기는하는데 그전에 결제 창이 뜸 
      	// => required는 submit을 할때만 걸러주는 애라서 해당 함수에서 window.open을 바로 연결하지 말고 모든 필드에 값이 들어왔을 때 열리게끔 로직을 추가해야
    	document.getElementById('paymentBtn').onclick = function(){
      		var name = document.getElementById("name").value;
      		var tel = document.getElementById("tel").value;
      		var email = document.getElementById("email1").value + "@" + document.getElementById("email2").value ;
      		// checked
      		var refundCheck = document.getElementById('refundCheck'); // 취소, 환불규정
      		var age14 = document.getElementById('age14'); // 14세 이상 동의
      		var p_collect = document.getElementById('personalInfo_collect'); // 수집 이용 동의
      		var partyConsent = document.getElementById('3rdPartyConsent'); // 3자 제공
      		var accomodationUse = document.getElementById('Accommodation_use'); // 숙소이용규칙
      		console.log(email);
      		
      		
			if (name=="" || tel=="" || email=="" || refundCheck.checked==false || age14.checked==false || p_collect.checked==false || 
				partyConsent.checked==false || accomodationUse.checked==false){
				
				var msg = "";
				if( name==""){
					msg = "이름을 확인해주세요";
					name.focus();  // 포커스 이동
 				}  else if ( tel==""){ 
 					msg = "전화번호를 확인해주세요";
 					tel.focus();
				} else if ( email==""){
					msg = "이메일을 확인해주세요";
					email.focus();
				} else if ( refundCheck.checked==false){
					msg = "취소 및 환불규칙에 동의해주세요"; 
					refundCheck.focus();  
				} else if ( age14.checked==false || p_collect.checked==false || partyConsent.checked==false || accomodationUse.checked==false){
					alert("동의사항을 확인해주세요");
				}
				
				alert(msg);

 			} else {
 				window.open('<%= request.getContextPath() %>/reservationPayment.do', 'paymentForm', 'width=815, height=530');
 			}


      	}

    	
      </script>
</body>
</html>