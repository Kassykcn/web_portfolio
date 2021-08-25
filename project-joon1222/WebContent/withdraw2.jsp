<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="header_article">
			<h3 class="sub_title">포인트 교환신청</h3>
		</div>


		<div>
			<ul>
				<li>출금신청하신 포인트는 본인명의의 계좌번호로 이체됩니다.</li>
				<li>계좌정보가 정확해야 이체되므로 계좌번호 확인 후 신청해 주시기 바랍니다.
				</li>
			</ul>
			<p>
				<span>내 총 포인트: </span><strong>100,000</strong><span>원</span>
			</p>
		</div>


		<ul>
			<li>출금계좌 등록은 회원명과 예금주명이 동일한 경우 등록됩니다.</li>
			<li>은행 이체 시 이체오류가 발생한 경우에는 당일 18시 이전에 포인트로 반환 처리됩니다.</li>
			<li>반복적으로 이체오류가 발생하는 경우, 계좌정보를 변경 등록하시기 바랍니다.</li>
		</ul>
		</li>
		<li>이체불가
			<ul>
				<li>맞춤형 은행계좌인 경우에는 계좌정보가 정상적으로 등록되더라도, 이체되지 않습니다.</li>
				<li>신청내역을 취소한 경우</li>
			</ul>
		</li>
		</ul>
		<table border="2" width=600>
			<tr>
				<td>출금 계좌정보</td>
				<td>00은행 111111-11-111111 | 전준형<input type="submit"
					value="출금계좌변경">
				<td>
			</tr>
			<tr>
				<td>출금 가능금액</td>
				<td>0,000원
				<th>
			</tr>
			<tr>
				<td>출금 요청금액</td>
				<td><input type="text">원</td>
			</tr>
			<tr>
				<td>회원 비밀번호</td>
				<td><input type="text">
				<td>
			</tr>
		</table>
 <input type="submit"value="취소">
			 <input type="submit"value="신청하기">
			 <br>
			 <br>
			 &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
			 
			 <input type="submit" value="계좌만들기" style="text-align:center; width:150px; height:40px;">
		<div>
			<h4 class="title">출금신청 내역 조회</h4>
		</div>
		<div style="border:1px solid; padding:10px; width:800px;" >
		<table>

			
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
							class="btn_common form blu" id="submit_btn">조회</button></td>						
				</tr>				
				
			</table>
			</div>
									
<table border="1" width="824">
<tr height="10">
<td width="100">송금요청인</td> 
			<td>은행</td>
			<td>송금계좌번호</td>
			<td width="100">송금액</td>
			<td>상태</td>

<tr height="500">
</tr>

</table>	
</body>
</html>