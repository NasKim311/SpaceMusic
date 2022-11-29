<%@page import="com.spaceMusic.dao.UserDAO"%>
<%@page import="com.spaceMusic.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<c:set var="user_id" value="${requestScope.user_id }"/>
	<input type="hidden" value="${user_id }" id="user_id"/>
	
	<%
		String user_id = (String)request.getAttribute("user_id");
		
		UserDAO udao = new UserDAO();
		
		application.setAttribute("udto", udao.modifyUserData(user_id));
	
	%>
		<script>
			let user_id = document.getElementById("user_id").value;	
		
			Swal.fire({
				icon: 'success',
				title: "회원정보 수정",
				text: '완료!!',
			}).then((result) => {
				if (result.isConfirmed) {
					location.href = "/getLikeSongList.sm?user_id="+user_id
				}
			})
		
	</script>



</body>
</html>