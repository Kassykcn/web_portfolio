<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<c:url var="formUrl" value="/register_write_ok.do"/> <!-- 폼 액션 링크 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/register.css"/>'>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src='<c:url value="/resources/js/register_write.js"/>' charset="UTF-8"></script>
</head>
<body>

<!-- div의 css태그들은 frame.css 참조, 틀 위치잡기용  -->
<%@ include file="../Top.jsp" %>
<div id="left"></div>
<div id="content">
	
	<sf:form modelAttribute="regBean" method="post" action="${formUrl}" > <!-- enctype="multipart/form-data" -->
	<table class="table1">
		<tr>
			<td class="align_left" colspan="2"><h2>경매/구매 등록</h2></td>
		</tr>
		<tr>
			<th class="table1th">구분</th>
			<td class="table1td">
				<sf:radiobutton path="classify" value="경매" label="경매" />
				<sf:radiobutton path="classify" value="구매" label="구매" />
			</td>
		</tr>
		<tr>
			<th class="table1th">카테고리</th>
			<td class="table1td">
				<sf:select path="first" id="category_first">
					<option value="0">대분류</option>
					<sf:options items="${categotyFirst}" />
				</sf:select>
				<sf:select path="second" id="category_second">
					<option value="0">중분류</option>
					<sf:options items="${categotySecond}" />
				</sf:select>
				<sf:select path="third" id="category_third">
					<option value="0">소분류</option>
					<sf:options items="${categotyThird}" />
				</sf:select>
			</td>
		</tr>
		<tr>
			<th class="table1th">제목</th>
			<td class="table1td">
				<sf:input path="title" class="input_long" placeholder="최대 20자까지 입력가능합니다" maxlength="20" />	
			</td>
		</tr>
		<tr>
			<th class="table1th">등급</th>
			<td class="table1td">
				<sf:radiobutton path="grade" value="S" label="S급" />
					<span class="small_txt">포장지 파손없는 미개봉 상품</span>
				
				<sf:radiobutton path="grade" value="A" label="A급" />
					<span class="small_txt">포장지 없는 미개봉 상품</span>
				<sf:radiobutton path="grade" value="B" label="B급" />
					<span class="small_txt">개봉 후 미사용 상품</span>
				<br>
				<sf:radiobutton path="grade" value="C" label="C급" />
					<span class="small_txt">개봉 후 사용감이 적은 상품</span>
				<sf:radiobutton path="grade" value="D" label="D급" />
					<span class="small_txt">포장지가 없거나 개봉 후 사용감이 많은 상품</span>
			</td>
		</tr>
		<tr>
			<th class="table1th">기간</th>
			<td class="table1td">
				<sf:input path="start_date" name="number" class="input_short" placeholder="ex)20210101"/>~
				<sf:input path="end_date" name="number" class="input_short" placeholder="ex)20210103"/>
				<br><span class="small_txt">시작일로부터 최대 3일까지만 가능합니다</span>
			</td>
		</tr>
		<!-- 구분 값이 구매일때만 활성화 -->
		<tr id="buy_tr">
			<th class="table1th">가격</th>
			<td class="table1td">
				<sf:input path="price" class="input_number" placeholder="숫자만 입력하세요"/>원
			</td>
		</tr>
		<!-- 구분 값이 경매일때만 활성화 -->
		<tr id="auction_tr1">
			<th class="table1th">최소 입찰가</th>
			<td class="table1td">
				<sf:input path="min_bid" class="input_number" placeholder="숫자만 입력하세요"/>원
			</td>
		</tr>
		<!-- 구분 값이 경매일때만 활성화 -->
		<tr id="auction_tr2">
			<th class="table1th">즉시 낙찰가</th>
			<td class="table1td">
				<sf:input path="win_bid" class="input_number"  placeholder="숫자만 입력하세요"/>원
			</td>
		</tr>
		<tr>
			<th class="table1th">상세설명</th>
			<td class="table1td">
				<sf:textarea path="details" class="tarea1" placeholder="최대 200자까지 입력가능합니다" maxlength="200"/>
			</td>
		</tr>
		<tr>
			<th class="table1th">이미지</th>
			<td class="table1td">
				<input type="file" name="file" id="image">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="table1td">
				<input type="button" id="submit_btn" value="등록">
				<input type="button" class="btn1" value="목록" onclick="history.back()">
			</td>
		</tr>
	</table>
	</sf:form>
</div>

<%@ include file="../Bottom.jsp" %>
</body>
</html>