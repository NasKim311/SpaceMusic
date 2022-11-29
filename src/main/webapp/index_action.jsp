<%@page import="com.spaceMusic.dto.UserDTO"%>
<%@page import="com.spaceMusic.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");

	System.out.println("id : " + user_id);
	System.out.println("pw : " + user_pw);

	UserDAO udao = new UserDAO();
	UserDTO udto = udao.getUser(user_id, user_pw);

	if (udto != null) {
		application.setAttribute("udto", udto);
	%>

	<script>
	
			Swal.fire({
				icon: 'success',
				title: "로그인 완료",
				text: '환영합니다.',
			}).then((result) => {
				if (result.isConfirmed) {
					location.href = "main.jsp"
				}
			})
		
	</script>

	<%
	} else {
	%>

	<script>
			
			Swal.fire({
				icon: 'error',
				title: "로그인 실패",
				text: '아이디와 비밀번호가 일치하지 않습니다.',
			}).then((result) => {
				if (result.isConfirmed) {
					history.go(-1);
				}
			})
			
	</script>

	<%
	}
	%>


</body>
</html>