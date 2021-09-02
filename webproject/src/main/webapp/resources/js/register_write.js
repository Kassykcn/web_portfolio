/*
2021.08.25~26 LMJ
javascript, jquery

금액부분에 천단위 마다 ,넣는 함수,
오늘 날짜 설정,
숫자만 입력,
구분값(구매/경매)에 따른 필드 숨김/표시, 
카테고리 중분류 소분류 숨김/표시,
입력값 유효성 검사
*/


/*** 금액부분에 천단위 콤마 넣기 ***/
function add_comma(value){
	var num = value;
	// ,가 있다면 모든 , 삭제 후 number로 형변환
	if(value.indexOf(",") != -1 || value.indexOf(",") != 0){
		num = value.replace(/,/g, "");
	}
	// 천단위마다 ,넣는 함수 toLocaleString('ko-KR')
	num = Number(num).toLocaleString('ko-KR');
	
	return num;
}

/*** 금액부분에 천단위 콤마 지우기
 * 폼에서 넘길때 오류 방지 ***/
function remove_comma(value){
	// 모든 , 삭제
	var n = value.replace(/,/g, "");
	
	return n;
}

/*** 화면 첫 시작 시 자동 적용사항 입력 ***/
$(document).ready(function (){
	/*** 오늘 날짜 구하기 ***/
	var date = new Date();
	var year = date.getFullYear().toString();
	var month = date.getMonth()+1;
	month = month < 10 ? '0' + month.toString() : month.toString();
	var date = date.getDate().toString();
	date = date < 10 ? '0' + date.toString() : date.toString();
	var today = year+month+date;
	
	// 구분 값 선택 전 <tr>태그 숨김
	$("#buy_tr").css("display","none");
	$("#auction_tr1").css("display","none");
	$("#auction_tr2").css("display","none");
	// 카테고리 중분류 소분류 숨김
	$("#category_second").css("display","none");
	$("#category_third").css("display","none");
	// 시작일에 오늘 날짜 입력
	$("#start_date").val(today);
	
	/*** 구분 값(구매/경매) ***/
	$("input[name=classify]").click(function(){
		var classify = $("input[name=classify]:checked").val();
		//값이 0이 아닐때에만 동작, 구분 값에 따라 <tr>태그 숨김/표시
		if(classify == "경매"){
			$("#buy_tr").css("display","none");
			$("#auction_tr1").css("display","");
			$("#auction_tr2").css("display","");
		}else{
			$("#auction_tr1").css("display","none");
			$("#auction_tr2").css("display","none");
			$("#buy_tr").css("display","");
		}
	});
	
	/*** 카테고리 ***/
	// 대분류 클릭시 중분류 표시, 중분류 클릭 시 소분류 표시	
	$("#category_first").change(function(){
		//대분류 선택 시 중분류 표시
		if($("#category_first").val() != 0){
			$("#category_second").css("display","");
		}
	});
	$("#category_second").change(function(){
		//중분류 선택 시 소분류 표시
		if($("#category_second").val() != 0){
			$("#category_third").css("display","");
		}
	});
	
	/*** 금액에 , 추가 ***/
	$("#price").blur(function(){
		var comma = add_comma($("#price").val());
		$("#price").val(comma);
	});
	$("#min_bid").blur(function(){
		var comma = add_comma($("#min_bid").val());
		$("#min_bid").val(comma);
	});
	$("#win_bid").blur(function(){
		var comma = add_comma($("#win_bid").val());
		$("#win_bid").val(comma);
	});
	
	/*** 유효성 검사 ***/ 
	//등록이나 수정버튼 클릭 시
	$("#submit_btn").click(function(){
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
		if(classify == "구매" && ($("#price").val() == "" || $("#price").val() == "0")){
			alert("가격을 입력해주세요");
			$("#price").focus();
			return false;
		}
		
		//최소입찰가
		if(classify == "경매" && ($("#min_bid").val() == "" || $("#min_bid").val() == "0")){
			alert("최소 입찰가를 입력해주세요");
			$("#min_bid").focus();
			return false;
		}
		
		//즉시낙찰가
		if(classify == "경매" && ($("#win_bid").val() == "" || $("#win_bid").val() == "0")){
			alert("즉시 낙찰가를 입력해주세요");
			$("#win_bid").focus();
			return false;
		}
		// 즉시낙찰가 < 최소입찰가 방지
		if(classify == "경매" && ($("#win_bid").val() <= $("#min_bid").val()) ){
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
		/*if($("#file").val() == ""){
			alert("이미지를 추가해주세요");
			$("#file").focus();
			return false;
		}*/
		
		/*** 금액에 , 제거 ***/
		if(classify == "경매"){
			var m_delc = remove_comma($("#min_bid").val());
			$("#min_bid").val(m_delc);
			var w_delc = remove_comma($("#win_bid").val());
			$("#win_bid").val(w_delc);
		}else if(classify == "구매"){
			var p_delc = remove_comma($("#price").val());
			$("#price").val(p_delc);
		}
		
		$("form").submit();
	});

	
});