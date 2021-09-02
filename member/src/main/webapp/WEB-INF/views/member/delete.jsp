<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/main";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#pass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pass").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/member/delete" method="post">
				<div>
					<label for="userId">아이디</label>
					<input type="text" id="userId" name="id" value="${member.id}" readonly="readonly"/>
				</div>
				<div>
					<label  for="userPass">패스워드</label>
					<input  type="password" id="userPass" name="pass" />
				</div>
				<div >
					<label for="userName">성명</label>
					<input type="text" id="userName" name="name" value="${member.name}" readonly="readonly"/>
				</div>
				<div>
					<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
					<button class="cancle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</section>
		
	</body>
	
</html>