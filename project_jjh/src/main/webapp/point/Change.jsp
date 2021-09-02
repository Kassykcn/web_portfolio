<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--  jQuery Framework 참조하기 -->
<script type="text/javascript"
	src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>입금</title>

<script>
$(function deposit(){
	var result = document.getElementById("rcppayAmount");

	$('#depositBtn').click(function(){
		if($('#rcppayAmount').val() == 'none'){
			alert('입금 금액을 선택해주세요.');
			return false;
		}
		if(confirm( result.options[result.selectedIndex].text + "을 충전 하시겠습니까?")){
			alert("충전이 완료 되었습니다.");
		}
		else{
			alert("취소하셨습니다.");
			return false;
		}
	});
});

$(function coin(){
	var havedCoin = "<c:out value='${COIN }'/>";	//가지고 있는 포인트
	havedCoin = parseInt(havedCoin);	//숫자로 변환
	$('#yoteiCoin').val(havedCoin);
	
	$('#rcppayAmount').click(function(){
		var rcppayAmount = $("#rcppayAmount option:selected").val();
		
		if(rcppayAmount == 'none'){
			$('#yoteiCoin').val(havedCoin);
		}
		if(rcppayAmount == 10000){
			$('#yoteiCoin').val(havedCoin+1);
		}
		if(rcppayAmount == 20000){
			$('#yoteiCoin').val(havedCoin+2);
		}
		if(rcppayAmount == 30000){
			$('#yoteiCoin').val(havedCoin+3);
		}
		if(rcppayAmount == 50000){
			$('#yoteiCoin').val(havedCoin+5);
		}
		if(rcppayAmount == 100000){
			$('#yoteiCoin').val(havedCoin+10);
		}
		if(rcppayAmount == 200000){
			$('#yoteiCoin').val(havedCoin+20);
		}
		
	});
});
</script>
</head>
<body>
	<div>
		<table width="1250">
			<tr>
				<td>
					<h1 class="sub_title" style="color: blue; font-size: 40px;">포인트
						충전</h1>
				</td>

				<th style="text-align: right; font-size: 13px;">홈 > 마이페이지 >
					교환신청
				<th>
			</tr>
		</table>
	</div>
	<div style="height: auto; width: 100%; border-bottom: 2px solid black;">
		<table>
			<a href="이동될 페이지 주소" target=_blank> <img
				src=/resources/images/creditcard.jpg width="350" height="120">
			</a>
			<a href="이동될 페이지 주소" target=_blank> <img
				src=/resources/images/transfer.jpg width="350" height="120">
			</a>
			<a href="이동될 페이지 주소" target=_blank> <img
				src=/resources/images/account.jpg width="350" height="120">
			</a>
			<a href="이동될 페이지 주소" target=_blank> <img
				src=/resources/images/giftcard.jpg width="350" height="120">
			</a>
		</table>
	</div>

	<div>
		<div style="color:blue; font-size: 30px;" >
			<h2 align="left">입금</h2>
		</div>
		<div>
			<h3>보유코인 ${COIN } 개</h3>
		</div>
	</div>


	<form action="deposit.do" onsubmit='return deposit()'>
		입금금액 &nbsp;<select id="rcppayAmount" name="rcppayAmount"
			style="width: 210px; height: 24px; font-size: 15px; vertical-align: middle; text-align-last: center">
			<option value="none" selected>====== 선택 ======</option>
			<option value="10000">10000 원</option>
			<option value="20000">20000 원</option>
			<option value="30000">30000 원</option>
			<option value="50000">50000 원</option>
			<option value="100000">100000 원</option>
			<option value="200000">200000 원</option>
		</select> <br> <br> 예상 보유 코인 : <b><input type="text"
			name=yoteiCoin id="yoteiCoin" value="0개" readonly
			style="width: 40px; border: 0 solid black; font-size: 20px;"></b>
<br>

		<input type="submit" class="btn-light" id="depositBtn" value="입금"
			style="text-align: center; width: 150px; height: 40px;" onclick="document.location.href='point/Change.jsp'"> 
			<input type="button" class="btn-light" id="cancelBtn" value="취소"
			style="text-align: center; width: 150px; height: 40px;">
			 <input type="hidden" name="mberCode" value="${dto.mberCode}">
		<!-- 회원코드 -->
		<!-- <input type="hidden" name="rcppayDt" value=""> 				  입출금 일시 -->
		<input type="hidden" name="rcppayCl" value="D">
		<!-- 입출금 분류 -->
		<input type="hidden" name="excngCoinCo" value="0">
		<!-- 환전 코인 수 -->
	</form>




	<br>
	<br>
	<div style="border: 1px solid;">
		<div
			style="color: blue; font-size: 40px; padding: 10px; background-color: #C0FFFF;">
			포인트 충전 안내</div>
		&nbsp;
		<div style="color: blue; font-size: 25px">신용카드</div>
		<div style="black: blue; font-size: 15px">

			<ul>
				<li>고객님의 신용카드에서 카드정보 확인 및 등록 후 바로 포인트 충전 가능합니다</li>

			</ul>
		</div>
		<div style="color: blue; font-size: 25px">자동이체(실시간 계좌이체)</div>
		<div style="black: blue; font-size: 15px">

			<ul>
				<li>고객님의 은행계좌에서 계좌정보 및 공인인증서 확인 후 바로 포인트로 충전 가능합니다.</li>

			</ul>
		</div>
		<div style="color: blue; font-size: 25px">가상계좌</div>
		<div style="black: blue; font-size: 15px">

			<ul>
				<li>고객님의 입금편의를 위해 전용 입금 계좌를 제공하고 있으며 계좌 발급 후 입금하시면 포인트로 충전됩니다.</li>

			</ul>
		</div>
		<div style="color: blue; font-size: 25px">문화상품권</div>
		<div style="black: blue; font-size: 15px">

			<ul>
				<li>문화상품권으로 포인트를 충전하실 수 있습니다.</li>

			</ul>

		</div>
	</div>



</body>

</html>
