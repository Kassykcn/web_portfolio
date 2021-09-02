<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

</head>
<body>

<div class="wrapper" align="center" style="background-color: orange; margin: 200px; width: 500px">
	<form id="edit_form" method="post">
	
			<div class="subjecet" style="font-size: 50px">
			회원정보 수정
			</div>
			<br><br>
			
			
			
			
			<div>
				<div>이름</div>
					<input class="user_input" name="name" value="${member.name}">
			</div>
			<br>
			<div>
				<div>비밀번호</div>
					<input class="pw_input" name="pass" value="${member.pass }">
			</div>
			<br>
			
			<div>
				<div>비밀번호 확인</div>
					<input class="pwck_input">
			</div>
			
			<div>
				<div>핸드폰번호(-제외)</div> 
					<input class="phone_input" name="phoneNum" value="${member.phoneNum }">
					</div>
					
			<br>
			<div>
				<div>이메일</div> 
				<input class="mail_input" name="email" value="${member.email}">
				</div>
				
				<br>
				
				
			<div>
				<input type="button" class="edit_button" value="수정하기">
				
			</div>
			<br>
			<div>
			<a href="/main">취소</a>
			</div>
			
		</div>
	</form>
</div>
<script>


$(document).ready(function(){
	//회원정보수정 버튼(정보수정 기능 작동)
	$(".edit_button").click(function(){
		
        $("#edit_form").attr("action", "/member/edit");
		$("#edit_form").submit();
		
	});
	
	 
	
});

</script>
</body>
</html>