<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpvo8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
</head>
<body>
	<div id="root">

		<div class="container">
			<div class="row">
				<div>당일 현황</div>
			</div>
			<div class="row row-cols-6">
				<div class="col">
					<div class="row row-cols-1">방문자 수(ip조회)</div>
					<div>5</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">페이지 뷰(당일 총 게시글 조회수)</div>
					<div>5</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">포인트 충전</div>
					<div>50000</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">포인트 교환</div>
					<div>5000</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">신규 게시글 수</div>
					<div>5</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">진행 중인 거래 수</div>
					<div>5</div>
				</div>
			</div>
			<div class="row row-cols-2">
				<div class="col">
					<div class="row row-cols-1">기간별 요약</div>
					<div>주간, 월간, 분기, 년 단위 현황</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">
						<a href="${path}member"> 회원 관리 </a>
					</div>
					<div>신규회원 목록(요약)</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">
						<a href="${path}board">게시글 관리 </a>
					</div>
					<div>신규 게시글 목록(요약)</div>
				</div>
				<div class="col">
					<div class="row row-cols-1">
						<a href="${path}report">문의/신고 관리 </a>
					</div>
					<div>신규 문의/신고 목록(요약)</div>
				</div>
			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>