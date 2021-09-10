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
<c:import url="/resources/Top.jsp"/>

<div id="left"></div>
<div id="content">
	<table class="table1">
		<tr>
			<td class="align_left"><h2>경매/구매 상세페이지</h2></td>
		</tr>
		<tr>
			<td class="table1_td1">
				<c:if test="${regData.getImage1() == null}">
					<img alt="ready_image" class="title_img" src='<c:url value="/resources/images/img_ready.png"/>'>
				</c:if>
				<c:if test="${regData.getImage1() != null}">
					<img alt="upload_image1" class="title_img" src='<c:url value="/resources/uploads/${regData.getImage1()}"/>'>
				</c:if>
				<c:if test="${regData.getImage2() != null}">
					<img alt="upload_image2" class="sub_img" src='<c:url value="/resources/uploads/${regData.getImage2()}"/>'>
				</c:if>
			</td>
			<td class="table1_td2" colspan="2">
				<div>
					<div id="state">
						<c:set var="classify" value="${regData.getClassify()}"/>
						<c:out value="${classify}"/>
						<c:out value="${regData.getDeal_state()}"/></div>
					<div id="deadline"><!-- 종료일까지 남은 일수 -->
						<c:set var="startDate" value="${fn:replace(fn:substring(regData.getStart_date(),5,10),'-','')}"/>
						<c:set var="endDate" value="${fn:replace(fn:substring(regData.getEnd_date(),5,10),'-','')}"/>
							D-${endDate-startDate}
					</div>
					<div class="report">
						<a href="#" id="report">신고</a>
					</div>
					<div class="like">
						<button type="button" id="like_btn" class="btn1">
							<img alt="찜" class="like_img" src='<c:url value="/resources/images/heart_empty.png"/>'>
						</button>
					</div>
				</div>
				<table class="table2">
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
						<td class="td_title">카테고리</td>
						<td class="td_content" colspan="3">
							<c:out value="${regData.getFirst()}"/> -
							<c:out value="${regData.getSecond()}"/> -
							<c:out value="${regData.getThird()}"/>
						</td>
					</tr>
					<tr>
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
						<td class="td_content" colspan="2">
							
						</td>
					</tr>
					
					<c:if test='${classify == "구매"}'>
					<tr>
						<td class="td_title">가격</td>
						<td class="td_content" colspan="3">
							<form method="post" action="register_view.do" id="price_form">
								<input type="hidden"  name="cur_page" value="${cur_page}" >
								<input type="hidden" name="idx" value="${regData.getIdx()}">
								<input type="hidden" name="id" value="${regData.getId()}">
								<input type="hidden" name="type" value="buy">
								<input type="hidden" name="price" value="${regData.getPrice()}">
								<fmt:formatNumber value="${regData.getPrice()}" type="number"/>원
								&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${regData.getDeal_state() == '진행중'}">
									<input type="button" id="price_btn" class="btn1" value="거래하기">
								</c:if>
							</form>
						</td>
					</tr>	
					</c:if>
					<c:if test='${classify == "경매"}'>
					<tr>
						<td class="td_title">최소 입찰가</td>
						<td class="td_content" colspan="3">
							<input type="hidden" id="min_bid" value="${regData.getMin_bid()}">
							<fmt:formatNumber value="${regData.getMin_bid()}" type="number"/>원
						</td>
						
					</tr>
					<tr>
						
						<td class="td_title">현재 입찰가</td>
						<td class="td_content" colspan="3">
							<form method="post" action="register_view.do" id="now_bid_form">
								<input type="hidden"  name="cur_page" value="${cur_page}" >
								<input type="hidden" name="idx" value="${regData.getIdx()}">
								<input type="hidden" name="id" value="${regData.getId()}">
								<input type="hidden" name="type" value="now">
								<c:if test="${regData.getDeal_state() == '진행중'}">
									<input type="number" class="input_number" id="now_bid" name="now_bid" value="<fmt:formatNumber value="${regData.getNow_bid()}"/>">원
								</c:if>
								<c:if test="${regData.getDeal_state() != '진행중'}">
									<fmt:formatNumber value="${regData.getNow_bid()}"/>원
								</c:if>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${regData.getDeal_state() == '진행중'}">
									<input type="button" id="now_bid_btn" class="btn1" value="입찰하기"> 
								</c:if>
							</form>
						</td>
						
					</tr>
					<tr class="auction_tr">
						<td class="td_title">즉시 낙찰가</td>
						<td class="td_content" colspan="3">
							<form method="post" action="register_view.do" id="win_bid_form">
								<input type="hidden"  name="cur_page" value="${cur_page}" >
								<input type="hidden" name="idx" value="${regData.getIdx()}">
								<input type="hidden" name="id" value="${regData.getId()}">
								<input type="hidden" name="type" value="win">
								<input type="hidden" name="win_bid" value="${regData.getWin_bid()}">
								<fmt:formatNumber value="${regData.getWin_bid()}" type="number"/>원
								&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${regData.getDeal_state() == '진행중'}">
									<input type="button" id="win_bid_btn" class="btn1" value="즉시 낙찰">
								</c:if>
							</form>
						</td>
					</tr>
					</c:if>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="align_left"><b>상세 내용</b></td>
		</tr>
		<tr>
			<td colspan="2" class="align_left"><c:out value="${regData.getDetails()}"/></td>
		</tr>
		<tr>
					<td class="td_content" colspan="4">
						<input type="button" value="수정" class="btn1" onclick="location.href='register_update.do?idx=${regData.getIdx()}&cur_page=${cur_page}'">
						<input type="button" value="삭제" class="btn1" onclick="location.href='register_delete.do?idx=${regData.getIdx()}&cur_page=${cur_page}'">
						<input type="button" value="목록" class="btn1" onclick="location.href='register_list.do?cur_page=${cur_page}'">
					</td>
		</tr>
	</table>		

	<table class="table1">
		<tr>
			<td colspan="2" class="align_left"><b>Q&amp;A 작성하기</b></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="QnA_div">
					<form method="post" action="register_view.do">
						<input type="hidden"  name="cur_page" value="${cur_page}" >
						<input type="hidden" name="idx" value="${regData.getIdx()}">
						<input type="hidden" name="id" value="${regData.getId()}">
						<input type="hidden" name="Q_state" value="답변대기">
						<input type="hidden" name="QnA" value="Q">
						<textarea class="tarea1" id="Q_text" name="Q_text" placeholder="최대 200자까지 입력가능합니다" maxlength="200"></textarea>
						<div class="QnA_inner_div">
							<span id="Q_length"></span>/200자
						</div>
						<div class="QnA_outer_div">
							<input type="checkbox" id="secretCk" class="QnA_btn">비공개 여부
							<input type="hidden" name="Q_secret" id="Q_secret" value="N">
							&nbsp;&nbsp;
							<input type="submit" id="QnA" value="작성하기" class="QnA_btn">
						</div>
					</form>
				</div>
				<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="align_left"><b>Q&amp;A</b></td>
		</tr>
		<tr>
			<td>
				<table class="table3">
					<tr>
						<th class="table3_th1">상태</th>
						<th>질문/답변</th>
						<th class="table3_th1">작성자</th>
						<th class="table3_th1">작성일</th>
					</tr>
					<c:forEach var="data" items="${QnAData}">
					<tr>
						<td class="table3_left">
							<c:out value="${data.getQ_state()}"/><br>
							<c:if test="${data.getQ_state() == '답변대기'}">
								<a href="#none" class="write_answer">답변 달기</a>
							</c:if>
						</td>
						<td>
							<c:if test="${data.getQ_secret() == 'N'}">
								<c:out value="${data.getQ_text()}"/>
							</c:if>
							<c:if test="${data.getQ_secret() == 'Y'}">
								<c:out value="비밀글입니다."/>
							</c:if>
						</td>
						<td class="table3_left"><c:out value="${data.getId()}"/></td>
						<td class="table3_left"><c:out value="${data.getQ_date()}"/></td>
					</tr>
					<c:if test="${data.getQ_state() == '답변완료'}">
					<tr>
						<td class="table3_left"></td>
						<td>
							<c:if test="${data.getA_secret() == 'N'}">
								<c:out value="${data.getA_text()}"/>
							</c:if>
							<c:if test="${data.getA_secret() == 'Y'}">
								<c:out value="비밀글입니다."/>
							</c:if>
						</td>
						<td class="table3_left"><c:out value="${data.getId()}"/></td>
						<td class="table3_left"><c:out value="${data.getA_date()}"/></td>
					</tr>
					</c:if>
					<!-- 글 등록자와 같은 아이디일때만 표시 -->
					<tr class="answer">
						<td class="table3_left"></td>
						<td colspan="3">
							<form method="post" action="register_view.do">
								<input type="hidden"  name="cur_page" value="${cur_page}" >
								<input type="hidden" name="idx" value="${regData.getIdx()}">
								<input type="hidden" name="Q_idx" value="${data.getQ_idx()}">
								<input type="hidden" name="id" value="${regData.getId()}">
								<input type="hidden" name="A_secret" id="A_secret" value="${data.getQ_secret()}">
								<input type="hidden" name="QnA" value="A">
								<textarea class="tarea1" id="A_text" name="A_text" placeholder="최대 200자까지 입력가능합니다" maxlength="200"></textarea>
								&nbsp;&nbsp;
								<input type="submit" id="QnA" value="작성하기" class="QnA_btn">
							</form>
						</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>

</div>

<c:import url="/resources/Bottom.jsp"/>

</body>
</html>