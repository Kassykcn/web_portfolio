<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/main.css"/>'>
</head>
<body>
<c:import url="/resources/Top.jsp"/>
<div id="content">
	<div class="banner">
		배너
	</div>
	<div class="auction">
		<div class="cls_title">경매 현황</div>
		<div class="cls_more"><a href="register_list.do?cur_page=1&filter_codeC=c1">더보기</a></div>
		<div class="cls_table">
			
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
		</div>
	</div>
	<div class="buy">
		<div class="cls_title">구매 현황</div>
		<div class="cls_more"><a href="register_list.do?cur_page=1&filter_codeC=c2">더보기</a></div>
		<div class="cls_table">
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
			<div>
				<a href="#">
					<img alt="ready_image" class="main_img" src='<c:url value="/resources/images/img_ready.png"/>'><br>
					제목<br>
					진행상태
				</a>
			</div>
		</div>
	</div>
</div>
<c:import url="/resources/Bottom.jsp"/>
</body>
</html>
