/*
2021.08.25~26 LMJ
javascript, jquery

오늘 날짜 전역변수 설정,
화면 첫 시작 시 자동 적용사항 입력,
숫자만 입력,
구분값(구매/경매)에 따른 필드 숨김/표시, 
카테고리 중분류 소분류 숨김/표시,
입력값 유효성 검사
*/

/*** 오늘 날짜 구하기 ***/
var date = new Date();
var year = date.getFullYear().toString();
var month = date.getMonth()+1;
month = month < 10 ? '0' + month.toString() : month.toString();
var date = date.getDate().toString();
date = date < 10 ? '0' + date.toString() : date.toString();
var today = year+month+date;

/*** 화면 첫 시작 시 자동 적용사항 입력 ***/
$(document).ready(function (){
	// 구분 값 선택 전 <tr>태그 숨김
	$("#buy_tr").css("display","none");
	$("#auction_tr1").css("display","none");
	$("#auction_tr2").css("display","none");
	// 카테고리 중분류 소분류 숨김
	$("#category_second").css("display","none");
	$("#category_third").css("display","none");
	
	
	//alert(today);
	$("#start_date").val(today);
});

/*** 금액부분에 천단위 콤마 넣기 ***/
function add_comma(e){
	//var input = e.getAttribute('id'); // id 불러오기
	//alert(input);
	var value = e.value; // 값 불러오기
	
	// ,가 있다면 모든 , 삭제 후 number로 형변환
	if(value.indexOf(",") != -1 || value.indexOf(",") != 0){
		value = Number(value.replace("/,/gi", ""));
	}else{ // ,가 없다면 number로 형변환
		value = Number(value);
	}
	// 천단위마다 ,넣는 함수 toLocaleString('ko-KR')
	e.value = value.toLocaleString('ko-KR');
}

/*** 구분 값(구매/경매) ***/
function classify_change(){
	//var classify = $("#classify").val(); //select박스 버전
	var classify = $("input[name=classify]:checked").val(); //radio버튼 버전

	//값이 0이 아닐때에만 동작, 구분 값에 따라 <tr>태그 숨김/표시
	//if(classify != "0"){ //select박스 버전
		if(classify == "auction"){
			$("#buy_tr").css("display","none");
			$("#auction_tr1").css("display","");
			$("#auction_tr2").css("display","");
		}else{
			$("#auction_tr1").css("display","none");
			$("#auction_tr2").css("display","none");
			$("#buy_tr").css("display","");
		}
	//}
}

/*** 카테고리 ***/
function category_select(){
	var first = $("#category_first").val(); //대분류
	var second = $("#category_second").val(); //중분류
	//대분류 선택 시 중분류 표시
	if(first != 0){
		$("#category_second").css("display","");
	}
	//중분류 선택 시 소분류 표시
	if(second != 0){
		$("#category_third").css("display","");
	}
}

/*** 유효성 검사 ***/
function submit_check(){

	//구분
	if(!$("input[name=classify]").is(":checked")){
		alert("구분 중 하나를 선택해주세요");
		return false;
	}
	//카테고리
	if($("#category_first").val() == 0 || $("#category_second").val() == 0 || $("#category_third").val() == 0 ){
		alert("카테고리를 소분류까지 선택해주세요");
		return false;
	}
	//제목
	if($("#title").val() == ""){
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
	//등급
	if(!$("input[name=grade]").is(":checked")){
		alert("등급 중 하나를 선택해주세요");
		return false;
	}

	//기간
	if($("#start_date").val() == "" || $("#end_date").val() == ""){
		alert("경매 시작일이나 경매 종료일을 입력해주세요");
		$("#end_date").focus();
		return false;
	}else{
		
		//시작일이 오늘날짜보다 작지 않도록
		if($("#start_date").val() < today){
			alert("경매 시작일은 지난 날짜로 입력할 수 없습니다");
			$("#start_date").focus();
			return false;
		}
		//종료일이 시작일보다 작지 않도록 
		if($("#end_date").val() < $("#start_date").val()){
			alert("경매 종료일은 경매시작일보다 작을 수 없습니다");
			$("#end_date").focus();
			return false;
		}
		//종료일 = 시작일+3일
		if(($("#end_date").val() - $("#start_date").val()) >= 3){
			alert("경매 종료일은 경매시작일로부터 3일을 초과할 수 없습니다"+
					"\n현재 입력한 기간:"+($("#end_date").val() - $("#start_date").val() +1)+"일");
			$("#end_date").focus();
			return false;
		}
	}
	
	//구분값(구매/경매)에 따라 가격 / 최소입찰가,즉시낙찰가를 분리하기 위한 변수 
	var classify = $("input[name=classify]:checked").val();
	
	//가격
	if(classify == "buy" && ($("#price").val() == "" || $("#price").val() == "0")){
		alert("가격을 입력해주세요");
		$("#price").focus();
		return false;
	}
	
	//최소입찰가
	if(classify == "auction" && ($("#min_bid").val() == "" || $("#min_bid").val() == "0")){
		alert("최소 입찰가를 입력해주세요");
		$("#min_bid").focus();
		return false;
	}
	
	//즉시낙찰가
	if(classify == "auction" && ($("#win_bid").val() == "" || $("#win_bid").val() == "0")){
		alert("즉시 낙찰가를 입력해주세요");
		$("#win_bid").focus();
		return false;
	}
	// 즉시낙찰가 < 최소입찰가 방지
	if(classify == "auction" && ($("#win_bid").val() <= $("#min_bid").val()) ){
		alert("즉시 낙찰가는 최소입찰가보다 작을 수 없습니다.");
		$("#win_bid").val("");
		$("#win_bid").focus();
		return false;
	}
	
	//상세설명
	if($("#details").val() == ""){
		alert("상세설명을 입력해주세요");
		$("#details").focus();
		return false;
	}
	
	//이미지
	if($("#image").val() == ""){
		alert("이미지를 추가해주세요");
		$("#image").focus();
		return false;
	}

}