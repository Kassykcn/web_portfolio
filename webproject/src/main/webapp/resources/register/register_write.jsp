<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/register.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/register.js" charset="UTF-8"></script>
</head>
<body>
<!-- div의 css태그들은 frame.css 참조, 틀 위치잡기용  -->
<div id="head"></div>
<div id="left"></div>
<div id="content">
	<h2>경매/구매 등록</h2>
	<form name="reg_write">
	<table class="table1">
		<tr>
			<th class="table1th">구분</th>
			<td class="table1td">
				<input type="radio" name="classify" value="auction">경매
				<input type="radio" name="classify" value="buy">구매
			</td>
		</tr>
		<tr>
			<th class="table1th">카테고리</th>
			<td class="table1td">
				<select id="category_first" name="category">
					<option value="0">대분류</option>
					<option value="전체">전체</option>
				</select>
				<select id="category_second" name="category">
					<option value="0">중분류</option>
					<option value="전체">전체</option>
				</select>
				<select id="category_third" name="category">
					<option value="0">소분류</option>
					<option value="전체">전체</option>
				</select>
			</td>
		</tr>
		<tr>
			<th class="table1th">제목</th>
			<td class="table1td">
				<input type="text" id="title" class="input_long" placeholder="최대 20자까지 입력가능합니다" maxlength="20">
				
			</td>
		</tr>
		<tr>
			<th class="table1th">등급</th>
			<td class="table1td">
				<input type="radio" name="grade" value="S">S급
					<span class="small_txt">포장지 파손없는 미개봉 상품</span>
				<input type="radio" name="grade" value="A">A급
					<span class="small_txt">포장지 없는 미개봉 상품</span>
				<input type="radio" name="grade" value="B">B급
					<span class="small_txt">개봉 후 미사용 상품</span>
				<br>
				<input type="radio" name="grade" value="C">C급
					<span class="small_txt">개봉 후 사용감이 적은 상품</span>
				<input type="radio" name="grade" value="D">D급
					<span class="small_txt">포장지가 없거나 개봉 후 사용감이 많은 상품</span>
			</td>
		</tr>
		<tr>
			<th class="table1th">기간</th>
			<td class="table1td">
				<input type="number" id="start_date" class="input_short" placeholder="ex)20210101">부터
				<input type="number" id="end_date" class="input_short" placeholder="ex)20210103">까지
				<br><span class="small_txt">시작일로부터 최대 3일까지만 가능합니다</span>
			</td>
		</tr>
		<!-- 구분 값이 구매일때만 활성화 -->
		<tr id="buy_tr">
			<th class="table1th">가격</th>
			<td class="table1td">
				<input type="number" id="price" class="input_number" onblur="add_comma(this)" placeholder="숫자만 입력하세요">원
				
			</td>
		</tr>
		<!-- 구분 값이 경매일때만 활성화 -->
		<tr id="auction_tr1">
			<th class="table1th">최소 입찰가</th>
			<td class="table1td">
				<input type="number" id="min_bid" class="input_number" onblur="add_comma(this)" placeholder="숫자만 입력하세요">원
			</td>
		</tr>
		<!-- 구분 값이 경매일때만 활성화 -->
		<tr id="auction_tr2">
			<th class="table1th">즉시 낙찰가</th>
			<td class="table1td">
				<input type="number" id="win_bid" class="input_number" onblur="add_comma(this)" placeholder="숫자만 입력하세요">원
			</td>
		</tr>
		<tr>
			<th class="table1th">상세설명</th>
			<td class="table1td">
				<textarea class="tarea1" id="details" placeholder="최대 200자까지 입력가능합니다" maxlength="200"></textarea>
			</td>
		</tr>
		<tr>
			<th class="table1th">이미지</th>
			<td class="table1td">
				<input type="file" id="image">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="table1td">
				<input type="button" id="submit_btn" value="등록">
			</td>
		</tr>
	</table>
	</form>
</div>
<div id="foot"></div>

</body>
</html>