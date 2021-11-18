<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!--  -->
	<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>
	<script>
    (function() {
        var IMP = window.IMP;
        var code = "imp18406886";  // FIXME: 가맹점 식별코드
        IMP.init(code);

        // 결제요청
        IMP.request_pay({
            // name과 amount만 있어도 결제 진행가능
            pg : 'html5_inicis', // pg 사 선택
            pay_method : 'card',  // 결제 방식
            merchant_uid : 'merchant_' + new Date().getTime(), // 결제코드로 사용 가능하려나
            // 앞의 페이지에서 받아와야 함
            name : '주문명:숙소이름', // 주문명 : 앞에서 받아와야 함
            amount : 100, // 가격 : 앞에서 받아와야 함
            buyer_email : 'iamport@siot.do', // 구매자 이메일 : 앞에서 받아와야 함
            buyer_name : '구매자이름', // 구매자 이름 : 앞에서 받아와야 함
            buyer_tel : '010-1234-5678', // 구매자 전화번호 : 앞에서 받아와야 함
//             buyer_addr : '서울특별시 강남구 삼성동',  // 주소 : 필요없을듯?
//             buyer_postcode : '123-456',  // 우편번호 : 필요없을듯
            m_redirect_url : 'https://www.yourdomain.com/payments/complete' // 구매 완료후 돌아갈 url
            	/*
            	모바일 웹 환경에서 KG이니시스, NHN KCP, JTNet, 그리고 KICC는 PC 환경과는 다르게 각 PG사의 웹사이트로 리디렉션되어 결제가 진행
				 이 경우, 결제가 완료되면 callback 함수가 실행되지 않으므로 IMP.request_pay 함수의 param.m_redirect_url 파라미터에 리디렉션 될 URL을 설정
            	*/
 
        }, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                // 결제 아이디는 앞의 페이지에서 받아와야 함  --> 음... 이걸 이렇게 메세지 창으로 띄우는것보다 결제완료화면을 만들어서 이동하는게 더 나을듯?
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                // 결제 완료시 어디로 이동할것인지도 적어주기
            } else {
                var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
            }
            alert(msg);
            
            // * 결제 정보 검증 및 저장 : 결제번호, 주문번호 추출
            // -> 여기에 작성? 아니면 새로운 jsp필요?
            // * 결제 정보 조회 
    		// * 결제 정보 검증 후 데이터베이스에 저장 : 결제를 완료한 고객이 주문내역 페이지에서 결제내역을 확인할수 있도록 결제 정보를 자체 DB에 저장
    		//							 결제 정보가 바뀔때마다 (전액/부분 환불 등) 아임포트 API를 이용해서 동기화
    		// * 결제 응답 처리
    		// * webhook을 이용해 알림 설정
    		
        });
    })();
    </script>
</body>
</html>