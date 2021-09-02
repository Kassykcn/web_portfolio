<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>tab</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="img/icon.png" />
		<link rel="apple-touch-icon" href="img/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->

		<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<![endif]-->

		<style type="text/css">
			/** 정체 요소의 기본 여백 초기화 */
            * {padding: 0; margin: 0;}

            /** 탭 박스의 기본 크기와 중앙 정렬 및 상하 여백 */
            #container { width: 500px; margin: 20px auto; }

            /** 탭 버튼의 초기화 및 레이어 띄우기 > 내용영역과 1px 겹쳐져야 한다. */
            ul.tab{
                list-style: none; position: relative; z-index: 100;
            }

            /** 개별 버튼에 대한 기본 크기와 가로 정렬 */
            ul.tab li {
                width: 100px; height: 40px; float: left;
            }

            /** float 속성 해제 처리 */
            ul:after {
                content : ''; display: block; float: none; clear: both;
            }

            /** 탭 버튼의 기본 배경 처리와 글자 형태 처리 */
            ul.tab li a {
                background : url("img/tab.jpg");
                display: block; color: #222; line-height: 40px;
                text-align: center; text-decoration: none;
            }

            /** 현재 황성 탭의 배경 이미지 별도 처리 */
            ul.tab li a.selected{
                background: url("img/tab_selected.jpg");
            }

            /** 내용영역의 테두리 처리 및 상단으로 -1px 이동시킴.
            * 버튼 영역과 1px 겹치게 처리해서 활성 탭이 뚫려 있는 효과 연출 */
            p.panel{
                border: 1px solid #9fb7d4;
                position: relative;
                top: -1px;
                padding: 10px;
                margin: 0; 
            }
		</style>

		<!-- jQuery Framework 참조하기 -->
		<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
		<!-- 사용자 스크립트 블록 -->
		<script type="text/javascript">
			$(function(){
                /**페이지 열릴 때, 기본 탭의 내용 출력 처리 */
                //panel 이라는 클래스를 갖는 p태그 안에,
                //탭 버튼 안의 selected 클래스가 적용된 링크의 href 속성이 가리키는
                //URL값을 load함수에게 전달한다.
                //-->즉, 링크가 가리키는 파일을 읽어서 <p>안에 출력한다.
                    $("p.panel").load($("ul.tab li a.selected").attr("href"));

                    /** 탭버튼의 클릭 처리 */
                    $("ul.tab li a").click(function(){
                        //클릭된 요소를 제외한 나머지에게 selected 클래스 제거 --> 배경 이미지 원상복구됨
                        $("ul.tab li a").not(this).removeClass("selected");

                        //클릭된 요소에게 selected클래스 적용 --> 배경이미지 변경됨
                        $(this).addClass("selected");

                        //클릭된 요소의 href 속성값이 가리키는 파일을 읽어서 <p>에 출력함
                            $("p.panel").load($(this).attr("href"));

                            //페이지 이동 방지
                            return false;
                    });
            });
		</script>

	</head>

	<body>
		<!-- 탭의 전체 박스-->
        <div id="container">
            <!--탭 버튼 영역 -->
            <ul class="tab">
                <li><a href="txt/html5.txt" class="selected">HTML5</a></li>
                <li><a href="txt/jquery.txt">jQuery</a></li>
                <li><a href="txt/bootstrap.txt">Bootstrap3</a></li>
            </ul>
            <!--내용영역-->
            <p class="panel"></p>
        </div>
	</body>
</html>
