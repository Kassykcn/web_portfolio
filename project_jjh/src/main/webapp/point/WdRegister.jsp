<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>출금 계좌 등록</h2>
<table border="2" width="400" height="50">
<tr>
<td>은행명</td>  
<td>&nbsp;&nbsp;<select name="language" style="width:90px;height:25px;" > 
    <option value="none">=== 선택 ===</option>
    <option value="경남">경남은행</option>
    <option value="국민" selected>국민은행</option>
    <option value="기업">기업은행</option>
   <option value="대구">대구은행</option>
<option value="단위">단위농협</option>
<option value="부산">부산은행</option>
<option value="새마을">새마을금고</option>
<option value="신한">신한은행</option>
<option value="시티">시티은행</option>
<option value="신협">신협</option>
<option value="우체국">우체국</option>
<option value="제주은행">제주은행</option>
<option value="케이뱅크">케이뱅크</option>
<option value="카카오">카카오뱅크</option>
<option value="하나">하나은행</option>
  </select></td>
</tr>
<tr>
<td>계좌번호</td>
<td>&nbsp;&nbsp;<input type="text" style="width:200px;height:25px;"></td>
</tr>
<tr>
<td>예금주명</td>
<td>&nbsp;&nbsp;<input type="text" style="width:90px;height:25px;"></td>
</tr>

</table>
<br>
<button type="button" class="btn-light" style="text-align:center; width:100px; height:30px;">취소</button> 
			 <button type="button" class="btn-light" style="text-align:center; width:100px; height:30px;" onclick="window.location.href='Withdraw.jsp'">신청하기</button>
</body>
</html>