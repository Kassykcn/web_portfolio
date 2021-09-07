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
	<form id="join_form" method="post">
	
			<div class="subjecet">
			<img src="../resources/img/allgoods.jpg" align="middle" border="1">
			</div>
			<br><br>
			<div>
				<div >아이디</div>
					<input class="id_input" name="id">
			</div>
			
			<br>
			<div>
				<div>비밀번호</div>
					<input class="pw_input" name="pass">
			</div>
			<br>
			
			<div>
				<div>비밀번호 확인</div>
					<input class="pwck_input">
			</div>
			<br>
			<div>
				<div>이름</div>
					<input class="user_input" name="name">
			</div>
			
			<br>
			<div>
				<div>핸드폰번호(-제외)</div>
				<input class="phone_input" name="phoneNum">
					
					</div>
					
			<br>
			<div>
				<div>이메일</div> 
				<input class="mail_input" name="email">
				</div>
				
				<br>
				<div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
                <a href="#">이용약관</a>에동의합니다 
              </label>
            </div>
			<br>	
			<div>
				<input type="button" class="join_button" value="가입하기" >
				<input type="button" onclick="location.href='/main'" class="cancel_button" value="취소">
			</div>
			
		</div>
	</form>
</div>
<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
        $("#join_form").attr("action", "/member/join");
		$("#join_form").submit();
		
	});
	 
	
});








</script>
</body>
</html>