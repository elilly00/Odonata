<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>pwd</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="../../style/user/user_id_pw_check.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    
    <script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

</head>

<body>
  <nav class="main-navi">
    <a class="logoo" href="../../index.jsp">
      <img class="logoo" src="../../img/logo.png">
    </a>
    </div>
    <div class="button" type="button" onclick="location.href='mypage.jsp'">
      <!-- <a href="mypage.jsp"> -->
      <img class="profile" src="../../images/profile.png" alt="마이페이지" id="profile"  />
      </a>
    </div>
  </nav>
  

  <div class="main-page">
    <section class="intro">
      
      
        <div class="mask d-flex align-items-center h-100">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-12 col-md-10 col-lg-7 col-xl-6">
                <div class="card mask-custom">
                  <div class="card-body p-5">
                    <div class="my-4">
                      <h2 class="text-center mb-3">비밀번호 찾기</h2>
                      <h5 class="text-center mb-3">비밀번호는 이름, 가입한 아이디, 이메일을 통해 찾을수 있습니다.</h5>
                      
                      <form action="<%= request.getContextPath() %>/pwdfind.us" method="post" id="joinForm" name="joinForm" role="form">

                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="id"
                            name="id"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >아이디</label
                          >
                        </div>
                        
                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="name"
                            name="name"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >이름</label
                          >
                        </div>

                        <div class="form-floating form-white mb-4">
                          <input
                            type="tel"
                            id="email"
                            name="email"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            >이메일</label
                          >
                        </div>

                      

                        <div
                          class="form-check d-flex justify-content-center mb-4"
                        >
                          
                        </div>

                        
                        
                        <input type="submit" value="찾기" class="submit-btn" />
                        <!-- <input type="submit" value="취소" class="submit-btn" /> -->
                        
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


  </script>

</body>

</html>