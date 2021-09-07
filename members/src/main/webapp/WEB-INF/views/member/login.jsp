<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<div class="wrapper" align="center" style="background-color: orange; margin: 100px; width: 500px">
	
	<div class="wrap" align="center">
	<form id="login_form" action="member/login" method="post">
		<div>
			<img src="../resources/img/allgoods.jpg" align="middle" border="1">
		</div>
		<div> 
		<br><br><br>아이디<br>
			<div border="1">
			<input class="id_input" name="id">
			
			</div>
			<br>비밀번호<br>
			<div border="1">
			<input class="pw_iput" name="pass">
			</div>
			<br>
			<c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
            
			<div>
				<input type="button" class="login_button" value="로그인">
			</div>	
			<br>
			<div>
			<input type="button" onclick="location.href='/member/join'" class="join_button" value="All Goods회원가입">
			<input type="button" onclick="location.href='/member/find'" class="find_button" value="ID/비밀번호 찾기">
			</div>		
		</div>
		</form>
		
	</div>
<br>
<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    width="222"
  />
</a>
<p id="token-result"></p>
<script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth'
    })
  }
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    const token = getCookie('authorize-access-token')
    if(token) {
      Kakao.Auth.setAccessToken(token)
      Kakao.Auth.getStatusInfo(({ status }) => {
        if(status === 'connected') {
          document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
        } else {
          Kakao.Auth.setAccessToken(null)
        }
      })
    }
  }
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
</script>

</div>

<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
        //alert("로그인 버튼 작동");
    	 /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
    });
 
</script>
</body>
</html>