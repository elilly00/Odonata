<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Registration</title>
        <link rel="stylesheet" href="../style/Registration.css">
      </head>
      <body>
        <div class="header">
          <div class="logo">
            <label>
              <a href="../index.jsp">
               <img src="../img/logo.png" 
                alt="메인페이지" 
                id="main">
              </a>
            </label>
          </div>
          <div class="img">
            <a href="mypage.jsp">
              <img
                src="../images/profile.png"
                alt="마이페이지" 
                id="profile"/>
              </a>
          </div>
        </div>
    
        <form>
          <div class="body">
            <div>
              <h3>숙소 유형</h3>
    
              <br />
    
              <select class="kind">
                <option>숙소 유형</option>
                <option value="apt">아파트</option>
                <option value="house">주택</option>
                <option value="outhouse">별채</option>
                <option value="gesthous">게스트하우스</option>
              </select>
            </div>
    
            <br /><br />
    
            <div class="location">
              <h3>숙소 위치</h3>
              <pre>
          
    정확한 숙소 주소를 기입해주세요
        
              </pre>
              <div class="location2">
                <ul class="input">
                  <li>
                    <span>시/도</span>
                      <input type="text" placeholder="예) 서울특별시" class="location-input1"/>
                    <span>시/군/구</span>
                      <input type="text" placeholder="예) 강남구" class="location-input1" />
                  </li>
                  <li>
                    <p>도로명 주소</p>
                      <input type="text" placeholder="예) 테헤란로 14길" class="location-input2"/>
                  </li>
                  <li>
                    <p>동호수(선택사항)</p>
                      <input type="text" placeholder="예) 2층" class="location-input2"/>
                  </li> 
                  <li>
                    <p>우편번호</p>
                      <input type="text" placeholder="예) 06234" class="location-input2"/>
                  </li>
                </ul>
              </div>
            </div>
    
            <br /><br />
            
            <div class="button">
                <h3>최대 숙박 인원</h3>
                <br />
              <ul>
                <li>
                  <input type="button" onclick='count("plus1")' value="+" />
                  <span id="result1">0</span>
                  <input type="button" onclick='count("minus1")' value="-" />
                </li>
              </ul>
    
            <br />
    
              <h3>침실 개수</h3>
              <br />
              <ul>
                <li>
                  <input type="button" onclick='count("plus2")' value="+" />
                  <span id="result2">0</span>
                  <input type="button" onclick='count("minus2")' value="-" />
               </li>
            </ul> 
    
            <br />
    
              <h3>침대 개수</h3>
              <br />
              <ul>
                <li>
                  <input type="button" onclick='count("plus3")' value="+" />
                  <span id="result3">0</span>
                  <input type="button" onclick='count("minus3")' value="-" />
                </li>
              </ul>
    
            <br />
    
              <h3>욕실 개수</h3>
              <br />
              <ul>
                <li>
                  <input type="button" onclick='count("plus4")' value="+" />
                  <span id="result4">0</span>
                  <input type="button" onclick='count("minus4")' value="-" />
                </li>
              </ul>
        </div>
        
            <br /><br />
            
            <div class="checkin">
              <h3>셀프 체크인</h3>
              <br />
              <label class="switch-button"> 
                <input type="checkbox"/> 
                <span class="onoff-switch">
                </span> 
              </label>
            </div>
    
            <br /><br />
            
            <div>
              <h3 id="option">편의 시설</h3>
            
              <br />
            
              <input type="checkbox" value="essentials" />필수 품목(수건,휴지,치약)
              <br />
              <input type="checkbox" value="wifi" />무선인터넷 <br />
              <input type="checkbox" value="sampoo/conditioner" />샴푸/컨디셔너
              <br />
              <input type="checkbox" value="tube" />욕조 <br />
              <input type="checkbox" value="tv" />TV <br />
              <input type="checkbox" value="air conditioner" />에어컨 <br />
              <input type="checkbox" value="hair dryer" />헤어드라이어 <br />
              <input type="checkbox" value="iron" />다리미 <br />
              <input type="checkbox" value="breakfast" />조식 <br />
              <input type="checkbox" value="coffee machine" />커피머신기 <br />
              <input type="checkbox" value="kitchen" />주방 <br />
              <input type="checkbox" value="" />세탁기 <br />
              <input type="checkbox" value="" />건조기<br />
            </div>
            
            <br /><br />
            
            <div>
              <h3 id="photo">숙소 사진</h3>
              <pre>
                
    숙소 사진을 등록해주세요.
                
              </pre>
              <img id="preview" width="300" height="300" />
              <br />
              <input type="file" onchange="readURL(this);" multiple />
            </div>
            <br /><br />
            
    
            <div>
              <h3 id="explain">상세 설명</h3>
              <pre>
    
    숙소에 대해 간략하게 설명해주세요.
    숙소 근처 관광지, 맛집 등 주변 지역에 대한 정보를 설명해주세요.
    
              </pre>
        
              <textarea cols="50" rows="10" placeholder="내용을 입력해주세요"></textarea>
            </div>
    
            <br /><br />
    
            <div>
              <input type="submit" value="등록완료" class="submit" />
            </div>
          </div>
    
          <br />
        </form>
    
        <script>
          // 버튼 카운트
          function count(type)  {
            // 결과를 표시할 element
            const resultElement = document.getElementById('result1');
    
            // 현재 화면에 표시된 값
            let number = resultElement.innerText;
            
            // 더하기/빼기
            if(type === 'plus1') {
              number = parseInt(number) + 1;
            } else if(type === 'minus1')  {
              number = parseInt(number) - 1;
            }
            
            // 결과 출력
            resultElement.innerText = number;
          }
    
        </script>
       
      </body>
    </html>
