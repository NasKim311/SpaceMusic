<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

    <title>Space Music</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- Mouseover Effect CSS Files-->
    <link rel="stylesheet" href="assets/css/mouseover.css" />

    <!-- modal CSS Files -->
    <link rel="stylesheet" href="assets/css/signin.css" />

    <link rel="stylesheet" type="text/css" href="assets/css/YouTubePopUp.css">
  </head>

  <body>
  
  <c:set var="udto" value="${applicationScope.udto }"/>
    <!-- ***** Preloader Start ***** -->
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots"><span></span> <span></span> <span></span></div>
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
                <form id="search" action="https://www.genie.co.kr/search/searchMain?query=" target="_blank">     <!-- 검색기능 --> 
                  <input type="text" placeholder="검색어 입력" id="searchText" name="query" onkeypress="handle" style="width: 100%" />
                  <i class="fa fa-search"></i>
                </form>
              </div>
              <!-- ***** Search End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li class="dropdown">
                  <a href="#" class="dropdown-btn"><span style="color:white; font-weight: bold; ">${udto.user_name }</span> 환영합니다.<img src="http://localhost:8081/upload/${udto.user_picture }" alt="" /></a>
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


            <div class="slidebn slidebn_wrap">
              <div class="slidebn_item item1"></div>
              <div class="slidebn_item item2">2</div>
              <div class="slidebn_item item3">3</div>
<!--               <div class="slidebn_item item4">4</div> -->
<!--               <div class="slidebn_item item5">5</div> -->
              <div class="slidebn_prev_button slidebn_button">◀</div>
              <div class="slidebn_next_button slidebn_button">▶</div>
              <ul class="slidebn_pagination"></ul>
            </div>
            <!-- ***** Most Popular Start ***** -->
            <div class="most-popular">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4><em>장르별</em> 음악</h4>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-01.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=1&user_id=${udto.user_id}'" />
                        <!--                                  <h4>발라드</h4> -->
                      </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-02.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=2&user_id=${udto.user_id}'" />
                        <!--                                  <h4>댄스</h4> -->
                      </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-03.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=3&user_id=${udto.user_id}'" />
                        <!--                                  <h4>랩/힙합</h4> -->
                      </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-04.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=4&user_id=${udto.user_id}'" />
                        <!--                                  <h4>R&B/Soul</h4> -->
                      </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-05.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=5&user_id=${udto.user_id}'" />
                        <!--                                  <h4>인디음악</h4> -->
                      </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-06.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=6&user_id=${udto.user_id}'" />
                        <!--                                  <h4>록/메탈</h4> -->
                      </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-07.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=7&user_id=${udto.user_id}'" />
                        <!--                                  <h4>트로트</h4> -->
                      </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                      <div class="item">
                        <img class="my_img" src="assets/images/popular-08.png" style="cursor: pointer" onclick="location.href='/getListByGenre.sm?genre_id=8&user_id=${udto.user_id}'" />
                        <!--                                  <h4>포크/블루스</h4> -->
                      </div>
                    </div>

                    <!-- <div class="col-lg-12">
                    <div class="main-button">
                      <a href="browse.html">인기차트 바로가기</a>
                    </div>
                  </div> -->
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Most Popular End ***** -->

            <!-- ***** Gaming Library Start ***** -->
            <!--
          <div class="gaming-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>나의</em> 재생목록</h4>
              </div>
              <div class="item">
                <ul>
                  <li><img src="assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>제로투</h4><span>김남수</span></li>
                  <li><h4>Date Added</h4><span>24/08/2036</span></li>
                  <li><h4>Hours Played</h4><span>634 H 22 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">Donwloaded</a></div></li>
                </ul>
              </div>
              <div class="item">
                <ul>
                  <li><img src="assets/images/game-02.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>Dynamite</h4><span>방탄소년단</span></li>
                  <li><h4>Date Added</h4><span>22/06/2036</span></li>
                  <li><h4>Hours Played</h4><span>740 H 52 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button"><a href="#">Donwload</a></div></li>
                </ul>
              </div>
              <div class="item last-item">
                <ul>
                  <li><img src="assets/images/game-03.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>CS-GO</h4><span>Sandbox</span></li>
                  <li><h4>Date Added</h4><span>21/04/2036</span></li>
                  <li><h4>Hours Played</h4><span>892 H 14 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">Donwloaded</a></div></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="main-button">
                <a href="profile.html">View Your Library</a>
              </div>
            </div>
          </div> -->
            <!-- ***** Gaming Library End ***** -->
            <!-- ***** Featured Games Start ***** -->
        <br>
        <br>
          <div class="row">
            <div class="col-lg-8">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4>최신음악</h4>
                </div>
                <div class="owl-features owl-carousel">
                  <div class="item">
                    <div class="thumb">
                      <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/89/457/11089457_20221028103340_500.jpg?8ca61a6bb95214f0575178534df6fd04/melon/resize/282/quality/80/optimize" alt="">
                    </div>
                    <h4>The Astronaut<br><span>jin</span></h4>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/62/364/11062364_20220922182518_500.jpg?a57bb5b9e4a17ceaf47edfdc088ad8ec/melon/resize/282/quality/80/optimize" alt="">
                    </div>
                    <h4>Rush Hour<br><span>Crush</span></h4>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/852/11078852_20221017102947_500.jpg?3afd315fe8957d40a511b9c42aeaf516/melon/resize/282/quality/80/optimize" alt="">
                    </div>
                    <h4>I love<br><span>(여자)아이들</span></h4>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/496/11078496_20221014153848_500.jpg?90c93d5c7f38394169a4c5c70683eb0b/melon/resize/282/quality/80/optimize" alt="">
                    </div>
                    <h4>ANTIFRAGILE<br><span>LE SSERAFIM (르세라핌)</span></h4>

                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/109/03/868/10903868_20220330103544_500.jpg?e89c53bde5d39b21b09e8007db5b9cc0/melon/resize/282/quality/80/optimize" alt="">
                    </div>
                    <h4>YOUNHA 6th Album Repackage 'END THEORY : Final Edition'<br><span>윤하 (YOUNHA)</span></h4>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/109/37/474/10937474_20220428225312_500.jpg?cbc115ca0a2db2fed082e94f5862e8bd/melon/resize/282/quality/80/optimize" alt="">
                    </div>
                    <h4>싸다9<br><span>싸이 (PSY)</span></h4>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-streamers">
                <div class="heading-section">
                  <h4>TOP 100</h4>
                </div>
                <ul>
                  <li>
                    <span>01</span>
                    <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/89/457/11089457_20221028103340_500.jpg?8ca61a6bb95214f0575178534df6fd04/melon/resize/282/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                    <h6>jin</h6>
                    <div class="main-button">
                      <i class="fa-solid fa-music"></i>
                      <a class="bla-1" href="https://www.youtube.com/watch?v=fheWlRUjnY4" i class="fi fi-sr-play" >듣기</a>
                    </div>
                  </li>
                  <li>
                    <span>02</span>
                    <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/89/806/10989806_20220623153505_500.jpg?35a4d0f2d14ee902dfab94e04a817303/melon/resize/282/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                    <h6>Charlie Puth With 정국</h6>
                    <div class="main-button">
                      <a class="bla-1" href="https://www.youtube.com/watch?v=a7GITgqwDVg" i class="fi fi-sr-play" >듣기</a>
                    </div>
                  </li>
                  <li>
                    <span>03</span>
                    <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/496/11078496_20221014153848_500.jpg?90c93d5c7f38394169a4c5c70683eb0b/melon/resize/282/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                    <h6>LE SSERAFIM</h6>
                    <div class="main-button">
                      <a class="bla-1" href="https://www.youtube.com/watch?v=ZNEuWldWPD4" i class="fi fi-sr-play" >듣기</a>
                    </div>
                  </li>
                  <li>
                    <span>04</span>
                    <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/34/298/11034298_20220822101843_500.jpg?d34a229786bda1750cf7718abdc6b869/melon/resize/282/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                    <h6>IVE (아이브)</h6>
                    <div class="main-button">                
                       <a class="bla-1" href="https://www.youtube.com/watch?v=F0B7HDiY-10" i class="fi fi-sr-play" >듣기</a>
                    </div>
                  </li>
                  <li>
                    <span>05</span>
                    <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/03/868/10903868_20220330103544_500.jpg?e89c53bde5d39b21b09e8007db5b9cc0/melon/resize/282/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; margin-right: 15px;">
                    <h6>윤하 (YOUNHA)</h6>
                    <div class="main-button">
                      <a class="bla-1" href="https://www.youtube.com/watch?v=BBdC1rl5sKY" i class="fi fi-sr-play" >듣기</a>
                    </div>
                    <br><br>
                    <div style="text-align: center;">
                    <button style="text-align: center; padding: 5px 60px 5px 60px; background-color: #1f2122; color: #f99; border-radius: 30px; border-color: black;"
                            onclick="location.href='/getList.sm?user_id=${udto.user_id}'">더 보기</button>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!-- ***** Featured Games End ***** -->

          <!-- ***** Live Stream Start ***** -->
          
          <div class="live-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>인기뮤직비디오</h4>
              </div>
            </div>
             <div class="row">
         
         
              <!--01-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/852/11078852_20221017102947_500.jpg?3afd315fe8957d40a511b9c42aeaf516/melon/resize/282/quality/80/optimize" alt="">
                     <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a class="bla-1" href="https://youtu.be/fCO7f0SmrDc" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="item">
                    <div class="avatar">
                      <img src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/021/37/482/2137482_20221017115456_500.jpg?c1fe5219fa5df67e5a62677b42384e5c/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>(여자)아이들</span>
                    <h4>I love</h4>
                  </div> 
                </div>
              </div>
            </div>
            
              <!--02-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/104/79/150/10479150_20200918102847_500.jpg?45d847d7dc536eecebd648786c2ea37c/melon/resize/282/quality/80/optimize" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a class="bla-1" href="https://youtu.be/gdZLi9oWNZg" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/006/72/375/672375_20220610104703_500.jpg?4d3ac0fb5368764c77e6e26dda78b180/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>방탄소년단</span>
                    <h4>Dynamite</h4>
                  </div> 
                </div>
              </div>

              <!--03-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/89/457/11089457_20221028103340_500.jpg?8ca61a6bb95214f0575178534df6fd04/melon/resize/282/quality/80/optimize" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a class="bla-1" href="https://youtu.be/c6ASQOwKkhk" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/007/25/986/725986_20221024120819_500.jpg?f23de1d5a34afc9905b1c6d4d438e308/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>jin</span>
                    <h4>The Astronaut</h4>
                  </div> 
                </div>
              </div>

              <!--04-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/106/12/483/10612483_20210521111412_500.jpg?1c2769f71815b15741622b61a75fb530/melon/resize/282/quality/80/optimize" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a class="bla-1" href="https://youtu.be/WMweEpGlu_U" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/006/72/375/672375_20220610104703_500.jpg?4d3ac0fb5368764c77e6e26dda78b180/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>방탄소년단</span>
                    <h4>Butter</h4>
                  </div> 
                </div>
              </div>

              <!--05-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/34/298/11034298_20220822101843_500.jpg?d34a229786bda1750cf7718abdc6b869/melon/resize/282/quality/80/optimize" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a class="bla-1" href="https://youtu.be/F0B7HDiY-10" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                    <div class="down-content">
                    <div class="avatar">
                      <img src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/030/55/146/3055146_20220822140953_500.jpg?09a40395f6fbbcf9859d280eee357e7f/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>IVE (아이브)</span>
                    <h4>After LIKE</h4>
                  </div> 
                </div>
              </div>

              <!--06-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/110/11/565/11011565_20220801102637_500.jpg?1d674a44faffa0ebd34d86c182463171/melon/resize/282/quality/80/optimize" alt="">
                    <div class="hover-effect">
                      <div class="live">
                      <div class="content">
                          <a class="bla-1" href="https://youtu.be/VOmIplFAGeg" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src=https://cdnimg.melon.co.kr/cm2/artistcrop/images/031/14/174/3114174_20220801095554_500.jpg?6ad95871305f927dac3c4b5e835dca5a/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>NewJeans</span>
                    <h4>Cookie</h4>
                  </div> 
                </div>
              </div>

              <!--07-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/108/44/485/10844485_20221006154824_500.jpg?b752b5ed8fad66b79e2705840630dd94/melon/resize/282/quality/80/optimize" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a class="bla-1" href="https://youtu.be/Nq3x1AkwgpY" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/008/38/654/838654_20220411094354_500.jpg?3703649606d8df48d444851e39f3528f/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>Charlie Puth</span>
                    <h4>That's Hilarious</h4>
                  </div> 
                </div>
              </div>

              <!--08-->
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                    <img class= "my_img" src="https://cdnimg.melon.co.kr/cm2/album/images/107/43/453/10743453_20211018165252_500.jpg?4a230414088a35eeff232020daf65806/melon/resize/282/quality/80/optimize" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a class="bla-1" href="https://youtu.be/sqgxcCjD04s" target="_blank"><i class="fa fa-play"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_500.jpg?61e575e8653e5920470a38d1482d7312/melon/resize/416/quality/80/optimize" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-music"></i>아이유</span>
                    <h4>strawberry moon</h4>
                  </div> 
                </div>
              </div>
          </div>
        </div>
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
            <p><a>Copyright © 2022 Korea IT Academy</a> <a>잘하는데, 이조?</a> All rights reserved.</p>
          </div>
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

    <!-- <script src="assets/js/modal.js"></script> -->
    <script src="assets/js/signIn.js"></script>

    <script src="assets/js/mainbanner.js"></script>

    <script type="text/javascript" src="assets/js/jquery-1.12.1.min.js"></script>
    <script type="text/javascript" src="assets/js/YouTubePopUp.jquery.js"></script>
  </body>
</html>