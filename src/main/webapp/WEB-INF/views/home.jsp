<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>마인플루언서</title>
<link rel="stylesheet" href="resources/myLib/reset.css" />
<link rel="stylesheet" href="resources/myLib/header.css" />
<link rel="stylesheet" href="resources/myLib/main.css" />
<link rel="stylesheet" href="resources/myLib/hamburger.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="./module/header.jsp" />

			<div class="main_banner">
				<div class="banner_text">
					<p>다가오는 여름날을 위한</p>
					<h1>나만의 퍼스널 트레이너</h1>
					<p id="hashtag">
						<a href="#">#운동 <span id="hash_style">분야의</span> LOVELY
							SWIMMER
						</a>
					</p>
				</div>
			</div>
			<div class="swiper2 category">
				<div class="swiper-button-prev">
					<img src="resources/image/ic_arrow.svg" alt="왼쪽 이동"
						class="arrow arrow_left" />
				</div>
				<ul class="swiper-wrapper category_list">
					<li class="swiper-slide"><input type="radio"
						name="category_item" id="traning" class="category_input" checked />
						<label for="traning" class="category_label"> <img
							src="resources/image/traning-1.svg" alt="" />
							<p class="active_item">운동</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="travel" /> <label
						for="travel" class="category_label"> <img
							src="resources/image/travel-0.svg" alt="" />
							<p>여행</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="beauty" /> <label
						for="beauty" class="category_label"> <img
							src="resources/image/beauty-0.svg" alt="" />
							<p>뷰티</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="fashion" /> <label
						for="fashion" class="category_label"> <img
							src="resources/image/fashion-0.svg" alt="" />
							<p>패션</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="food" /> <label
						for="food" class="category_label"> <img
							src="resources/image/food-0.svg" alt="" />
							<p>먹방</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="cook" /> <label
						for="cook" class="category_label"> <img
							src="resources/image/cook-0.svg" alt="" />
							<p>요리</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="game" /> <label
						for="game" class="category_label"> <img
							src="resources/image/game-0.svg" alt="" />
							<p>게임</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="music" /> <label
						for="music" class="category_label"> <img
							src="resources/image/music-0.svg" alt="" />
							<p>음악</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="develop" /> <label
						for="develop" class="category_label"> <img
							src="resources/image/develop-0.svg" alt="" />
							<p>개발</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="animal" /> <label
						for="animal" class="category_label"> <img
							src="resources/image/animal-0.svg" alt="" />
							<p>동물</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="stock" /> <label
						for="stock" class="category_label"> <img
							src="resources/image/stock-0.svg" alt="" />
							<p>주식</p>
					</label></li>
					<li class="swiper-slide"><input type="radio"
						name="category_item" class="category_input" id="kids" /> <label
						for="kids" class="category_label"> <img
							src="resources/image/kids-0.svg" alt="" />
							<p>키즈</p>
					</label></li>
				</ul>
				<div class="swiper-button-next">
					<img src="resources/image/ic_arrow.svg" alt="오른쪽 이동"
						class="arrow arrow_right" />
				</div>
			</div>
		</header>
		<main>
			<div class="now_popularity">
				<div class="now_left">
					<h1>
						<span id="now_main">
								<c:if test="${not empty Login_Id && interest ne null}"> ${interest} </c:if>
								<c:if test="${empty Login_Id || interest eq null}"> 운동 </c:if>
						</span>분야<br /> <span>지금 인기</span>있는 인플루언서
					</h1>
					<div class="now_controll">
						<div class="now_arrow">
							<img src="resources/image/ic_arrow.svg" alt="왼쪽으로 이동"
								class="arrow now_arrow_left arrow_active" /> <img
								src="resources/image/ic_arrow.svg" alt="오른쪽으로 이동"
								class="arrow now_arrow_right" />
						</div>
						<div class="now_more">
							<span><a href="#">더 보기</a></span>
						</div>
					</div>
				</div>
				<div class="now_right">
					<!-- 콘텐츠 출력공간 -->
					<c:if test="${empty Login_Id || interest eq null}">
						<c:forEach var="lista" begin="0" end="2" items="${list}" >
							<div class="pop_card active">
								<img src="${lista.image}" alt="인플루언서" />
								<div class="pop_text">
									<h3 id="card">${lista.name}</h3>
									<span>구독자						
								         ${lista.subscribe.substring(0,lista.subscribe.length()-4)}만명
							        </span>
									<div class="pop_hashtag">
										<span>#운동</span> <span>#패션</span> <span>#여행</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${not empty Login_Id && interest ne null}">
						<c:forEach var="lista" begin="0" end="2" items="${list}" >
							<div class="pop_card active">
								<img src="${lista.image}" alt="인플루언서" />
								<div class="pop_text">
									<h3 id="card">${lista.name}</h3>
									<span>구독자						
								         ${lista.subscribe.substring(0,lista.subscribe.length()-4)}만명
							        </span>
									<div class="pop_hashtag">
										<span>#${interest}</span> <span>#패션</span> <span>#여행</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="increase">
				<div class="main_banner">
					<h1>
						<span id="increase_main">운동</span> 분야<br /> <span>지금 뜨는</span> 영상
					</h1>
					<a href="rankf">더 보기</a>
				</div>
				<div class="increase_video">
					<div class="video_box">
						<img src="resources/image/youtube.jpg" alt="영상으로 이동" />
						<h5>명절이니까 운동도 '세배' 더...</h5>
						<div>
							<span>GYM JONG KOOK</span> <span>조회수 254만회</span> <span>5일전</span>
						</div>
					</div>
					<div class="video_box">
						<img src="resources/image/youtube.jpg" alt="영상으로 이동" />
						<h5>명절이니까 운동도 '세배' 더...</h5>
						<div>
							<span>GYM JONG KOOK</span> <span>조회수 254만회</span> <span>5일전</span>
						</div>
					</div>
					<div class="video_box">
						<img src="resources/image/youtube.jpg" alt="영상으로 이동" />
						<h5>명절이니까 운동도 '세배' 더...</h5>
						<div>
							<span>GYM JONG KOOK</span> <span>조회수 254만회</span> <span>5일전</span>
						</div>
					</div>
				</div>
			</div>
			<div class="suggestion">
				<h1>이런건 어때요?</h1>
				<h5>
					<img src="resources/image/sub_banner.jpg" alt="우리 모두 개발자" />
					<p>
						초봉 5천만원<br /> <span>우리 모두 개발자</span>
					</p>
				</h5>
			</div>
		</main>
	</div>

	<footer>
		<jsp:include page="./module/footer.jsp" />
	</footer>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/header.js"></script>
	<script src="resources/myLib/main.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script>
			// 배너 swiper
			const swiper1 = new Swiper('.swiper1', {});
			// 카테고리 swiper
			const swiper2 = new Swiper('.swiper2', {
				slidesPerView: 6,
				loop: false,
				spaceBetween: 20,
				touchRatio: 0, //드래그 금지
				// Navigation arrows
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			});
		</script>
</body>
</html>