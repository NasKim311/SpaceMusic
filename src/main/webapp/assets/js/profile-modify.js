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
	let originImg = document.getElementById("originImg");
	let container = document.getElementById("user_picture_thumbnail");
	container.removeChild(originImg);
	container.appendChild(newImage);

}

let usercomment = $("#usercomment");
let username = $("#user_name");
let userphone = $("#user_phone");


usercomment.focus(function() {
	if (usercomment.val() == "소개글을 입력하세요") {
		usercomment.val("");
	}
	usercomment.css("background-color", "skyblue");
});

usercomment.blur(function() {
	usercomment.css("background-color", "rgb(65, 52, 114)");

	if (usercomment.val() == "") {
		usercomment.val("소개글을 입력하세요");
		usercomment.css("background-color", "");
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



//------------------------이메일 인증번호 확인하기 끝-----------------------------------


function fn_validation() {

	let name_chk = /^[ㄱ-ㅎ가-힣]*$/;
	let phone_chk = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
	let frm = $("#myform");

	if (usercomment.length > 20) {
		alert("소개글은 20자 이내로 입력하세요");
		$("#usercomment").val("");
		$("#usercomment").focus();
		return false;
	}

	

	let name_value = $("#user_name").val();
	if (!name_chk.test(name_value)) {
		alert("이름은 한글로만 입력해주세요");
		$("#user_name").val("");
		$("#user_name").focus();
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
		title: "수정완료",
		text: '완료되었습니다',
		confirmButtonColor: '#3085d6',
		confirmButtonText: '확인'
	}).then(function() {
		frm.submit();
	});

}



