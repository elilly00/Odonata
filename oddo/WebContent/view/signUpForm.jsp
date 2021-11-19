<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

    <title>회원 가입</title>

    <style>
      html,
      body,
      .intro {
        height: 100%;
      }

      @media (min-width: 550px) and (max-width: 750px) {
        html,
        body,
        .intro {
          height: 750px;
        }
      }

      @media (min-width: 800px) and (max-width: 850px) {
        html,
        body,
        .intro {
          height: 750px;
        }
      }

      .mask-custom {
        backdrop-filter: blur(15px);
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 3em;
        border: 2px solid rgba(255, 255, 255, 0.1);
        background-clip: padding-box;
        box-shadow: 10px 10px 10px rgba(46, 54, 68, 0.03);
      }
    </style>
  </head>
  <body>
    <section class="intro">
      <div
        class="bg-image h-100"
        style="background-size: cover; background-image: url('../img/bg.jpg')"
      >
      <a href="index.html">
        <span class="fixed-top logo my-3">
          <img
            src="../img/logo.png"
            width="80px"
            height="80px"
            alt="잠자리"
            class="mx-2"
          />
        </span>
      </a>
        <div class="mask d-flex align-items-center h-100">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-12 col-md-10 col-lg-7 col-xl-6">
                <div class="card mask-custom">
                  <div class="card-body p-5">
                    <div class="my-4">
                      <h2 class="text-center mb-5">회원 가입</h2>

                      <form action="<%= request.getContextPath() %>/insert.us" method="post" id="joinForm" name="joinForm" onsubmit="return insertValidate();">
                        <div class="row">
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="text"
                                id="uId"
                                name="uId"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uId">아이디</label>
                            </div>
                          </div>
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="password"
                                id="uPwd1"
                                name="uPwd1"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uPwd1"
                                >비밀번호</label
                              >
                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="text"
                                id="uName"
                                name="uName"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uName">이름</label>
                            </div>
                          </div>
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="password"
                                id="uPwd2"
                                name="uPwd2"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uPwd2"
                                >비밀번호 확인</label
                              >
                            </div>
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="text"
                                id="uEmailId"
                                name="uEmailId"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uEmailId"
                                >이메일</label
                              >
                            </div>
                          </div>
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <select class="form-select" id="uEmailDomain" name="uEmailDomain">
                                <option value="@gmail.com" selected>
                                  @gmail.com
                                </option>
                                <option value="@naver.com">@naver.com</option>
                                <option value="@daum.net">@daum.net</option>
                              </select>
                              <label for="uEmailDomain">주소 선택</label>
                            </div>
                          </div>
                        </div>

                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="uPhone"
                            name="uPhone"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >휴대전화</label
                          >
                        </div>

                        <div class="form-floating form-white mb-4">
                          <input
                            type="text"
                            id="uBirth"
                            name="uBirth"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uBirth"
                            >생년월일</label
                          >
                        </div>

                        <div
                          class="form-check d-flex justify-content-center mb-4"
                        >
                          <input
                            class="form-check-input me-2"
                            type="checkbox"
                            value=""
                            id="regTerms"
                            checked
                          />
                          <label class="form-check-label" for="regTerms">
                            사이트 이용약관, 개인정보 수집 및 이용 동의
                          </label>
                        </div>

                        <button
                          type="button"
                          class="btn btn-light btn-lg btn-block mx-5 mb-4"
                        >
                          결제 수단 등록
                        </button>
                        <button
                          type="button"
                          class="btn btn-light btn-lg btn-block mx-5 mb-4"
                        >
                          호스트 숙소 등록</button
                        ><br />
                        <button
                          type="submit"
                          class="btn btn-secondary btn-lg btn-block mx-5"
                        >
                          가입하기
                        </button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <script>
        /* ------------------------------------------------------------ */
        
        
        /* 1. 아이디 검사 */
        var isIdUsable = false;
        var isIdChecked = false;
        
        $('#uId').one('focus', function() {
            alert('아이디는 영어로 시작하며 최소 5자, 최대 12자의 영어와 숫자만 가능합니다.');
        });
        
        $('#uId').on('change paste keyup', function() {
            isIdChecked = false;
        });
        
        $('#uId').change(function() {
            var userId = $('#uId');
            var regExpId = /[^0-9A-Za-z]/g;
            var regExpIdStart = /^[A-Za-z]/g;
            
            if(!userId || (userId.val().length < 5 || userId.val().length > 12)) {
                userId.focus();
            } else {
                $.ajax({
                    url: 'checkId.us',
                    data: {inputId:userId.val()},
                    success: function(data) {
                        console.log(data);
                        if(data.trim() == '0' && (!regExpId.test(userId.val()) && regExpIdStart.test(userId.val()))) {
                            $("label[for='uId']").text('아이디: 사용 가능').css({'color':'green', 'font-weight':'bold'});
                            isIdUsable = true;
                            isIdChecked = true;
                        } else {
                            $("label[for='uId']").text('아이디: 사용 불가').css({'color':'red', 'font-weight':'bold'});
                            isIdUsable = false;
                            isIdChecked = false;
                        }
                    },
                    error :function(data) {
                        console.log(data);
                    }
                });
            }
        });
        
        
        /* ------------------------------------------------------------ */
        
        
        /* 2-1. 비밀번호 확인 */
        var isPwdUsable = false;
        
        $('#uPwd1').one('focus', function() {
            alert('비밀번호는 최소 8자, 최대 12자의 영어, 숫자, !, *, $, %, &만 가능합니다.');
        });
        
        $('#uPwd1').blur(function() {
            var userPwd = $(this).val();
            var regExpPwd = /[^0-9A-Za-z!*$%&]/g;
            
            if(!regExpPwd.test(userPwd) && !(userPwd.length < 8 || userPwd.length > 12)) {
                $("label[for='uPwd1']").text('비밀번호: 사용 가능').css({'color':'green', 'font-weight':'bold'});
                isPwdUsable = true;
            } else {
                $("label[for='uPwd1']").text('비밀번호: 사용 불가').css({'color':'red', 'font-weight':'bold'});
                isPwdUsable = false;
            }
        });
        
        /* 2-2. 비밀번호 중복 확인 */
        var isPwdChecked = false;
        
        $('#uPwd2').keyup(function () {
        var pwd1 = $('#uPwd1').val();
        var pwd2 = $('#uPwd2').val();
            if(pwd1 == pwd2) {
                $("label[for='uPwd2']").text('비밀번호 확인: 일치').css({'color':'green', 'font-weight':'bold'});
                isPwdChecked = true;
            } else {
                $("label[for='uPwd2']").text('비밀번호 확인: 불일치').css({'color':'red', 'font-weight':'bold'});
                isPwdChecked = false;
            }
        });
        
        
        /* ------------------------------------------------------------ */
        
        
        /* 3. 이름 확인 */
        var nameChk = false;
        
        $('#uName').one('focus', function() {
            alert('이름은 한글 이름만 가능합니다.');
        });
        
        $('#uName').blur(function() {
            var name = $(this).val();
            var regExpName = /[^가-힣]/g;
            
            if(regExpName.test(name) || name.length < 2) {
                $("label[for='uName']").text('이름: 올바르지 않음').css({'color':'red', 'font-weight':'bold'});
                nameChk = false;
            } else {
                $("label[for='uName']").text('이름').css({'color':'green', 'font-weight':'bold'});
                nameChk = true;
            }
        });
        
        
        /* ------------------------------------------------------------ */
        
        
        /* 4. 이메일 중복 검사 */
        var isEmailUsable = false;
        var isEmailChecked = false;
        
        $('#uEmailId').on('change paste keyup', function() {
            isEmailChecked = false;
        });
        
        $('#uEmailId').change(function() {
            var userEmail = $('#uEmailId');
            var emailDomain = $('#uEmailDomain');
            
            if(!userEmail) {
                userEmail.focus();
            } else {
                $.ajax({
                    url: 'checkEmail.us',
                    data: {inputEmail:userEmail.val(), inputDomain:emailDomain.val()},
                    success: function(data) {
                        console.log(data);
                        if(data.trim() == '0') {
                            $("label[for='uEmailId']").text('이메일: 사용 가능').css({'color':'green', 'font-weight':'bold'});
                            isEmailUsable = true;
                            isEmailChecked = true;
                        } else {
                            $("label[for='uEmailId']").text('이메일: 사용 불가').css({'color':'red', 'font-weight':'bold'});
                            isEmailUsable = false;
                            isEmailChecked = false;
                            userEmail.focus();
                        }
                    },
                    error :function(data) {
                        console.log(data);
                    }
                });
            }
        });
        
        $('#uEmailDomain').change(function() {
            var userEmail = $('#uEmailId');
            var emailDomain = $('#uEmailDomain');
            
            if(!userEmail) {
                alert('이메일');
                userEmail.focus();
            } else {
                $.ajax({
                    url: 'checkEmail.us',
                    data: {inputEmail:userEmail.val(), inputDomain:emailDomain.val()},
                    success: function(data) {
                        console.log(data);
                        if(data.trim() == '0') {
                            $("label[for='uEmailId']").text('이메일: 사용 가능').css({'color':'green', 'font-weight':'bold'});
                            isEmailUsable = true;
                            isEmailChecked = true;
                        } else {
                            $("label[for='uEmailId']").text('이메일: 사용 불가').css({'color':'red', 'font-weight':'bold'});
                            isEmailUsable = false;
                            isEmailChecked = false;
                        }
                    },
                    error :function(data) {
                        console.log(data);
                    }
                });
            }
        });
        
        
        /* ------------------------------------------------------------ */
        
        
        /* 5. 휴대전화 확인 */
        var phoneChk = false;
        
        $('#uPhone').one('focus', function() {
            alert('휴대전화는 010-0000-0000 형태로 입력해주세요.');
        });
        
        $('#uPhone').blur(function() {
            var phone = $(this).val();
            var regExpPhone = /^(010)-\d{4}-\d{4}/;
            
            if(regExpPhone.test(phone) && phone.length == 13) {
                $("label[for='uPhone']").text('휴대전화').css({'color':'green', 'font-weight':'bold'});
                phoneChk = true;
            } else {
                $("label[for='uPhone']").text('휴대전화: 올바르지 않음').css({'color':'red', 'font-weight':'bold'});
                phoneChk = false;
            }
        });
        
        
        /* ------------------------------------------------------------ */
        
        
        /* 6. 생년월일 확인 */
        var birthChk = false;
        
        $('#uBirth').one('focus', function() {
            alert('생년월일은 00-00-00 형태로 입력해주세요.\n   예) 99년 3월 15일생\n      → 99-03-15 입력');
        });
        
        $('#uBirth').blur(function() {
            var birth = $(this).val();
            var regExpBirth = /^\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])/;
            
            if(regExpBirth.test(birth) && birth.length == 8) {
                $("label[for='uBirth']").text('생년월일').css({'color':'green', 'font-weight':'bold'});
                birthChk = true;
            } else {
                $("label[for='uBirth']").text('생년월일: 올바르지 않음').css({'color':'red', 'font-weight':'bold'});
                birthChk = false;
            }
        });
        
        
        /* ------------------------------------------------------------ */
        
        
        /* 입력 정보 최종 확인 */
        function insertValidate() {
            $.ajax({
                url: 'confirmMail.us',
                data: {email:$('#uEmailId').val(), domain:$('#uEmailDomain').val()},
                success: function(data) {
                    console.log(data);
                },
                error :function(data) {
                    console.log(data);
                }
            });
            
            var confirmMail = confirm("입력한 메일 주소로 발송된 확인 메일을 읽은 뒤 '확인'을 눌러주세요.");
            
            if(confirmMail) {
                if(isIdUsable && isIdChecked && isPwdUsable && isPwdChecked && nameChk && isEmailUsable && isEmailChecked && phoneChk && birthChk) {
                    console.log('isIdUsbale: ' + isIdUsable);
                    console.log('isIdChecked: ' + isIdChecked);
                    console.log('isPwdUsbale: ' + isPwdUsable);
                    console.log('isPwdChecked: ' + isPwdChecked);
                    console.log('nameChk: ' + nameChk);
                    console.log('isEmailUsable: ' + isEmailUsbale);
                    console.log('isEmailChecked: ' + isEmailChecked);
                    console.log('phoneChk: ' + phoneChk);
                    console.log('birthChk: ' + birthChk);
                    return true;
                }
                else {
                    alert('입력된 정보를 확인해주세요.');
                    return false;
                }
            } else {
                alert('메일 주소를 다시 한 번 확인해주세요.');
                return false;
            }
        }
    </script>
  </body>
</html>
