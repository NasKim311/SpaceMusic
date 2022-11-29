<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>SpaceMusic_Search</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

        <!-- modal CSS Files -->
        <link rel="stylesheet" href="assets/css/modal-style.css"/>
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
  </head>

<body>
 <c:set var="udto" value="${applicationScope.udto }"/>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

    <!-- ***** Header Area Start ***** -->
   <header class="header-area header-sticky">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <nav class="main-nav">
              <!-- ***** Logo Start ***** -->
              <a href="main.jsp" class="logo"> <img src="assets/images/logo.png" alt="" /> </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Search End ***** -->
              <div class="search-input" style="width: 100%">
                <form id="search" action="https://www.genie.co.kr/search/searchMain?query=">     <!-- 검색기능 --> 
                  <input type="text" placeholder="검색어 입력" id="searchText" name="query" onkeypress="handle" style="width: 100%" />
                  <i class="fa fa-search"></i>
                </form>
              </div>
              <!-- ***** Search End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li class="dropdown">
                  <a href="#" class="dropdown-btn"><span style="color:#e75e8d; font-weight: bold; ">${udto.user_name }</span> 환영합니다.<img src="./assets/images/${udto.user_picture }" alt="" /></a>
                  <div class="dropdown-submenu">
                    <button
                      class="modalmenu"
                      style="text-align: center; padding: 5px 60px 5px 60px; background-color: rgba(0, 0, 0, 0); border: none; color: gray"
                      onclick="location.href='/getList.sm?user_id=${udto.user_id}'"
                    >
                      Popular
                    </button>

                    <button
                      class="modalmenu"
                      style="text-align: center; padding: 5px 60px 5px 60px; background-color: rgba(0, 0, 0, 0); border: none; color: gray"
                      onclick="location.href='/getLikeSongList.sm?user_id=${udto.user_id}'"
                      ;
                    >
                      My Menu
                    </button>

                    <button
                      class="modalmenu"
                      style="text-align: center; padding: 5px 60px 5px 60px; background-color: rgba(0, 0, 0, 0); border: none; color: gray"
                      onclick="location.href='index.jsp'"
                    >
                      Logout
                    </button>
                  </div>
                </li>
              </ul>
              <a class="menu-trigger"> <span>Menu</span> </a>
              <!-- ***** Menu End ***** -->
            </nav>
          </div>
        </div>
      </div>
    </header>
    <!-- ***** Header Area End ***** -->

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="assets/images/IU.jpg" style="border-radius: 23px;">
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <div class="main-info header-text">
                      <h4>아이유(이지은)</h4>
                      <p>나이 : 30(만 29)</p>
                      <p>국적 : 대한민국</p>
                      <p>생일 : 1993.05.16</p>
                      <p>데뷔(곡) : 2008.09.18<a href="">(미아)</a></p>
                        <!-- 멜론 예시
                          title="미아 재생 - 새 창" class="btn_play_song" onclick="searchLog('web_tot','ARTIST','SO','아이유','261143');melon.play.playSong('26020101',1929324);">
                        <span class="icon_play"></span>
                        <span title="19세 미만 청소년 이용불가" class="icon_song age_19">19금</span>
                        <span title="무료 음악" class="icon_song free">FREE</span>
                        <span title="홀드백(권리사의 요청으로 일정 기간 개별곡 구매 및 1분 미리 듣기 가능)" class="icon_song hold">홀드백</span> 
                        <span class="songname12">미아</span>
                      </a></p>
                      -->
                      <div class="main-border-button">
                        <a href="#">팔로우하기</a>
                        <a href="#">좋아요하기</a>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <ul>
                      <li>좋아요 <span>500k</span></li>
                      <li>팔로워 <span>1004k</span></li>
                    </ul>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="clips">
                      <div class="row">
                        <div class="col-lg-12">
                          <div class="heading-section">
                            <h4><em>아이유</em>의 인기뮤직비디오 LIST</h4>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="assets/images/잔소리.jpg" alt="cucumbercard" border="0" style="border-radius: 23px;">
                              <a href="https://www.youtube.com/watch?v=7_JEkO6KvVo" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>잔소리</h4>
                              <span><i class="fa fa-music"></i> 250</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="assets/images/분홍신.jpg" alt="" style="border-radius: 23px;">
                              <a href="https://www.youtube.com/watch?v=Q0xvVgKJxfs" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>분홍신</h4>
                              <span><i class="fa fa-music"></i> 183</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="assets/images/좋은날.jpg" alt="" style="border-radius: 23px;">
                              <a href="https://www.youtube.com/watch?v=jeqdYqsrsA0" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>좋은날</h4>
                              <span><i class="fa fa-music"></i> 141</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                          <div class="item">
                            <div class="thumb">
                              <img src="assets/images/밤편지.jpg" alt="" style="border-radius: 23px;">
                              <a href="https://www.youtube.com/watch?v=BzYnNdJhZQw" target="_blank"><i class="fa fa-play"></i></a>
                            </div>
                            <div class="down-content">
                              <h4>밤편지</h4>
                              <span><i class="fa fa-music"></i> 91</span>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="main-button">
                            <a href="#">더 많은 뮤직비디오 보기</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>아이유</em>추천 곡</h4>
              </div>
              <div class="item">
                <ul>
                  <li><a href=""><img src="assets/images/분홍신.jpg" alt="" class="templatemo-item"></a></li>
                  <li><h4><a href="#" style="font-size: 18px; ">분홍신</h4></b><a href="#">IU</a></li>
                  <li></li><li></li>
                  <li><div class="main-button"><a href="#">지금 듣기</a></div></li>
                  <li><div class="main-button"><a href="#">리스트에 추가</a></div></li>
                </ul>
              </div>
              <div class="item">
                <ul>
                  <li><a href=""><img src="assets/images/잔소리.jpg" alt="" class="templatemo-item"></a></li>
                  <li><h4><a href="#" style="font-size: 18px;">잔소리</a></h4><a href="#">IU</a>/<a href="#">임슬옹</a></li>
                  <li></li><li></li>
                  <li><div class="main-button"><a href="#">지금 듣기</a></div></li>
                  <li><div class="main-button"><a href="#">리스트에 추가</a></div></li>
                </ul>
              </div>
              <div class="item last-item">
                <ul>
                  <li><a href=""><img src="assets/images/봄사랑벚꽃말고.jpg" alt="" class="templatemo-item"></a></li>
                  <li><h4><a href="#" style="font-size: 18px;">봄 사랑 벚꽃 말고</a></h4><a href="#">IU</a>/<a href="#">HIGH4</a></li>
                  <li></li><li></li>
                  <li><div class="main-button"><a href="#">지금 듣기</a></div></li>
                  <li><div class="main-button"><a href="#">리스트에 추가</a></div></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
    <div style="position: fixed; bottom: 20px; right: 10px; width: 50px;">
      <a href="#"><img src="https://cdn-icons-png.flaticon.com/128/4160/4160970.png"> </a>
   </div>
  </div>
  
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2022 <a href="#">Korea IT Academy</a> 2조. All rights reserved. 
      </div>
    </div>
  </footer>


  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="assets/js/isotope.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/tabs.js"></script>
  <script src="assets/js/popup.js"></script>
  <script src="assets/js/custom.js"></script>

  <script src="assets/js/modal.js"></script>


  </body>

</html>
