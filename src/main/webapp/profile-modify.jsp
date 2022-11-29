<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>SpaceMusic_MyProfile</title>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/profile-modify.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
  </head>

<body>

 <c:set var="udto" value="${applicationScope.udto }"/>
 <c:set var="authenticationNum" value="${requestScope.authenticationNum }"/>
	
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
          <div class="col-xs-12">
            <nav class="main-nav">
              <!-- ***** Logo Start ***** -->
              <a href="main.jsp" class="logo"> <img src="assets/images/logo.png" alt="" /> </a>
              <!-- ***** Logo End ***** -->
              <!-- ***** Search End ***** -->
              <div class="search-input" style="width: 100%">
                <form id="search" action="search.jsp">
                  <input type="text" placeholder="검색어 입력" id="searchText" name="searchKeyword" onkeypress="handle" style="width: 100%" />
                  <i class="fa fa-search"></i>
                </form>
              </div>
              <!-- ***** Search End ***** -->
              <!-- ***** Menu Start ***** -->
              <ul class="nav">
                <li class="dropdown">
                  <a href="#" class="dropdown-btn"><span style="color:#e75e8d; font-weight: bold; ">${udto.user_name }</span> 환영합니다.<img src="http://localhost:8081/upload/${udto.user_picture }" alt="" /></a>
                  <div class="dropdown-submenu">
                    <button
                      class="modalmenu"
                      style="text-align: center; padding: 5px 60px 5px 60px; background-color: rgba(0, 0, 0, 0); border: none; color: gray"
                      onclick="location.href='/getList.sm'"
                    >
                      Popular
                    </button>

                    <button
                      class="modalmenu"
                      style="text-align: center; padding: 5px 60px 5px 60px; background-color: rgba(0, 0, 0, 0); border: none; color: gray"
                      onclick="location.href='profile.jsp'"
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

	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<div class="main-profile">
					<div class="container-xs xs-4 xs-4">
    <!-- Account page navigation-->
    
					    <hr class="xs-0 xs-4">
					    <div class="row">
					    	<form action="${pageContext.request.contextPath }/profileModify.sm" method="post" name="myform" class="form-signup" id="myform" enctype="multipart/form-data">
					    		<input type="hidden" value="${udto.user_id }" name="user_id"/>
					    		<input type="hidden" value="${udto.user_picture }" name="user_pictureOld"/>
						        <div class="col-xs-4">
						            <!-- Profile picture card-->
						            <div class="card xs-4 xs-xs-0"  style="background-color:#1f2122; color:#6c757d; !important">
						                <div class="card-header">Profile Picture</div>
						                <div class="card-body text-center">
						                
							                <div id="user_picture_thumbnail" class="user_picture_thumbnail">
								               <!-- 여기에 자바스크립트에서 짠 img태그 추가 됨 -->
								               <div id="originImg">
								                   <img src="http://localhost:8081/upload/${udto.user_picture }"/>
								               </div>
								            </div>
								            <div id="user_picture_text" class="user_picture_text">
								               <!-- 여기에 자바스크립트에서 짠 textContent 추가 됨 -->
								            </div>
<!-- 						                    Profile picture image -->
<%-- 						                    <img class="img-account-profile rounded-circle mb-2" src="./assets/images/${udto.user_picture }" alt="" style="width:200px; height:200px; important!"> --%>
<!-- 						                    Profile picture help block -->
<%-- 						                    <div class="small font-italic text-muted mb-4">${udto.user_picture }</div> --%>
<!-- 						                    Profile picture upload button -->
						                    <div style="text-align:center; margin-top:20px;">
						                    	<label for="user_picture" class="user_picture_label" id="user_picture_label">프로필 사진을 선택하세요</label>
						                    </div>
              								<input type="file" name="user_picture" id="user_picture" accept="image/*" onchange="loadFile(this)"/>
						                </div>
						            </div>
						        </div>
						        
						        <div class="col-xs-8">
					            <!-- Account details card-->
					            <div class="card xs-4"  style="background-color:#1f2122; color:#6c757d; !important">
					                <div class="card-header">Account Details</div>
					                <div class="card-body">
					                    
					                    <div class="xs-3">
					                        <label class="small xs-1" for="user_name">Name</label>
					                        <input class="form-control" id="user_name" name="user_name" type="text" placeholder="이름을 입력하세요" value="${udto.user_name }">
					                    </div>
					                    
					                    <div class="row xs-3 xs-3">
					                        <div class="col-xs-6">
					                           	<label class="small xs-1" for="user_phone">Phone number</label>
					                            <input class="form-control" id="user_phone" name="user_phone" type="text" placeholder="핸드폰 번호를 입력하세요" value="${udto.user_phone }">
					                        </div>
					                        <div class="col-xs-6">
					                            <label class="small xs-1" for="user_comment">Comment</label>
					                            <textarea class="form-control" id="user_comment" name="user_comment"  placeholder="사용자의 코멘트를 입력하세요"></textarea>
					                        </div>
					                    </div>
					                    <!-- Save changes button-->
					                    <div style="text-align:center;">
					                    	<button class="btn btn-primary" type="button" onclick="fn_validation()">회원정보 변경</button>
					                    </div>
					                </div>
					            </div>
					        </div>
					    
					    	</form>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
				 
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-12">
          <p>Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved. 
          
          <br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a>  Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
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
  <script src="assets/js/profile-modify.js"></script>


  </body>

</html>
