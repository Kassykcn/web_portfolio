<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />


<!--  jQuery Framework 참조하기 -->
<script type="text/javascript"
	src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>지갑</title>

<script>
</script>
</head>
<body>

<table width="900">
	<tr>
	<td>	
			<h1 class="sub_title" style=" font-size: 40px;">내 포인트 조회</h1> </td> 
			
			<th style="text-align: right; font-size: 13px;"> 홈  >  마이페이지  >  교환신청  <th>
		
	
	</tr>	
</table>

		<div style="border:1px solid; width:900px; padding-top:0%;" >
		<table>						
				<tr>
					<th scope="row" width="120" height="50" bgcolor="#C0FFFF">조회기간</th>
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

    
  </select>일
   <span> <input type="submit" 
							value="1일"> <input type="submit" value="1주일"> <input
							type="submit" value="1개월"> <input type="submit"
							value="3개월">
					</span></td>
					<td class="ta_right submit"><button
							class="btn_common form blu" id="submit_btn">조회</button></td>
							<br>
									<tr>
		<th width="120" height="35" bgcolor="#C0FFFF">포인트</th>
 <td><input type='radio'/>전체
  <input type='radio' />입금한 포인트
  <input type='radio' />사용한 포인트												
						</td>
						</tr>				
				</tr></table>				
				</div>			
	<br>

	<div class=walletListTable>
		<table border="1" width="903" bgcolor="#B0F7FF">
			<tr height="10">
				<td width="100">번호</td>
				<td>일자</td>
				<td width="180">출금포인트</td>
				<td width="180">입금포인트</td>
				<td width="180">현재 포인트</td>

			</tr>
		</table>



		<c:if test="${ not empty LIST }">
			<c:forEach var="walletDtls" items="${LIST}"
				varStatus="walletDtlsStatus">
				<tr>
					<td>${walletDtlsStatus.count}</td>
					<td><fmt:formatDate value="${walletDtls.rcppayDt}"
							pattern="yyyy-MM-dd [E] a hh:mm:ss" /></td>
					<td><c:if test="${walletDtls.rcppayCl == 'D'}">
							<font color="red">입금</font>
						</c:if> <c:if test="${walletDtls.rcppayCl == 'W'}">
							<font color="blue">출금</font>
						</c:if></td>
					<td>${walletDtls.rcppayAmount}원</td>
					<td>${walletDtls.excngCoinCo}포인트</td>
				</tr>
			</c:forEach>
		</c:if>
	</div>
	<div
		style="border: 1px solid; padding: 10px; width: 880px; height: 500px">

		<div class="msg">
			<c:if test="${ empty LIST }">
				<b>${walletDtlsMsg }</b>
			</c:if>
		</div>
	</div>




</body>
</html>