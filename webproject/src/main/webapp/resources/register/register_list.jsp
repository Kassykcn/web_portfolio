<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/register_list.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/register_list.js" charset="UTF-8"></script>
</head>
<body>
<!-- div의 css태그들은 frame.css 참조, 틀 위치잡기용  -->
<div id="head"></div>
<div id="left"></div>
<div id="content">
<h2>경매/구매 목록</h2>
	<div class="sort">
		<form id="sort_form">
			<div>
				<select>
					<option value="0">거래종류</option>
					<option value="all">전체</option>
					<option value="auction">경매</option>
					<option value="buy">구매</option>
				</select>
			</div>
			<div>
				<select>
					<option value="0">거래상태</option>
					<option value="all">전체</option>
					<option value="ongoing">진행 중</option>
					<option value="close">기간 만료</option>
					<option value="complete">거래 완료</option>
				</select>
			</div>
			<div>시작일 낮은순</div>
			<div>시작일 높은순</div>
			<div>조회수 높은순</div>
		</form>
	</div>
	<form id="reg_list">
		<table class="table2">
			<thead class="table2th">
				<tr>
					<th class="table2th1">글번호</th>
					<th class="table2th1">구분</th>
					<th class="table2th3">제목</th>
					<th class="table2th2">기간</th>
					<th class="table2th1">상태</th>
					<th class="table2th1">조회수</th>
				</tr>
			</thead>
			<tbody class="table2td">
				<tr>
					<td>1</td>
					<td>경매</td>
					<td><a href="#">제목</a></td>
					<td>2021-08-25~2021-08-27</td>
					<td>진행중</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		<table class="search_table">
			<tr>
				<td>
					<select id="search_key">
						<option value="title">제목</option>
						<option value="details">내용</option>
						<option value="id">작성자</option>
					</select>
				</td>
				<td><input type="text" id="search_txt" placeholder="검색어를 입력하세요"></td>
				<td><input type="button" class="btn1" value="검색"></td>
			</tr>
		</table>
	</form>
</div>
<div id="foot"></div>

</body>
</html>