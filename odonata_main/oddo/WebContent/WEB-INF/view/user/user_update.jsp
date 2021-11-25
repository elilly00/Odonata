<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.User, java.text.SimpleDateFormat"%>
<%
  User loginUser = (User)session.getAttribute("loginUser");
  String emailId = loginUser.getUser_email().substring(0, loginUser.getUser_email().indexOf('@'));
  String emailDomain = loginUser.getUser_email().substring(loginUser.getUser_email().indexOf('@'));
  String userBirth = new SimpleDateFormat("yy-MM-dd").format(loginUser.getUser_birth());
  
  String[] selected = new String[3];
  switch(emailDomain) {
      case "@gmail.com": selected[0] = "selected"; break;
      case "@naver.com": selected[1] = "selected"; break;
      case "@daum.net": selected[2] = "selected"; break;
  }
%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>내 정보 수정</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  
  <link rel="stylesheet" href="<%= request.getContextPath() %>/style/user/user_my_page.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style/login.css" />
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

    <style>
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
  <nav class="main-navi">
  <div>
    <a class="logoo" href="<%= request.getContextPath() %>/WEB-INF/index.jsp">
      <img class="logoo" src="<%= request.getContextPath() %>/img/public_img/logo.png">
    </a>
  </div>
    <div class="menu">
      <% if(loginUser == null) { %>
      <button type="button" onclick="location.href='<%= request.getContextPath() %>/loginForm.us'" class="item menusolo hostdg">
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
      <div class="button" type="button" onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">
          <img class="profile" src="<%= request.getContextPath() %>/img/public_img/profile.png" alt="마이페이지" id="profile"  />
        </div>
      <% } %>
    </div>
  </nav>

    <section class="intro">
        <div class="mask d-flex align-items-center h-100">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-12 col-md-10 col-lg-7 col-xl-6">
                <div class="card mask-custom">
                  <div class="card-body p-5">
                    <div class="my-4">
                      <h2 class="text-center mb-5">내 정보 수정</h2>

                      <form action="<%= request.getContextPath() %>/updateUser.us" method="post" id="updateForm" name="updateForm" onsubmit="return insertValidate();">
                        <div class="row">
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="text"
                                id="uId"
                                name="uId"
                                class="form-control form-control-lg"
                                readonly
                                value="<%= loginUser.getUser_id() %>"
                              />
                              <label class="form-label" for="uId">아이디</label>
                            </div>
                          </div>
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <input
                                type="text"
                                id="uName"
                                name="uName"
                                class="form-control form-control-lg"
                                value="<%= loginUser.getUser_name() %>"
                              />
                              <label class="form-label" for="uName">이름</label>
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
                                value="<%= emailId %>"
                              />
                              <label class="form-label" for="uEmailId"
                                >이메일</label
                              >
                            </div>
                          </div>
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <select class="form-select" id="uEmailDomain" name="uEmailDomain">
                                <option value="@gmail.com" <%= selected[0] %>>@gmail.com</option>
                                <option value="@naver.com" <%= selected[1] %>>@naver.com</option>
                                <option value="@daum.net" <%= selected[2] %>>@daum.net</option>
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
                            value="<%= loginUser.getUser_phone() %>"
                          />
                          <label class="form-label" for="uPhone">휴대전화</label>
                        </div>

                        <div class="form-floating form-white mb-4">
                          <input
                            type="text"
                            id="uBirth"
                            name="uBirth"
                            class="form-control form-control-lg"
                            value="<%= userBirth %>"
                          />
                          <label class="form-label" for="uBirth">생년월일</label>
                        </div>
                        
                        <button type="submit" class="btn btn-secondary btn-block">수정</button>
                        <button type="button" class="btn btn-secondary btn-block" onclick="location.href='<%= request.getContextPath() %>/myPageForm.us'">취소</button>
                        </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section>
    
    <script>
        $("label[for='uId']").text('아이디: 수정 불가').css({'color':'green', 'font-weight':'bold'});
        
        /* ------------------------------------------------------------ */
        
        
        /* 이름 확인 */
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
        
        
        /* 이메일 중복 검사 */
        var isEmailUsable = false;
        var isEmailChecked = false;
        
        $('#uEmailId').on('change paste keyup', function() {
            isEmailChecked = false;
        });
        
        $('#uEmailId').blur(function() {
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
                        if(data.trim() == '0' || (userEmail.val() + emailDomain.val() == "<%= loginUser.getUser_email() %>")) {
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
                        if(data.trim() == '0' || userEmail.val() + emailDomain.val() == "<%= loginUser.getUser_email() %>") {
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
        
        
        /* 휴대전화 확인 */
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
        
        
        /* 생년월일 확인 */
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
                if(nameChk && isEmailUsable && isEmailChecked && phoneChk && birthChk) {
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