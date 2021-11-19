<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="../style/user_my_page1.css" />

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
    <a class="logoo" href="../index.jsp">
      <img class="logoo" src="../img/logo.png">
    </a>
    </div>
    <div class="button" type="button" onclick="location.href='mypage.jsp'">
      <!-- <a href="mypage.jsp"> -->
      <img class="profile" src="../images/profile.png" alt="마이페이지" id="profile"  />
      </a>
    </div>
  </nav>

  <!-- <div class="main-page"> -->
    <section class="intro">
      
      
        <div class="mask d-flex align-items-center h-100">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-12 col-md-10 col-lg-7 col-xl-6">
                <div class="card mask-custom">
                  <div class="card-body p-5">
                    <div class="my-4">
                      <h2 class="text-center mb-5">내 정보</h2>

                      <form action="<%= request.getContextPath() %>/insert.us" method="post" id="joinForm" name="joinForm" onsubmit="return insertValidate();">
                        <div class="row">
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <box
                                type="text"
                                id="uId"
                                name="uId"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uId"></label>
                            </div>
                          </div>
                          <div class="col-12 col-md-6 mb-4">
                            <div class="form-floating form-white">
                              <box
                                type="name"
                                id="name1"
                                name="name1"
                                class="form-control form-control-lg"
                              />
                              <label class="form-label" for="uPwd1"
                                ></label
                              >
                            </div>
                          </div>
                        </div>

                        

                        

                        <div class="form-floating form-white mb-4">
                          <box
                            type="tel"
                            id="uPhone"
                            name="uPhone"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            ></label
                          >
                        </div>

                        <div class="form-floating form-white mb-4">
                          <box
                            type="tel"
                            id="uPhone"
                            name="uPhone"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uPhone"
                            ></label
                          >
                        </div>

                        <div class="form-floating form-white mb-4">
                          <box
                            type="text"
                            id="uBirth"
                            name="uBirth"
                            class="form-control form-control-lg"
                          />
                          <label class="form-label" for="uBirth"
                            ></label
                          >
                        </div>

                        <div
                          class="form-check d-flex justify-content-center mb-4"
                        >
                          
                        </div>

                        
                        
                        <input type="submit" value="내 정보 수정" class="submit-btn" />
                        <input type="submit" value="비밀 번호 변경" class="submit-btn" />
                        <input type="submit" value="쪽지" class="submit-btn" />
                        <input type="submit" value="과거 예약 내역" class="submit-btn" />
                        <input type="submit" value="숙소 등록" class="submit-btn" />
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