<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="content">
		<h1>ID/비밀번호 찾기</h1>
		<div class="agree">
			<ul class="id_pw_srh">
				<li>
					<div class="srh_box or">
						<div class="srh_top">
							<h2>ID찾기</h2>
							내정보에 등록한 정보로 아이디를 찾을 수 있습니다.
						</div>
						<div class="info">
							<form name="id_form" method="post" action="search_idpw.asp" onsubmit="return chk_idform(this)">
							<input type="hidden" name="s_type" value="id" />
								<fieldset>
									<br>
									<legend>ID찾기 </legend>
									<p><label for="id_name">이름</label> <input type="text" name="me_name" id="id_name" title="이름 입력" /></p>
									
									<p><label for="id_mail">이메일</label> <input type="text" name="me_email" id="id_mail1" title="가입시 이메일 입력" /></p>
									<button type="submit">찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
				</li>
				<br> <br>
				<li>
				
					<div class="srh_box br">
						<div class="srh_top">
							<h2>비밀번호 찾기</h2>
							내정보에 등록한 정보로 비밀번호를 재설정할 수 있습니다.
						</div>
						<div class="info">
							<form name="pw_form" method="post" action="search_idpw.asp" onsubmit="return chk_pwform(this)">
							<input type="hidden" name="s_type" value="pw" />
								<fieldset>
								<br>
									<legend>비밀번호 찾기 </legend>
									<p><label for="pw_name">ID</label> <input type="text" name="me_id" id="pw_name" title="아이디 입력" /></p>
									<p><label for="pw_phone">이름</label> <input type="text" name="me_name" id="pw_phone" title="이름 입력" /></p>
									<p><label for="pw_mail">이메일</label> <input type="text" name="me_email" id="pw_mail2" title="가입시 이메일 입력" /></p>
									<button type="submit">찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	
</body>
</html>