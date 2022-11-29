function loadFile(input) {
	let file = input.files[0]; //선택된 파일 가져오기

	//미리 만들어 놓은 div에 text(파일 이름) 추가
	let name = document.getElementById("user_picture_text");
	name.textContent = file.name;

	//사진 업로드 성공하면 라벨 지워버림
	let label = document.getElementById("user_picture_label");
	label.innerHTML = '';

	//새로운 이미지 div 추가
	let newImage = document.createElement("img");
	newImage.setAttribute("class", "img");

	//이미지 source 가져오기
	newImage.src = URL.createObjectURL(file);

	//이미지 태그에 스타일 추가
	newImage.style.width = "100%";
	newImage.style.height = "100%";
	newImage.style.objectFit = "cover";


	//이미지를 user_picture_thumbnail div에 추가
	let container = document.getElementById("user_picture_thumbnail");
	container.appendChild(newImage);

}


let userid = $("#user_id");
let userpw = $("#user_pw");
let userpwchk = $("#signup-input-passwordchk");
let username = $("#user_name");
let useremail = $("#user_email");
let useremailchk = $("#user_email_chk");
let userphone = $("#user_phone");




userid.focus(function() {
	if (userid.val() == "아이디를 입력하세요") {
		userid.val("");
	}
	userid.css("background-color", "skyblue");
});

userid.blur(function() {
	userid.css("background-color", "rgb(65, 52, 114)");

	if (userid.val() == "") {
		userid.val("아이디를 입력하세요");
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
		userpw.val("비밀번호를 입력하세요");
		userpw.css("background-color", "");
	}
});

userpwchk.focus(function() {
	if (userpwchk.val() == "비밀번호를 입력하세요") {
		userpwchk.val("");
	}
	userpwchk.css("background-color", "skyblue");
});

userpwchk.blur(function() {
	userpwchk.css("background-color", "rgb(65, 52, 114)");

	if (userpwchk.val() == "") {
		userpwchk.val("비밀번호를 입력하세요");
		userpwchk.css("background-color", "");
	}
});

username.focus(function() {
	if (username.val() == "이름을 입력하세요") {
		username.val("");
	}
	username.css("background-color", "skyblue");
});

username.blur(function() {
	username.css("background-color", "rgb(65, 52, 114)");

	if (username.val() == "") {
		username.val("이름을 입력하세요");
		username.css("background-color", "");
	}
});

useremail.focus(function() {
	if (useremail.val() == "이메일을 입력하세요") {
		useremail.val("");
	}
	useremail.css("background-color", "skyblue");
});

useremail.blur(function() {
	useremail.css("background-color", "rgb(65, 52, 114)");

	if (useremail.val() == "") {
		useremail.val("이메일을 입력하세요");
		useremail.css("background-color", "");
	}
});

useremailchk.focus(function() {
	if (useremailchk.val() == "인증번호를 입력하세요") {
		useremailchk.val("");
	}
	useremailchk.css("background-color", "skyblue");
});

useremailchk.blur(function() {
	useremailchk.css("background-color", "rgb(65, 52, 114)");

	if (useremailchk.val() == "") {
		useremailchk.val("인증번호를 입력하세요");
		useremailchk.css("background-color", "");
	}
});


userphone.focus(function() {
	if (userphone.val() == "핸드폰 번호를 입력하세요") {
		userphone.val("");
	}
	userphone.css("background-color", "skyblue");
});

userphone.blur(function() {
	userphone.css("background-color", "rgb(65, 52, 114)");

	if (userphone.val() == "") {
		userphone.val("핸드폰 번호를 입력하세요");
		userphone.css("background-color", "");
	}
});
//------------------------아이디 중복 확인-----------------------------------
function fn_ConfirmIdSend() {

	if (!fn_idAuthentication()) {
		return false;
	}

	let user_id = userid.val();

	$.ajax({

		type: 'post',
		url: 'http://localhost:8081/sendId.sm',
		data: { user_id: user_id },
		success: function(data) {
			let data1 = $.trim(data);
			if (data1 == 'true') {
				alert("사용 가능한 아이디입니다.");

			} else {
				alert("중복된 아이디입니다.");
			}
		},
		error: function(xhr, status, error) {
			//오류 발생 시 처리
		}

	});
}

function fn_idAuthentication() {
	let id_chk = /^[a-zA-Z0-9]*$/;
	let id_value = userid.val();
	let flag = true;
	if (!id_chk.test(id_value)) {
		alert("아이디는 숫자와 영어로 입력해 주세요");
		userid.val("");
		userid.focus();
		flag = false;
	}
	return flag;
}

//------------------------이메일 인증번호 보내기-----------------------------------
function fn_ConfirmEmailSend() {

	if (!fn_emailAuthentication()) {
		return false;
	}



	let user_email = useremail.val();

	$.ajax({

		type: 'post',
		url: 'http://localhost:8081/sendEmail.sm',
		data: { user_email: user_email },
		success: function(data) {
			alert("인증번호가 전송되었습니다.");
			$("#authenticationEmail").html(data);
			console.log(data);
		},
		error: function(xhr, status, error) {
			//오류 발생 시 처리
			alert("이메일을 다시 입력해주세요.");
		}

	});
}

function fn_emailAuthentication() {
	let email_chk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let email_value = $("#user_email").val();
	let flag = true;
	if (!email_chk.test(email_value)) {
		alert("이메일 형식에 맞춰 입력해주세요");
		$("#user_email").val("");
		$("#user_email").focus();
		flag = false;
	}
	return flag;
}
//------------------------이메일 인증번호 보내기 끝-----------------------------------

//------------------------이메일 인증번호 확인하기-----------------------------------
function fn_EmailConfirm() {
	let user_email_chk = $("#user_email_chk").val();
	let authenticationNum = $("#authenticationNum").val();

	//   alert(user_email_chk);
	//   alert(authenticationNum);

	if (user_email_chk == authenticationNum) {
		alert("인증되었습니다.");
		return false;
	} else {
		alert("인증에 실패하였습니다.");
		return false;
	}


}

//------------------------이메일 인증번호 확인하기 끝-----------------------------------


function fn_validation(frm) {

	let id_chk = /^[a-zA-Z0-9]*$/;
	let password_chk = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	let name_chk = /^[ㄱ-ㅎ가-힣]*$/;
	let email_chk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	let phone_chk = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;


	let id_value = $("#user_id").val();
	if (!id_chk.test(id_value)) {
		alert("아이디는 숫자와 영어로 입력해주세요");
		$("#user_id").val("");
		$("#user_id").focus();
		return false;
	}

	let password_value = $("#user_pw").val();
	if (!password_chk.test(password_value)) {
		alert("비밀번호는 소문자, 대문자, 숫자, 특수문자를 포함하는 8~15 자리로 입력해주세요");
		$("#user_pw").val("");
		$("#user_pw").focus();
		return false;
	}

	let password_valuechk = $("#signup-input-passwordchk").val();
	if (password_value != password_valuechk) {
		alert("비밀번호가 동일하지 않습니다");
		$("#signup-input-passwordchk").val("");
		$("#signup-input-passwordchk").focus();
		return false;
	}

	let name_value = $("#user_name").val();
	if (!name_chk.test(name_value)) {
		alert("이름은 한글로만 입력해주세요");
		$("#user_name").val("");
		$("#user_name").focus();
		return false;
	}


	let email_value = $("#user_email").val();
	if (!email_chk.test(email_value)) {
		alert("이메일 형식에 맞춰 입력해주세요");
		$("#user_email").val("");
		$("#user_email").focus();
		return false;
	}

	let user_email_chk = $("#user_email_chk").val();
	let authenticationNum = $("#authenticationNum").val();
	if (user_email_chk != authenticationNum) {
		alert("이메일 인증에 실패하였습니다.");
		user_email_chk.val("");
		user_email_chk.focus();
		return false;
	}


	//let phone_value = $("#user_phone").val();
	if (!phone_chk.test(userphone.val())) {
		alert("핸드폰 번호 형식에 맞춰 입력해주세요");
		$("#user_phone").val("");
		$("#user_phone").focus();
		return false;
	}




	Swal.fire({
		icon: 'success',
		title: "가입완료",
		text: '환영합니다.',
		confirmButtonColor: '#3085d6',
		confirmButtonText: '확인'
	}).then(function() {
		frm.submit();
	});

}



