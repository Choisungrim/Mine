<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="resources/myLib/reset.css" />
		<link rel="stylesheet" href="resources/myLib/modal/modal.css" />
		<title>Modal</title>
	</head>
	<body>
		<!-- Modal은 하나의 구조를 만들어 놓고 copy해서 쓰는게 좋을 거 같아요 -->
		<div class="modal_container" id="modal">
			<div class="modal_box">
				<img src="resources/image/close.svg" alt="닫기" id="close" />
				<div class="modal_content">
					<div class="modal_text">
						<h1>삭제하시겠습니까?</h1>
						<p>* 브베 외 99 명의 인플루언서</p>
					</div>
					<div class="modal_btn">
						<button id="cancel">취소</button>
						<button id="delete"><a href="#">삭제하기</a></button>
					</div>
				</div>
			</div>
		</div>
		<script src="resources/myLib/jquery-3.2.1.min.js"></script>
		<script src="resources/myLib/modal/modal.js"></script>
	</body>
</html>
