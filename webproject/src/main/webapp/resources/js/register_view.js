/*
2021.08.26 LMJ
javascript, jquery

찜 버튼 클릭 시 아이콘 변경
 - 참고 사이트 : https://www.flaticon.com/kr/free-icons/heart-shape?word=%ED%95%98%ED%8A%B8%20%EB%AA%A8%EC%96%91&type=icon&color=1&stroke=1&order_by=4

*/

$(document).ready(function (){
	//찜 버튼 클릭 시 하트 이미지 변경
	$("#like_btn").click(function(){
		$(".like_img").attr("src", function(index, attr){
			if(attr.match("empty")){
				return attr.replace("empty", "full");
			}else{
				return attr.replace("full", "empty");
			}
		});
	});
	
	//등급 ?이미지 마우스 오버일때 이미지 변경
	$(".grade_help_img").hover(function(){
		$(".grade_help_img").attr("src", function(index, attr){
			if(attr.match("white")){
				return attr.replace("white", "black");
			}else{
				return attr.replace("black", "white");
			}
		});
	});
	
	//즉시 낙찰 버튼 클릭
	$("#win_bid_btn").click(function(){
		confirm("즉시 낙찰하시겠습니까?");
	});
	
	//입찰가 입력 및 버튼 클릭 시
	$("#now_bid_btn").click(function(){
		confirm("입찰하시겠습니까?");
	});
	
	//QnA <textarea> 글자 수 세기
	$("#QnA_text").keydown(function(){
		$("#QnA_length").text($("#QnA_text").val().length);
	});
	
	//비공개 여부 클릭
	$("#secretCk").click(function(){
		if($("#secretCk").is(":checked") == true){
			$("#QnA_secret").val("Y");
		}else{
			$("#QnA_secret").val("N");
		}
	});
	
	$("#report").click(function(){
		confirm("신고하시겠습니까?");
	});
	
});

