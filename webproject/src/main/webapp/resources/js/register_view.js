/*
2021.08.26 LMJ
javascript, jquery

찜 버튼 클릭 시 아이콘 변경
 - 참고 사이트 : https://www.flaticon.com/kr/free-icons/heart-shape?word=%ED%95%98%ED%8A%B8%20%EB%AA%A8%EC%96%91&type=icon&color=1&stroke=1&order_by=4

*/

$(document).ready(function (){
	//서브 이미지 클릭 시 큰 이미지로 변경
	$(".sub_img").click(function(){
		var image1 = $(".title_img").attr("src");
		var image2 = $(".sub_img").attr("src");
		$(".title_img").attr("src", function(index, attr){
			if(attr.match(image1)){
				return attr.replace(image1, image2);
			}else{
				return attr.replace(image2, image1);
			}
		});
		$(".sub_img").attr("src", function(index, attr){
			if(attr.match(image1)){
				return attr.replace(image1, image2);
			}else{
				return attr.replace(image2, image1);
			}
		});
	});
	
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
	
	//
	$("#price_btn").click(function(){
		confirm("구매하시겠습니까?");
		$("#price_form").submit();
	});
	
	
	//입찰가 입력 및 버튼 클릭 시
	$("#now_bid_btn").click(function(){
		confirm("입찰하시겠습니까?");
		if($("#now_bid").val() < $("#min_bid").val()){
			alert("최소입찰가보다 적게 입력할 수 없습니다.");
			$("#now_bid").empty();
			$("#now_bid").focus();
		}
		$("#now_bid_form").submit();
	});
	
	//즉시 낙찰 버튼 클릭
	$("#win_bid_btn").click(function(){
		confirm("즉시 낙찰하시겠습니까?");
		$("#win_bid_form").submit();
	});
	
	
	
	//QnA <textarea> 글자 수 세기
	$("#Q_text").keydown(function(){
		$("#Q_length").text($("#Q_text").val().length);
	});
	
	//비공개 여부 클릭
	$("#secretCk").click(function(){
		if($("#secretCk").is(":checked") == true){
			$("#Q_secret").val("Y");
		}else{
			$("#Q_secret").val("N");
		}
	});
	
	$("#report").click(function(){
		confirm("신고하시겠습니까?");
	});
	
	//답변달기는 숨김처리했다가 클릭되면 답변달기
	$(".answer").css('display','none');
	$(".write_answer").click(function(){
		$(".answer").css('display','');
	});
	
	
});

