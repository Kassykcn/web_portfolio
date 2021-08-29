<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/register_view.css"/>'>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src='<c:url value="/resources/js/register_view.js"/>' charset="UTF-8"></script>
</head>
<body>
<!-- div의 css태그들은 frame.css 참조, 틀 위치잡기용  -->
<div id="head"></div>
<div id="left"></div>
<div id="content">
	<h2>경매/구매 상세페이지</h2>
	<form id="reg_view">
	<table class="table1">
		<tr>
			<td class="table1_td">
				<c:if test="${regData.getImage() == null}">
					<img alt="image" class="title_img" src='<c:url value="/resources/images/img_ready.png"/>'>
				</c:if>
				<c:if test="${regData.getImage() != null}">
					<img alt="image" class="title_img" src="${regData.image()}">
				</c:if>
				
			</td>
			<td class="table1_td" colspan="2">
				<div id="state"><c:out value="${regData.getDeal_state()}"/></div>
				<div id="deadline"><!-- 종료일까지 남은 일수 -->
				<c:set var="startDate" value="${fn:replace(fn:substring(regData.getStart_date(),5,10),'-','')}"/>
				<c:set var="endDate" value="${fn:replace(fn:substring(regData.getEnd_date(),5,10),'-','')}"/>
					D-${endDate-startDate}
				</div>
				<br>
				<table class="table2">
					<tr>
						<td class="td_title">카테고리</td>
						<td class="td_content" colspan="2">
							<c:out value="${regData.getFirst()}"/> -
							<c:out value="${regData.getSecond()}"/> -
							<c:out value="${regData.getThird()}"/>
						</td>
						<td class="td_content">
							<button type="button" id="like_btn" class="btn1">
								<img alt="찜" class="like_img" src='<c:url value="/resources/images/heart_empty.png"/>'>
							</button>
						</td>
					</tr>
					<tr>
						<td class="td_title">제목</td>
						<td class="td_content" colspan="3">
							<c:out value="${regData.getTitle()}"/>
						</td>
					</tr>
					<tr>
						<td class="td_title">기간</td>
						<td class="td_content" colspan="3">
							<c:out value="${regData.getStart_date()}"/>
							 ~ <c:out value="${regData.getEnd_date()}"/></td>
					</tr>
					<tr>
						<td class="td_title">최소 입찰가</td>
						<td class="td_content"><fmt:formatNumber value="${regData.getMin_bid()}" type="number"/>원</td>
						<td class="td_title">등급
							<div class="tooltip">
								<img alt="grade_help" class="grade_help_img" src='<c:url value="/resources/images/question_white.png"/>'>
								<span class="tooltip-content">
									<b>S급</b>&nbsp;&nbsp;&nbsp;포장지 파손없는 미개봉 상품<br>
									<b>A급</b>&nbsp;&nbsp;&nbsp;포장지 없는 미개봉 상품<br>
									<b>B급</b>&nbsp;&nbsp;&nbsp;개봉 후 미사용 상품<br>
									<b>C급</b>&nbsp;&nbsp;&nbsp;개봉 후 사용감이 적은 상품<br>
									<b>D급</b>&nbsp;&nbsp;&nbsp;포장지가 없거나 개봉 후 사용감이 많은 상품<br>
								</span>
							</div>
						</td>
						<td class="td_content"><c:out value="${regData.getGrade()}"/>급</td>
					</tr>
					<tr>
						<td class="td_title">현재 입찰가</td>
						<td class="td_content" colspan="2">
							<input type="number" class="input_number" id="now_bid" value="<fmt:formatNumber value="${regData.getNow_bid()}"/>">원
						</td>
						<td class="td_content">
							<input type="button" id="now_bid_btn" class="btn1" value="입찰하기"> 
						</td>
					</tr>
					<tr>
						<td class="td_title">즉시 낙찰가</td>
						<td class="td_content" colspan="2"><fmt:formatNumber value="${regData.getWin_bid()}" type="number"/>원</td>
						<td class="td_content">
							<input type="button" id="win_bid_btn" class="btn1" value="즉시 낙찰">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="align_left"><b>Q&amp;A</b></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="QnA_div">
					<textarea class="tarea1" id="QnA" placeholder="최대 200자까지 입력가능합니다" maxlength="200"></textarea>
					<div id="QnA_inner_div">
						<span id="QnA_length"></span>/200자
						<input type="button" class="QnA_btn" value="등록하기">
					</div>
				</div>
			</td>
		</tr>
	</table>
	</form>
</div>
<div id="foot"></div>

</body>
</html>