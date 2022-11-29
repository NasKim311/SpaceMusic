<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SpaceMusic_Join</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="stylesheet" href="./assets/css/signup.css" />
  </head>
  <body>
  <c:set var="picture" value="${requestScope.picture }" />
  <c:set var="authenticationNum" value="${requestScope.authenticationNum }"/>
    <div class="background">
      <div class="signup-container">
        <form action="${pageContext.request.contextPath }/signup.sm" method="post" name="myform" class="form-signup" id="myform" enctype="multipart/form-data">
           <div class="user_picture_background">
            <div id="user_picture_thumbnail" class="user_picture_thumbnail">
               <!-- 여기에 자바스크립트에서 짠 img태그 추가 됨 -->
            </div>
            <div id="user_picture_text" class="user_picture_text">
               <!-- 여기에 자바스크립트에서 짠 textContent 추가 됨 -->
            </div>
              <label for="user_picture" class="user_picture_label" id="user_picture_label">프로필 사진을 선택하세요</label>
              <input type="file" name="user_picture" id="user_picture" accept="image/*" onchange="loadFile(this)"/>
         </div>
      
      
          <label for="user_id" class="signup__label"> Userid </label>
          <input id="user_id" name="user_id" class="signup__input" type="text" autocomplete="off" value="아이디를 입력하세요" />
          <button class="id_check_button" type="button" onclick="fn_ConfirmIdSend()">아이디 중복검사</button>
          <input id="authenticationId" type="hidden"/>

          <label for="user_pw" class="signup__label"> Password </label>
          <input id="user_pw" name="user_pw" class="signup__input" type="password" value="비밀번호를 입력하세요" />

          <label for="signup-input-passwordchk" name="signup-input-passwordchk" class="signup__label"> Password check </label>
          <input id="signup-input-passwordchk"  name="signup-input-passwordchk" class="signup__input" type="password" value="비밀번호를 입력하세요" />



          <label for="user_name" class="signup__label"> Username </label>
          <input id="user_name" name="user_name" class="signup__input" type="text" autocomplete="off" value="이름을 입력하세요" />

          <label for="user_email" class="email__label"> Email </label>
          
          
          <input id="user_email" name="user_email" class="email_check_input" type="text" autocomplete="off" value="이메일을 입력하세요" />
          <button class="email_check_button" type="button" onclick="fn_ConfirmEmailSend()">인증메일 보내기</button>
          
          <label for="user_email_chk" class="email__label"> 인증번호 </label>
          
          
          <input id="user_email_chk" name="user_email_chk" class="email_check_input" type="text" autocomplete="off" value="인증번호를 입력하세요" />
          <button class="email_check_button" type="button" onclick="fn_EmailConfirm()">이메일 인증하기</button>
          <input id="authenticationEmail" type="hidden"/>
          <input id="authenticationNum" value="${authenticationNum }" type="hidden"/>
          
          
          <label for="user_phone" class="signup__label"> Phone </label>
          <input id="user_phone" name="user_phone" class="signup__input" type="text" autocomplete="off" value="핸드폰 번호를 입력하세요" />
			
			<input id="user_comment" name="user_comment" type="hidden"/>		<!-- 유저 소개글 히든 인풋박스 -->
			
          <hr />
          <button class="signup__submit" type="button" onclick="fn_validation(this.form)">회원가입</button>
          
        </form>
      </div>
      
    </div>
  </body>
  <script src="./assets/js/signup.js"></script>
</html>