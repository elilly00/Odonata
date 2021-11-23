<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Search_result</title>
        <link rel="stylesheet" href="../style/Search_Result.css" />
        <script src="../js/calendar.js"></script>
      </head>
      <body>
        <div class="header">
          <div class="logo">
            <label>
              <img onclick="location.href='<%= request.getContextPath() %>'"
                  src="../images/logo.png" 
                  alt="메인페이지"
                  id="logo">
              </a>
            </label>
          </div>
    
          <div class="searching_box">
            <div class="searching_box_inner">
              <div class="location">
                <p>위치</p>
              </div>
              <div class="location_input">
                <input id="inputLocalizacao" type="text" class="dropdown-toggle" autocomplete="off" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" placeholder="도시 또는 지역 입력"></input>
              </div>
              <div class="checkin">
                <p>체크인/체크아웃</p>
              </div>
              <div id="demo">
                <input type="text" class="datePicker" placeholder="체크인/체크아웃 선택" id="datePicker" readonly>
                <span id="calendar">
                  <div class="calendar-wrapper">
                    <div class="calendar-header">
                      <span class="leftArrow"></span>
                      <div class="calendar-mid">
                        <select class="year">
                          <opton value="1970">1970</opton>
                          <opton value="1971">1971</opton>
                          <opton value="1972">1972</opton>
                          <opton value="1973">1973</opton>
                          <opton value="1974">1974</opton>
                          <opton value="1975">1975</opton>
                          <opton value="1976">1976</opton>
                          <opton value="1977">1977</opton>
                          <opton value="1978">1978</opton>
                          <opton value="1979">1979</opton>
                          <opton value="1980">1980</opton>
                          <opton value="1981">1981</opton>
                          <opton value="1982">1982</opton>
                          <opton value="1983">1983</opton>
                          <opton value="1984">1984</opton>
                          <opton value="1985">1985</opton>
                          <opton value="1986">1986</opton>
                          <opton value="1987">1987</opton>
                          <opton value="1988">1988</opton>
                          <opton value="1989">1989</opton>
                          <opton value="1990">1990</opton>
                          <opton value="1991">1991</opton>
                          <opton value="1992">1992</opton>
                          <opton value="1993">1993</opton>
                          <opton value="1994">1994</opton>
                          <opton value="1995">1995</opton>
                          <opton value="1996">1996</opton>
                          <opton value="1997">1997</opton>
                          <opton value="1998">1998</opton>
                          <opton value="1999">1999</opton>
                          <opton value="2000">2000</opton>
                          <opton value="2001">2001</opton>
                          <opton value="2002">2002</opton>
                          <opton value="2003">2003</opton>
                          <opton value="2004">2004</opton>
                          <opton value="2005">2005</opton>
                          <opton value="2006">2006</opton>
                          <opton value="2007">2007</opton>
                          <opton value="2008">2008</opton>
                          <opton value="2009">2009</opton>
                          <opton value="2010">2010</opton>
                          <opton value="2011">2011</opton>
                          <opton value="2012">2012</opton>
                          <opton value="2013">2013</opton>
                          <opton value="2014">2014</opton>
                          <opton value="2015">2015</opton>
                          <opton value="2016">2016</opton>
                          <opton value="2017">2017</opton>
                          <opton value="2018">2018</opton>
                          <opton value="2019">2019</opton>
                          <opton value="2020">2020</opton>
                          <opton value="2021">2021</opton>
                          <opton value="2022">2022</opton>
                          <opton value="2023">2023</opton>
                          <opton value="2024">2024</opton>
                          <opton value="2025">2025</opton>
                          <opton value="2026">2026</opton>
                          <opton value="2027">2027</opton>
                          <opton value="2028">2028</opton>
                          <opton value="2029">2029</opton>
                          <opton value="2030">2030</opton>
                        </select>
                        <select class="date">
                          <option value="1">1</option> 
                          <option value="2">2</option> 
                          <option value="3">3</option> 
                          <option value="4">4</option> 
                          <option value="5">5</option> 
                          <option value="6">6</option> 
                          <option value="7">7</option> 
                          <option value="8">8</option> 
                          <option value="9">9</option> 
                          <option value="10">10</option> 
                          <option value="11">11</option> 
                          <option value="12">12</option>
                        </select>
                      </div>
                    </div>
                    <div class="dateWrap">
                      <ul class="weekTip">
                        <li class="weekend">Sun</li>
                        <li>Mon</li>
                        <li>Tue</li>
                        <li>Wed</li>
                        <li>Thur</li>
                        <li>Fri</li>
                        <li>Sat</li>
                      </ul>
                      <ul class="date">
                        <li class="disabled">31</li>
                        <li class="abled">1</li>
                        <li class="abled">2</li>
                        <li class="abled">3</li>
                        <li class="abled">4</li>
                        <li class="abled">5</li>
                        <li class="weekend">6</li>
                        <li class="weekend">7</li>
                        <li class="abled">8</li>
                        <li class="abled">9</li>
                        <li class="abled">10</li>
                        <li class="abled">11</li>
                        <li class="abled">12</li>
                        <li class="weekend">13</li>
                        <li class="weekend">14</li>
                        <li class="abled">15</li>
                        <li class="abled">16</li>
                        <li class="abled">17</li>
                        <li class="abled">18</li>
                        <li class="abled">19</li>
                        <li class="weekend">20</li>
                        <li class="weekend">21</li>
                        <li class="abled">22</li>
                        <li class="abled">23</li>
                        <li class="abled">24</li>
                        <li class="abled">25</li>
                        <li class="abled">26</li>
                        <li class="weekend">27</li>
                        <li class="weekend">28</li>
                        <li class="abled">29</li>
                        <li class="abled">30</li>
                        <li class="disabled">1</li>
                        <li class="disabled">2</li>
                        <li class="disabled">3</li>
                        <li class="disabled"></li>
                      </ul>
                    </div>
                    <span class="rightArrow"></span>
                  </div>
                </span>
            </div>
            
            <script src="./js/calendar.js"></script>
            <script>
                var trigger = document.querySelector('#datePicker');
                var dateComponent = new DatePicker({
                    el: document.querySelector('#calendar'),
                    trigger: trigger,
                    onchange: function (curr) {
                        trigger.value = curr;
                    }
                });
            
                trigger.onfocus = function () {
                    dateComponent.show();
                };
            </script>
              <div class="peoplenum">
                <p>인원 - 성인 / 유아</p>
              </div>
              
              <div class="peoplenum_input">
                
                <select class="input_box">
                  
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
                  <option value="6">6명</option>
                  <option value="7">7명</option>
                  <option value="8">8명</option>
                  <option value="9">9명</option>
                  <option value="10">10명</option>
                </select>
                <select class="input_box">
                  
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                  <option value="5">5명</option>
                  <option value="6">6명</option>
                  <option value="7">7명</option>
                  <option value="8">8명</option>
                  <option value="9">9명</option>
                  <option value="10">10명</option>
                </select>
              </div>
              <div class="search_button">
                <a class="search_button_a">
                  <button
                    class="search_img"
                    onclick="alert"
                    type="button"
                    src="./img/search.png">
                    <img 
                      class="search_img" src="./img/search.png" />
                  </button>
                </a>
              </div>
            </div>
          </div>
    
          <div class="myPage">
            <label>
              <img onclick="location.href='<%= request.getContextPath() %>/myPage.me'"
                  src="./images/profile.png"
                  alt="마이페이지" 
                  id="profile">
            </label>
          </div>
        </div>
        </div>
        <div class="header2">
          <div class="ft">
            <nav class="filter">
              <span>
                <select class="button" name="roomType">
                  <option>숙소 유형</option>
                  <option>아파트</option>
                  <option>주택</option>
                  <option>별채</option>
                  <option>게스트하우스</option>
                </select>
                <button class="button" name="Amenity" value="price">요금</button>
                <button class="button" name="Amenity" value="kichen">주방</button>
                <button class="button" name="Amenity" value="aircon">에어컨</button>
                <button class="button" name="Amenity" value="washer">세탁기</button>
                <button class="button" name="Amenity" value="pet">애완동물 동반</button>
                <button class="button" name="Amenity" value="freeP">무료 주차장</button>
                <button class="button" name="Amenity" value="breakfast">조식</button>
              </span>
            </nav>
          </div>
        </div>
    
        <div class="search_info">
          <p>00월 00일 - 00월 00일 . 게스트 2명</p>
          <h2>부산에서 위치한 숙소입니다.</h2>
          <br />
        </div>
        <div class="body">
          <div class="room_left">
            <div class="rooms">
              <img
                class="room_img_input"
                alt="방 사진"
                src="./images/room1.png"
                width="250"
                height="250"
              />
            </div>
            <div class="info">
              <pre>호스트명</pre>
              <span><b>잠자리 방</b></span>
    
              <br />
    
              <span>아파트 전체</span>
    
              <br />
    
              <span>최대 인원 N명</span>
    
              <br />
    
              <span>침실 1개</span><span> · </span> <span>침대 2개</span
              ><span> · </span><span>욕실 1개</span>
    
              <br />
    
              <span>무료 주차 공간</span><span> · </span><span>에어컨</span
              ><span> · </span><span>무료 인터넷</span>
    
              <div class="info2">
                <h3>\ 50,000 / 박</h3>
              </div>
              <div>
                <span>총액 \ 100,000</span>
                <p class="star_rating"><br /><a href="#" class="on">⭐ 4.8</a></p>
              </div>
            </div>
            
            <div class="room_left2">
              <div class="photo2">
                <img 
                  class="room_img_input" 
                  alt="방 사진1" 
                  src="./images/room2.png" 
                  width="250" 
                  height="250"
                />
              </div>
              <div class="info3">
                <pre>호스트명</pre>
                <span><b>잠자리</b></span>
                
                <br /> 
                
                <span>별채</span>
                
                <br />
                
                <span>최대 인원 N명</span>
                
                <br />
                
                <span>침실 2개</span><span> · </span>
                <span>침대 3개</span><span> · </span><span>욕실 2개</span>
                
                <br />
                
                <span>조식</span><span> · </span><span>에어컨</span><span>
                · </span><span>무료 인터넷</span>
              
              <div class="info4">
                <h3>\ 70,000 / 박</h3>
              </div>
              <div>
              </div>
                <span>총액 \ 100,000</span>
                <p class="star_rating">
                <br><a href="#" class="on">⭐ 4.6</a>
              </div>
            </div>
    
            <div class="room_left3">
              <div class="photo3">
                <img 
                  class="room_img_input" 
                  alt="방 사진3" 
                  src="./images/room3.png" 
                  width="250" 
                  height="250"
                />
              </div>
              <div class="info5">
                <pre>호스트명</pre>
                <span><b>잠자리</b></span>
                
                <br /> 
                
                <span>별채</span>
                
                <br />
                
                <span>최대 인원 N명</span>
                
                <br />
                
                <span>침실 2개</span><span> · </span>
                <span>침대 3개</span><span> · </span><span>욕실 2개</span>
                
                <br />
                
                <span>조식</span><span> · </span><span>에어컨</span><span>
                · </span><span>무료 인터넷</span>
              
                <div class="info6">
                  <h3>\ 70,000 / 박</h3>
                </div>
                <div>
                  <span>총액 \ 180,000</span>
                  <p class="star_rating">
                  <br><a href="#" class="on">⭐ 5.0</a>
                </div>
              </div>
            </div>
    
            <div class="room_left4">
              <div class="photo4">
                <img 
                  class="room_img_input" 
                  alt="방 사진4" 
                  src="./images/room1.png" 
                  width="250" 
                  height="250"
                />
              </div>
              <div class="info7">
                <pre>호스트명</pre>
                <span><b>잠자리</b></span>
                
                <br /> 
                
                <span>별채</span>
                
                <br />
                
                <span>최대 인원 N명</span>
                
                <br />
                
                <span>침실 2개</span><span> · </span>
                <span>침대 3개</span><span> · </span><span>욕실 2개</span>
                
                <br />
                
                <span>조식</span><span> · </span><span>에어컨</span><span>
                · </span><span>무료 인터넷</span>
              
                <div class="info8">
                  <h3>\ 70,000 / 박</h3>
                </div>
                <div>
                  <span>총액 \ 180,000</span>
                  <p class="star_rating">
                  <br><a href="#" class="on">⭐ 5.0</a>
                </div>
              </div>
            </div>
          </div>
          <div class="map_right">
            <div class="map">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3261.8972314302264!2d129.15316575108915!3d35.15918366593513!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35688d58be7e6c63%3A0xdd37731410008030!2z67aA7IKw6rSR7Jet7IucIO2VtOyatOuMgOq1rCDsmrAx64-ZIDY1MS0y!5e0!3m2!1sko!2skr!4v1636036959507!5m2!1sko!2skr" 
                width="650"
                height="1300"
                style="border: 0"
                allowfullscreen=""
                loading="lazy"
              ></iframe>
            </div>
          </div>
        </div>
      </body>
    </html>
    