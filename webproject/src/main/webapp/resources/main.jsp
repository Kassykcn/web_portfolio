<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Main</title>
	<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/main.css"/>'>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src='<c:url value="/resources/js/main.js"/>' charset="UTF-8"></script>
</head>
<body>
<c:import url="/resources/Top.jsp"/>
<div id="content">
	<div class="banner">
		<div class="banner_arrow">
			<div class="banner_arrowL">
			<img alt="banner_arrow" name="arrow" src='<c:url value="/resources/images/main_arrowL.png"/>'>
		</div>
		<div class="banner_arrowR">
			<img alt="banner_arrow" name="arrow" src='<c:url value="/resources/images/main_arrowR.png"/>'>
		</div>
		</div>
		<div class="banner_img">
			<img alt="banner1" name="banner" src='<c:url value="/resources/images/banner1.png"/>'>
			<a href="register_list.do?cur_page=1&filter_codeC=c1"><img alt="banner2" name="banner" src='<c:url value="/resources/images/banner2.png"/>'></a>
			<a href="register_list.do?cur_page=1&filter_codeC=c2"><img alt="banner3" name="banner" src='<c:url value="/resources/images/banner3.png"/>'></a>
		</div>
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
