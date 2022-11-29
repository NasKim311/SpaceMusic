<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>SpaceMusic_MyProfile</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
  </head>

<body>

<c:set var="udto" value="${applicationScope.udto }"/> 
<c:set var="MusicList" value="${requestScope.MusicList }" />
<c:set var="getlikesong" value="${requestScope.getlikesong }" />
<input id="MusicArr" type="hidden" value="${AllMusicArr }"/>
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
                    <img src="assets/images/${udto.user_picture }" alt="" style="border-radius: 23px; text-align: center;">
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <div class="main-info header-text">
                      <h4>${udto.user_name }</h4>
					<c:choose>
						<c:when test="${udto.user_comment == null }">
							<p>소개글이 없습니다.</p>
						</c:when>
						<c:otherwise>
	                      <p>${udto.user_comment }</p>
						</c:otherwise>					
					</c:choose>
                    
                    </div>
                  </div>
                  <div class="col-lg-4 align-self-center">
                    <ul>
                      <li>Email <span>${udto.user_email }</span></li>
                      <li>My Library Song<span>${fn:length(getlikesong) }</span></li>
					<div style="text-align: center;">
                    <button style="text-align: center; padding: 5px 60px 5px 60px; background-color: #1f2122; color: #f99; border-radius: 30px; border-color: black;"
                            onclick="location.href='/profile-modify.jsp'">회원정보 수정</button>
                    </div>
                    </ul>
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
                <h4>My Library</h4>
              </div>
        <c:choose>
                 <c:when test="${MusicList != null }">
                  <c:forEach  var="like" items="${getlikesong }" varStatus="status">
                    <c:forEach var="music" items="${MusicList }">
                   <c:if test="${like == music.music_id}">
                    <c:set var="flag" value="false"/>
                       <div class="item" id="item1">
                         <ul>
                         <li id="qwe">${music.music_id }   &ltTop100&gt </li>
                        <li><img width="120" height="80" src=" http://img.youtube.com/vi/${music.music_source }/2.jpg" scrolling="no" class="templatemo-item"></img></li>
                           <li id="asd"><h4>${music.music_name }</h4><span>${music.artist_name }</span></li>
                           <li><h4>재생시간</h4><span  id="music_time${music.music_id }">${music.music_time }</span></li>
<!--                             id값의 modal1 <- 숫자 같은 경우에 DB에 숫자 값을 가져옴 -->
                           <li>
                                 <h4>장르</h4><c:if test="${music.genre_id == 1}"><span>발라드</span></c:if>
                                 <c:if test="${music.genre_id == 2}"><span>댄스</span></c:if>
                                 <c:if test="${music.genre_id == 3}"><span>랩/힙합</span></c:if>
                                 <c:if test="${music.genre_id == 4}"><span>R&B/Soul</span></c:if>
                                 <c:if test="${music.genre_id == 5}"><span>인디음악</span></c:if>
                                 <c:if test="${music.genre_id == 6}"><span>록/메탈</span></c:if>
                                 <c:if test="${music.genre_id == 7}"><span>트로트</span></c:if>
                                 <c:if test="${music.genre_id == 8}"><span>포크/블루스</span></c:if>
                                </li>
                           <li><div class="main-border-button border-no-active"><a href="#Geeks2" src="${music.music_source }" data-toggle="modal" id="modal${music.music_id }" onclick="changeY(this.id);">듣기</a></div></li>
                            	<li style="text-align: center;">
                                           <img id="heart${music.music_id }" src="assets/images_final/heart.png" style="width: 30px">
                                      </a>
                                   </li>
                           </ul>
                       </div>
                     </c:if>
                    </c:forEach>
                   </c:forEach> 
                 </c:when>
              </c:choose>
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


  </body>

</html>
