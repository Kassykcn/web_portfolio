<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/frame.css"> -->
<link rel="stylesheet" type="text/css" href="../css/register.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/register_update.js" charset="UTF-8"></script>
</head>
<body>
<!-- div의 css태그들은 frame.css 참조, 틀 위치잡기용  -->
<div id="head"></div>
<div id="left"></div>
<div id="content">
	<h2>경매/구매 수정</h2>
	<form name="reg_update">
	<table class="tb1">
		<tr>
			<th class="th1">구분</th>
			<td class="td1">
				<!-- <select id="classify" onchange="classify_change()">
					<option value="0">선택</option>
					<option value="auction">경매</option>
					<option value="buy">구매</option>
				</select> -->
				<!-- <input type="radio" name="classify" value="auction" onclick="classify_change()">경매
				<input type="radio" name="classify" value="buy" onclick="classify_change()">구매 -->
				경매
			</td>
		</tr>
		<tr>
			<th class="th1">카테고리</th>
			<td class="td1">
				<select id="category_first" onchange="category_select()">
					<!-- <option value="0">대분류</option> -->
					<option value="전체">전체</option>
				</select>
				<select id="category_second" onchange="category_select()">
					<!-- <option value="0">중분류</option> -->
					<option value="전체">전체</option>
				</select>
				<select id="category_third">
					<!-- <option value="0">소분류</option> -->
					<option value="전체">전체</option>
				</select>
			</td>
		</tr>
		<tr>
			<th class="th1">제목</th>
			<td class="td1">
				<input type="text" id="title" value="제목제목" class="input_long" placeholder="최대 20자까지 입력가능합니다" maxlength="20">
				
			</td>
		</tr>
		<tr>
			<th class="th1">등급</th>
			<td class="td1">
				<input type="radio" name="grade" value="S" checked="checked">S급
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
			<th class="th1">기간</th>
			<td class="td1">
				<input type="number" id="start_date"  value="20210825" class="input_short" placeholder="ex)20210101">부터
				<input type="number" id="end_date" value="20210827" class="input_short" placeholder="ex)20210103">까지
				<br><span class="small_txt">시작일로부터 최대 3일까지만 가능합니다</span>
			</td>
		</tr>
		<!-- 구분 값이 구매일때만 활성화 -->
		<!-- <tr id="buy_tr">
			<th class="th1">가격</th>
			<td class="td1">
				<input type="number" id="price" class="input_long" onblur="add_comma(this)" placeholder="숫자만 입력하세요">원
				
			</td>
		</tr> -->
		<!-- 구분 값이 경매일때만 활성화 -->
		<tr id="auction_tr1">
			<th class="th1">최소 입찰가</th>
			<td class="td1">
				<input type="number" id="min_bid" value="10000" class="input_number" onblur="add_comma(this)" placeholder="숫자만 입력하세요">원
			</td>
		</tr>
		<!-- 구분 값이 경매일때만 활성화 -->
		<tr id="auction_tr2">
			<th class="th1">즉시 낙찰가</th>
			<td class="td1">
				<input type="number" id="win_bid" value="100000" class="input_number" onblur="add_comma(this)" placeholder="숫자만 입력하세요">원
			</td>
		</tr>
		<tr>
			<th class="th1">상세설명</th>
			<td class="td1">
				<textarea class="tarea1" id="details" placeholder="최대 200자까지 입력가능합니다" maxlength="200">내용내용</textarea>
			</td>
		</tr>
		<tr>
			<th class="th1">이미지</th>
			<td class="td1">
				<input type="file" id="image">
			</td>
		</tr>
		<tr>
			<td colspan="2" class="td1">
				<input type="button" class="btn1" onclick="submit_check()" value="수정">
			</td>
		</tr>
	</table>
	</form>
</div>
<div id="foot"></div>

</body>
</html>