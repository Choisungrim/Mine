<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<title>마인플루언서</title>
		<link rel="stylesheet" href="resources/myLib/reset.css" />
		<link rel="stylesheet" href="resources/myLib/header.css" />
		<link rel="stylesheet" href="resources/myLib/main.css" />
		<link rel="stylesheet" href="resources/myLib/hamburger.css" />
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	</head>
	<body>
		<div id="container">
			<header>
				<div class="nav">
					<nav>
						<div class="nav_left">
							<h1>
								<img src="resources/image/logo.svg" alt="마인플루언서" /><span id="mine">MINE<span>플루언서</span></span>
							</h1>
							<ul>
								<li><a href="mylistf">찜 목록</a></li>
								<li><a href="rankf">랭킹</a></li>
								<li><a href="#">About</a></li>
								<c:if test="${Login_Name == '최성림'}">
									<li><a href="ytube">index</a></li>
								</c:if>
							</ul>
						</div>
						<div class="nav_right">
						<c:if test="${empty Login_Id}">
							<span><a href="loginf">로그인</a></span>
							<span id="join"><a href="joinf">회원가입</a></span>
							<div class="hamIcon">
								<span> </span>
								<span> </span>
								<span> </span>
							</div>
							
						</c:if>
						<c:if test="${not empty Login_Id}">
							<span>${Login_Name}님 환영합니다.</span>
							<span id="join"><a href="logout">로그아웃</a></span>
							<!-- <img src="resources/image/hamberger.svg" alt="메뉴" /> 햄버거 메뉴 아이콘-->
							<div class="hamIcon">
								<span> </span>
								<span> </span>
								<span> </span>
							</div>
						</c:if>
							<article id="hamMenu">
				                <div id="hamTop">
				                    <h1 class=hidden>햄버거 메뉴 회원 정보</h1>
				                	<div id="hamInfo_default">
				                		<c:if test="${empty Login_Id}">
											<span style="font-size:2rem; display:flex;">로그인을 먼저 해주세요</span>
										</c:if>
									</div>
									<div id="hamInfo_login">
										<c:if test="${not empty Login_Id}">
											<span style="font-size:2rem;">${Login_Name}님</span>
											<span style="font-size:2rem;">${Login_Email}</span>
											<span id="join" style="font-size:2rem;"><a href="logout">로그아웃</a></span>
										</c:if>
				                	</div>
				                </div>
				                
				                <div id="hamBottom">
				               		<h1 class="hidden">햄버거 메뉴 리스트</h1>
				                    <ul>
				                        <li><a href="#"><span>마이페이지</span></a></li>
				                        <li><a href="mylistf"><span>찜 목록</span></a></li>
				                        <li><a href="rankf"><span>랭킹</span></a></li>
				                        <li><a href="#"><span>About</span></a></li>
				                        <li><a href="#"><span>검색</span></a></li>
				                    </ul>
				                </div>
				            </article>
						</div>
					</nav>
				</div>
				<div class="main_banner">
					<div class="banner_text">
						<p>다가오는 여름날을 위한</p>
						<h1>나만의 퍼스널 트레이너</h1>
						<p id="hashtag">
							<a href="#">#운동 <span id="hash_style">분야의</span> LOVELY SWIMMER</a>
						</p>
					</div>
				</div>
				<div class="swiper2 category">
					<div class="swiper-button-prev"><img src="resources/image/ic_arrow.svg" alt="왼쪽 이동" class="arrow arrow_left" /></div>
					<ul class="swiper-wrapper">
						<li class="swiper-slide"><img src="resources/image/traning.svg" alt="" /><span class="category_active">운동</span></li>
						<li class="swiper-slide"><img src="resources/image/travel.svg" alt="" /><span>여행</span></li>
						<li class="swiper-slide"><img src="resources/image/beauty.svg" alt="" /><span>뷰티</span></li>
						<li class="swiper-slide"><img src="resources/image/fashion.svg" alt="" /><span>패션</span></li>
						<li class="swiper-slide"><img src="resources/image/food.svg" alt="" /><span>먹방</span></li>
						<li class="swiper-slide"><img src="resources/image/cook.svg" alt="" /><span>요리</span></li>
						<li class="swiper-slide"><img src="resources/image/game.svg" alt="" /><span>게임</span></li>
						<li class="swiper-slide"><img src="resources/image/music.svg" alt="" /><span>음악</span></li>
						<li class="swiper-slide"><img src="resources/image/develop.svg" alt="" /><span>개발</span></li>
						<li class="swiper-slide"><img src="resources/image/animal.svg" alt="" /><span>동물</span></li>
						<li class="swiper-slide"><img src="resources/image/stock.svg" alt="" /><span>주식</span></li>
						<li class="swiper-slide"><img src="resources/image/quiz.svg" alt="" /><span>퀴즈</span></li>
					</ul>
					<div class="swiper-button-next"><img src="resources/image/ic_arrow.svg" alt="오른쪽 이동" class="arrow arrow_right" /></div>
				</div>
			</header>
			<main>
				<div class="now_popularity">
					<div class="now_left">
						<h1>
							<span id="now_main">
							<c:if test="${not empty Login_Id && interest ne null}">
							${interest}
							</c:if>
							<c:if test="${empty Login_Id || interest eq null}">
							운동
							</c:if>
							</span> 분야<br/>
							<span>지금 인기</span>있는 인플루언서
						</h1>
						<div class="now_controll">
							<div class="now_arrow">
								<img src="resources/image/ic_arrow.svg" alt="왼쪽으로 이동" class="arrow arrow_left arrow_active" />
								<img src="resources/image/ic_arrow.svg" alt="오른쪽으로 이동" class="arrow arrow_right" />
							</div>
							<div class="now_more">
								<span><a href="#">더 보기</a></span>
							</div>
						</div>
					</div>
					<div class="now_right">
						<div class="pop_card active">
							<c:if test="${not empty Login_Id && interest ne null}">
							<img src="${img1}" width=300 height = 400 alt="인플루언서" />
							<div class="pop_text">
								<h3>${name1}</h3>
								<span>구독자 ${subs1}만명</span>
								<div class="pop_hashtag">
									<span>#${interest}</span>
									<span>#패션</span>
									<span>#여행</span>
								</div>
							</div>
							</c:if>
							<c:if test="${empty Login_Id || interest eq null}">
							<img src="resources/image/logo.svg" alt="인플루언서" />
							<div class="pop_text">
								<h3>LOVELY SWIMMER</h3>
								<span>구독자 21.8 만명</span>
								<div class="pop_hashtag">
									<span>#${interest}</span>
									<span>#패션</span>
									<span>#여행</span>
								</div>
							</div>
							</c:if>
						</div>
						<div class="pop_card">
							<c:if test="${not empty Login_Id && interest ne null}">
							<img src="${img2}" width=300 height = 400 alt="인플루언서" />
							<div class="pop_text">
								<h3>${name2}</h3>
								<span>구독자 ${subs2}만명</span>
								<div class="pop_hashtag">
									<span>#${interest}</span>
									<span>#패션</span>
									<span>#여행</span>
								</div>
							</div>
							</c:if>
							<c:if test="${empty Login_Id || interest eq null}">
							<img src="resources/image/logo.svg" alt="인플루언서" />
							<div class="pop_text">
								<h3>LOVELY SWIMMER</h3>
								<span>구독자 21.8 만명</span>
								<div class="pop_hashtag">
									<span>#${interest}</span>
									<span>#패션</span>
									<span>#여행</span>
								</div>
							</div>
							</c:if>
						</div>
						<div class="pop_card">
							<c:if test="${not empty Login_Id && interest ne null}">
							<img src="${img3}" width=300 height = 400 alt="인플루언서" />
							<div class="pop_text">
								<h3>${name3}</h3>
								<span>구독자 ${subs3}만명</span>
								<div class="pop_hashtag">
									<span>#${interest}</span>
									<span>#패션</span>
									<span>#여행</span>
								</div>
							</div>
							</c:if>
							<c:if test="${empty Login_Id || interest eq null}">
							<img src="resources/image/logo.svg" alt="인플루언서" />
							<div class="pop_text">
								<h3>LOVELY SWIMMER</h3>
								<span>구독자 21.8 만명</span>
								<div class="pop_hashtag">
									<span>#${interest}</span>
									<span>#패션</span>
									<span>#여행</span>
								</div>
							</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="increase">
					<div class="main_banner">
						<h1>
							<span id="increase_main">
							<c:if test="${not empty Login_Id && interest ne null}">
							${interest}
							</c:if>
							<c:if test="${empty Login_Id || interest eq null}">
							운동
							</c:if>
							</span> 분야<br />
							<span>지금 뜨는</span> 영상
						</h1>
						<a href="#">더 보기</a>
					</div>
					<div class="increase_video">
						<div class="video_box">
							<img src="resources/image/youtube.jpg" alt="영상으로 이동" />
							<h5>명절이니까 운동도 '세배' 더...</h5>
							<div>
								<span>GYM JONG KOOK</span>
								<span>조회수 254만회</span>
								<span>5일전</span>
							</div>
						</div>
						<div class="video_box">
							<img src="resources/image/youtube.jpg" alt="영상으로 이동" />
							<h5>명절이니까 운동도 '세배' 더...</h5>
							<div>
								<span>GYM JONG KOOK</span>
								<span>조회수 254만회</span>
								<span>5일전</span>
							</div>
						</div>
						<div class="video_box">
							<img src="resources/image/youtube.jpg" alt="영상으로 이동" />
							<h5>명절이니까 운동도 '세배' 더...</h5>
							<div>
								<span>GYM JONG KOOK</span>
								<span>조회수 254만회</span>
								<span>5일전</span>
							</div>
						</div>
					</div>
				</div>
				<div class="suggestion">
					<h1>이런건 어때요?</h1>
					<h5>
						<img src="resources/image/sub_banner.jpg" alt="우리 모두 개발자" />
						<p>
							초봉 5천만원<br />
							<span>우리 모두 개발자</span>
						</p>
					</h5>
				</div>
			</main>
		</div>
		<footer>
			<div class="footer_container">
				<div class="mine_about">
					<h1>MINE플루언서</h1>
					<p>
						마인플루언서는 사용자의 관심사에 맞춘 인플루언서를 추천하여 쉽고 빠르게 찾을 수 있도록 도와줍니다.<br /><br />원하는 인플루언서만
						모아서 볼 수 있으며 요즘 핫한 인플루언서를 분야별로 순위를 볼 수 있는 플랫폼입니다.
					</p>
				</div>
				<div class="team_about">
					<h1>TEAM 소개</h1>
					<div class="team_dev">
						<div class="dev_left">
							<span>김지후</span>
							<span>유준재</span>
							<span>이윤화</span>
						</div>
						<div class="dev_right">
							<span>장희진</span>
							<span>전주현</span>
							<span>최성림</span>
						</div>
					</div>
				</div>
				<div class="about_logo">
					<img src="resources/image/logo.svg" alt="footer 로고" />
					<h1>나의 취향에 맞는<br />인플루언서를 만나다!</h1>
				</div>
				<div id="line"></div>
			</div>
		</footer>
		<script src="resources/myLib/jquery-3.2.1.min.js"></script>
		<script src="resources/myLib/header.js"></script>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	    <script>
	    	// 배너 swiper
	    	const swiper1 = new Swiper('.swiper1', {
	    		
	    	});
	        // 카테고리 swiper
	    	const swiper2 = new Swiper('.swiper2', {
	            slidesPerView: 6,
	            loop: false,
	            spaceBetween: 20,
					        
	            // Navigation arrows
	            navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	            },
	        
	        });
	    </script>
	</body>
</html>
