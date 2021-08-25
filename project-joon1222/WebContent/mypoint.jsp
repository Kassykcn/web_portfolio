<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div  style="color: blue; font-size: 40px;">
내 포인트 현황
</div>
<table border="1" width="500" height="80" >
	<th width="200" bgcolor="#99FFFF">현재 내 포인트</th>
	<th>100,000원</th>

</table>
<br>
 &emsp; &emsp; &emsp; &emsp; &emsp;

			  <input type="submit" value="포인트 충전" style="text-align:center; width:150px; height:40px;">
			 <input type="submit" value="포인트 출금" style="text-align:center; width:150px; height:40px;">
<br>
<br>
<div  style="color: blue; font-size: 40px;">
내 포인트 조회
</div>
<div>
			<h4 class="title">포인트 내역보기</h4>
		</div>
		<div style="border:1px solid; padding:10px; width:878px;" >
		<table>			
		<tr>
 <input type='radio'/>전체
  <input type='radio' />입금한 포인트
  <input type='radio' />사용한 포인트												
						</tr>
				<tr>
					<th scope="row">조회기간</th>
					<td><input type="text" maxlength="8" value="2021-08-24"
						 > <input type="text"
						maxlength="8" value="2021-08-30" > <span> <input type="submit"
							value="1일"> <input type="submit" value="1주일"> <input
							type="submit" value="1개월"> <input type="submit"
							value="3개월">
					</span></td>
					<td class="ta_right submit"><button
							class="btn_common form blu" id="submit_btn">조회하기</button></td>
							<br>
													
					</table>					
				</div>					
<table border="1" width="900">
<tr height="10">
<td width="100">일자</td> 
			<td>분류</td>
			<td width="250">내용</td>
			<td width="150">입금한 포인트</td>
			<td width="150">사용한 포인트</td>
			<td width="150">현재 포인트</td>

<tr height="500">
</tr>

</table>

</body>
</html>