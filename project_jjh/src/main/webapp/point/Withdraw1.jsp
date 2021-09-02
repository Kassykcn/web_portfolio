<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />

<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>출금</title>

<script>
$(function number(){ 
    $("#rcppayAmount").keyup(function (event) {

        regexp = /[^0-9]/gi;

        v = $(this).val();

        if (regexp.test(v)) {

            alert("숫자만 입력가능 합니다.");

            $(this).val(v.replace(regexp, ''));

        }
    });
});

$(function() {	//단위 10000원으로 
	  $('#rcppayAmount').on('change', function() {
	     var n = $(this).val(); 
	     n = Math.floor(n/10000) * 10000; 
	      n = parseInt(n); 
	     $(this).val(n);
	  });
	});
	
$(function withDraw(){
	var money = "<c:out value='${MONEY}'/>"; 
	
	money = parseInt(money);
	
	var rcppayAmount = $("input[name='rcppayAmount']").val();
	
	$("#withDrawBtn").click(function(){
		var rcppayAmount = $("input[name='rcppayAmount']").val();
		var havedCoin = "<c:out value='${COIN }'/>";	//가지고 있는 코인
		
		if(!rcppayAmount || rcppayAmount == 0){
			alert("출금 하실 금액을 확인해주세요.");
			return false;
		}
		else if(rcppayAmount > money){
			alert("해당 금액은 보유하신 금액보다 많아서 출금하실수 없습니다.");
			$("input[name='rcppayAmount']").val('');
			$('#yoteiCoin').val(havedCoin);	
			return false;
			}
	});
});

$(function yoteiCoin(){
	var money = "<c:out value='${MONEY}'/>"; 		//가지고 있는 돈
	var havedCoin = "<c:out value='${COIN }'/>";	//가지고 있는 포인트
	$('#yoteiCoin').val(havedCoin);					//화면 보였을 때 기본
	
	$('#rcppayAmount').blur(function(){
		var money_value = $("input[name='rcppayAmount']").val();	//출금금액 쓴 것
		
		if(money_value.length > 4)
		$('#yoteiCoin').val((money-money_value)/10000);
		
	});
});
</script>
</head>
<body>
	<div>
	<table width="900">
	<tr>
	<td>	
			<h1 class="sub_title">포인트 교환신청</h1> </td> 
			
			<th style="text-align: right ; font-size: 13px;""> 홈   >  마이페이지  >  교환신청  <th>
		
	
	</tr>	
</table>
</div>
		<div>
			<ul>
				<li>출금신청하신 포인트는 본인명의의 계좌번호로 이체됩니다.</li>
				<li>계좌정보가 정확해야 이체되므로 계좌번호 확인 후 신청해 주시기 바랍니다.
				</li>
			</ul>
		<table border="1" width="500" height="60" >
	<th width="200" bgcolor="#99FFFF">현재 내 포인트</th>
	<th>${MONEY }원</th>

</table>
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
				<li>신청을 취소한 경우</li>
			</ul>
		</li>
		</ul>
		<div>
								<h2 class="title">출금신청</h2>
							</div>
							<form action="withDraw.do" method="post" onsubmit="return withDraw()">
		<table border="2" width=900>
			<tr>
				<td>내 계좌 </td>										
					<td>
<font color="blue">${dto.mberAcountNo}</font><input type="submit" value="출금계좌변경" style="margin-left:300px" onclick="window.location.href='WdRegister.jsp'" >
</td>
			</tr>
			<tr>
				<td>출금 가능금액</td>
			<td>${MONEY } 원<td>
			</tr>
			<tr>
				<td>출금 요청금액</td>
				<td><input type="text" id="rcppayAmount" name=rcppayAmount>원  <font color="red">(1000원 단위로 출금이 가능합니다.)</font></td>
			</tr>
			<tr>
				<td>잔여 포인트</td>
				<td> <b><input type="text" name=yoteiCoin id="yoteiCoin" value="" readonly style="width:40px; border:0 solid black; font-size:20px;"></b>
			<td>
			</tr>
		</table>
 <input type="submit" class="btn" id="withDrawBtn" value="출금" style="text-align:center; width:100px; height:30px;">
			<input type="button" class="btn" id="cancelBtn" value="취소" class="btn-light" style="text-align:center; width:100px; height:30px;">
													<input type="hidden" name="mberCode" value="${dto.mberCode}"> <!-- 회원코드 -->
					       			    <input type="hidden" name="rcppayCl" value="W"> 			 <!-- 입출금 분류 -->
					       			    <input type="hidden" name="excngCoinCo" value="0"> 			 <!-- 환전 코인 수 -->
					       			    <!-- <input type="hidden" name="rcppayDt" value=""> 				  입출금 일시 -->
			 <br>

			 <br>
			 
			 
			 <button type="button" class="btn-light" style="text-align:center; width:150px; height:40px;"> 계좌만들기</button> 
			 <br>
		<div>
			<h4 class="title">출금신청 내역 조회</h4>
		</div>
		<div style="border:1px solid; width:880px;" >
		<table>

			
				<tr>
					<th scope="row" width="120" height="50" bgcolor="#C0FFFF" >조회기간</th>
					<td><select name="language" style="width:60px;height:20px;" >
    <option value="none">=== 선택 ===</option>
    <option value="2021" selected>2021</option>
  </select>년
  <select name="language" style="width:43px;height:20px;" > 
    <option value="none">=== 선택 ===</option>
    <option value="1" selected>1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
  </select>월
 <select name="language" style="width:43px;height:20px;" > 
    <option value="none">=== 선택 ===</option>
    <option value="1" selected>1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
    <option value="17">17</option>
    <option value="18">18</option>
    <option value="19">19</option>
    <option value="20">20</option>
    <option value="21">21</option>
    <option value="22">22</option>
    <option value="23">23</option>
    <option value="24">24</option>
    <option value="25">25</option>
    <option value="26">26</option>
    <option value="27">27</option>
    <option value="28">28</option>
    <option value="29">29</option>
    <option value="30">30</option>
    <option value="31">31</option>

    
  </select>일 ~
 <select name="language" style="width:60px;height:20px;" >
    <option value="none">=== 선택 ===</option>
    <option value="2021" selected>2021</option>
  </select>년
  <select name="language" style="width:43px;height:20px;" > 
    <option value="none">=== 선택 ===</option>
    <option value="1" selected>1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
  </select>월
 <select name="language" style="width:43px;height:20px;" > 
    <option value="none">=== 선택 ===</option>
    <option value="1" selected>1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
    <option value="17">17</option>
    <option value="18">18</option>
    <option value="19">19</option>
    <option value="20">20</option>
    <option value="21">21</option>
    <option value="22">22</option>
    <option value="23">23</option>
    <option value="24">24</option>
    <option value="25">25</option>
    <option value="26">26</option>
    <option value="27">27</option>
    <option value="28">28</option>
    <option value="29">29</option>
    <option value="30">30</option>
    <option value="31">31</option>

    
  </select>일 <span> <input type="submit"
							value="1일"> <input type="submit" value="1주일"> <input
							type="submit" value="1개월"> <input type="submit"
							value="3개월">
					</span></td>
					<td class="ta_right submit"><button
							class="btn_common form blu" id="submit_btn">조회</button></td>						
				</tr>				
				
			</table>
			</div>
<br>		
<table border="1" width="880" bgcolor ="#B0F7FF">
<tr height="10">
<td width="100">송금요청인</td> 
			<td>은행</td>
			<td>송금계좌번호</td>
			<td width="100">송금액</td>
			<td>상태</td>


</tr>
</table>	
<div style="border:1px solid; padding:10px; width:880px; height: 500px">	
</div>
</body>

</html>