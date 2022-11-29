
// 벨리데이션 체크 function
function validation() {

	let loginFrm = document.myform;
	let useridName = loginFrm.userid;
	let userpwName = loginFrm.userpw;

	// 엔터값 들어가지 않게 하는 펑션
	$(document).keypress(function(e) {
		if (e.keyCode == 13)
			e.preventDefault();
	});

	// 아이디 빈값 확인
	if (useridName.value == "") {
		Swal.fire({
			icon: 'warning',
			title: "아이디를 확인하세요",
		})
		document.getElementById('userid').focus();		// focus 안먹어서 나중에 손 볼 예정
		return false;
	}

	// 비밀번호 빈값 확인
	if (userpwName.value == "") {
		Swal.fire({
			icon: 'warning',
			title: "비밀번호를 확인하세요",
		})
		document.getElementById('userpw').focus();		// focus 안먹어서 나중에 손 볼 예정
		return false;
	}

	loginFrm.submit();

}	// validation() function



// 아이디 비밀번호 input박스 css--------------------------------------------------------

let userid = $("#userid");
let userpw = $("#userpw");

userid.focus(function() {
	if (userid.val() == "아이디를 입력하세요") {
		userid.val("");
	}
	userid.css("background-color", "skyblue");
});

userid.blur(function() {
	userid.css("background-color", "rgb(65, 52, 114)");

	if (userid.val() == "") {
		userid.css("background-color", "");
	}
});

userpw.focus(function() {
	if (userpw.val() == "비밀번호를 입력하세요") {
		userpw.val("");
	}
	userpw.css("background-color", "skyblue");
});

userpw.blur(function() {
	userpw.css("background-color", "rgb(65, 52, 114)");

	if (userpw.val() == "") {
		userpw.css("background-color", "");
	}
});



//	페이지 이동----------------------------------------------------------------------

// 회원가입 페이지 이동
$(".signup").click(function(e) {
	e.preventDefault();
	location.href = "signup.jsp";
});


// 아이디,비밀번호 찾기 페이지 이동
$(".id_pw_find").click(function(e) {
	e.preventDefault();
	location.href = "find.jsp";
});


// 추가 작업 예정-----------------------------------------------------------------------------------

// 로그인 해서 main.jsp 들어갔다가 다시 뒤로가기 했을 때 input박스에 정보 없는 기능


