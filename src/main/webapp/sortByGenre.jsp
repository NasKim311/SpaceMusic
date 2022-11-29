<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

    <title>SpaceMusic_Genre</title>

   
    <link rel="stylesheet" href="assets/css/list.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/animate.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- Mouseover Effect CSS Files-->
    <link rel="stylesheet" href="assets/css/mouseover.css" />

    <!-- modal CSS Files -->
    <link rel="stylesheet" href="assets/css/signin.css" />

    <!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->

 
  </head>

<body>
<c:set var="MusicList" value="${requestScope.MusicListByGenre }" />
<c:set var="MusicArr" value="${requestScope.MusicArr }" />
 <c:set var="udto" value="${applicationScope.udto }"/>
 <c:set var="getlikesong" value="${requestScope.getlikesong }" />
 <input id="MusicArr" type="hidden" value="${MusicArr }"/>
        <div class="bs-example">
            <div id="Geeks2" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button"
                                    class="close"
                                    data-dismiss="modal"
                                    aria-hidden="true" style="margin-left: 450px;"
                                    onclick="pauseYoutube();">X</button>
                        </div>
                        <!-- 해당 유튜브 음원 썸네일을 보여주는 부분 -->
                         <img style="width: 100% ; height: 100%;" id = "imageTest"
                                    src="http://img.youtube.com/vi/bLpIBiUYEds/2.jpg" /> 
                        <!-- 실질적으로 유튜브 영상이 틀어져서 노래를 재생함 -->
                        <div class="modal-body" id="youtube_player" style="display: none;"> 
                            <iframe id="Geeks3" width="450" height="350"
                                    src="">
                            </iframe>
                        </div>
                        
                         <div id="myProgress" style="display: flex; justify-content: space-between;">
                            <div id="runningtime" style="width: 40px;" >00:00</div>
                       <div style="min-width: 80%" ><div id="myBar" ></div></div>
                       <div id="songtime" style="white-space:nowrap;">00:00</div>
                  </div>
                        <div style="height: 15px;"></div>
                        <div style="text-align: center;">
                           <div style="display: inline-block; margin-right: 50px; margin-left:150px; cursor: pointer;"><a onclick="prev();">◁</a></div>
                           <div style="display: inline-block; cursor: pointer;"><a onclick="playYoutube();">▶️</a></div>
                           <div style="display: inline-block; cursor: pointer;"><a onclick="pauseYoutube();">❚❚</a></div>
                           <div style="display: inline-block; margin-left: 50px; cursor: pointer;"><a onclick="next();"> ▷</a></div>
                           <div style="display: inline-block; margin-left: 150px; cursor: pointer;"><a onclick="restart();">↻</a></div>
                       </div>
                        <div style="height: 10px;"></div>
                    </div>
                </div>
          </div>
      </div>


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

          <!-- ***** Banner Start ***** -->
          <div class="row">
          <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text" style="display: none;">
                <div class="heading-section">
                  <h4>나의 앨범</h4>
                </div>
                <div class="owl-features owl-carousel">
                  <div class="item" style="text-align: center;">
                    <div class="thumb">
                      <img src="/assets/images_final/popular-03.jpg" style="border-radius: 23px;"></img>
                      <div class="hover-effect" st>
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>쓸쓸할 때</h4> 
                  </div>
                  <div class="item" style="text-align: center;" >
                    <div class="thumb">
                      <img src="/assets/images_final/popular-04.jpg" style="border-radius: 23px;"></img>
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>나의 최애리스트</h4>
                  </div>
                  <div class="item" style="text-align: center;">
                    <div class="thumb">
                      <img src="/assets/images_final/popular-05.jpg" style="border-radius: 23px;"></img>
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>행복할 때 듣는 노래</h4>
                  </div>
                  <div class="item" style="text-align: center;">
                    <div class="thumb">
                      <img src="assets/images_final/popular-02.jpg" style="border-radius: 23px;"></img>
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>모르겟다</h4>
                  </div>
                  <div class="item" style="text-align: center;">
                    <div class="thumb">
                      <img src="assets/images_final/popular-03.jpg" style="border-radius: 23px;"></img>
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>게임할 때 듣는 노래</h4>
                  </div>
                  <div class="item" style="text-align: center;">
                    <div class="thumb">
                      <img src="assets/images_final/popular-02.jpg" style="border-radius: 23px;" alt=""></img>
                      <div class="hover-effect">
                        <h6>2.4K Streaming</h6>
                      </div>
                    </div>
                    <h4>헉</h4>
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
                <% 
                 String genre [] = new String[9];
                 genre[1] = "발라드"; genre[2] ="댄스";genre[3] ="랩/힙합";genre[4] ="R&B/Soul";genre[5] ="인디음악";genre[6] ="록/메탈";genre[7] ="트로트";genre[8] ="포크/블루스";
                 %>   
                    <h4><em>
                      <%=genre[Integer.parseInt(request.getParameter("genre_id"))] %>
                    </em></h4>
              </div>
              <!-- item 뒤에붙는 id 1,2,3,4는 나중에 노래번호를 붙일예정 -->
              <c:choose>
                 <c:when test="${MusicList != null && fn:length(MusicList) > 0 }">
                    <c:forEach var="music" items="${MusicList }">
                     <c:set var="flag" value="false"/>
                       <div class="item" id="item1">
                         <ul>
                         <li id="qwe">${music.music_id }   &ltTop100&gt </li>
                        <li><img width="120" height="80" src=" http://img.youtube.com/vi/${music.music_source }/2.jpg" scrolling="no" class="templatemo-item"></img></li>
                           <li id="asd"><h4>${music.music_name }</h4><span>${music.artist_name }</span></li>
                           <li><h4>재생시간</h4><span  id="music_time${music.music_id }">${music.music_time }</span></li>
                            <!-- id값의 modal1 <- 숫자 같은 경우에 DB에 숫자 값을 가져옴 -->
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
                             <c:choose>
                           	    <c:when test="${fn:length(getlikesong) != 0 }">
                           	    
                           	     <c:forEach items="${getlikesong }" var="like" varStatus="status">
                                 <c:if test="${like == music.music_id}">
                                    <li style="text-align: center;">
                                      <a href="#none" onclick="imgChange('${music.music_id}', '${udto.user_id }');" >
                                           <img id="heart${music.music_id }" src="assets/images_final/heart.png" style="width: 30px">
                                      </a>
                                   </li>
                                   <c:set var="flag" value="true"></c:set>
                                 </c:if>
                                 <c:if test="${flag == false && fn:length(getlikesong) == status.count}">
                                    <li style="text-align: center;">
                                      <a href="#none" onclick="imgChange('${music.music_id}', '${udto.user_id }');" >
                                           <img id="heart${music.music_id }" src="assets/images_final/empty_heart.png" style="width: 30px">
                                      </a>
                                   </li>
                                 </c:if>
                           		</c:forEach> 
                           	    </c:when>
                           		
                           	    <c:otherwise>
                           	    	<li style="text-align: center;">
                                      <a href="#none" onclick="imgChange('${music.music_id}', '${udto.user_id }');" >
                                           <img id="heart${music.music_id }" src="assets/images_final/empty_heart.png" style="width: 30px">
                                      </a>
                                   </li>
                           	    </c:otherwise>
                           	   </c:choose>
                           </ul>
                       </div>
                    </c:forEach>
                 </c:when>
                 <c:otherwise>
                 <ul>
                    <li><h4>장르에 맞는 곡이 없습니다</h4>
                    </li>
                 </ul>   
                 </c:otherwise>
              </c:choose>
            </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="assets/js/controller.js"></script>
 <script>
			// 좋아요 하트 눌렀을 때 실행되는 펑션
			function imgChange(music_id, user_id) {
				// 좋아요 했을 때
				if ($("#heart" + music_id).attr('src') == 'assets/images_final/empty_heart.png') {
					$.ajax({

						type : 'post',
						url : 'http://localhost:8081/likeSongInsert.sm',
						data : {
							user_id : user_id,
							music_id : music_id
						},
						success : function(data) {

							let data1 = $.trim(data);
							if (data1 == 'true') {
							} else {
							}
						},
						error : function(xhr, status, error) {
							//오류 발생 시 처리
						}

					});
					$("#heart" + music_id).attr('src',
							'assets/images_final/heart.png');

					// 좋아요 취소 했을 때
				} else {

					$.ajax({

						type : 'post',
						url : 'http://localhost:8081/likeSongDelete.sm',
						data : {
							user_id : user_id,
							music_id : music_id
						},
						success : function(data) {

							let data1 = $.trim(data);
							if (data1 == 'true') {

							} else {
							}
						},
						error : function(xhr, status, error) {
							//오류 발생 시 처리
						}

					});

					$("#heart" + music_id).attr('src',
							'assets/images_final/empty_heart.png');
				}

			}
		</script>
  </body>
</html>