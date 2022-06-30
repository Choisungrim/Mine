<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랭킹</title>
    <link rel="stylesheet" href="resources/myLib/reset.css" />
    <link rel="stylesheet" href="resources/myLib/header.css" />
    <link rel="stylesheet" href="resources/myLib/footer.css" />
    <link rel="stylesheet" href="resources/myLib/ranking/ranking.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
</head>

<body>
    <header>

    </header>
    <main>
        <nav>
            <h2 class="hidden">랭킹 서브메뉴</h2>
            <div class="heading">
                <span>Ranking</span>
                <div>
                   	<span id="all" class="on">전체</span>
                    <span id="category_one" class="">카테고리</span>
                </div>
            </div>
            <div class="category_wrap">
                <ul class="swiper">
                    <li class=""><img src="resources/image/ic_arrow.svg" alt="왼쪽 이동" class="swiper-button-prev arrow arrow_left" /></li>
                    <li class="swiper category_scroll">
                        <ul class="swiper-wrapper minef_swiper">
                            <li id="c1" class="swiper-slide btn20px"><span class="text">개발</span></li>
                            <li id="c2" class="swiper-slide btn20px"><span class="text">게임</span></li>
                            <li id="c3" class="swiper-slide btn20px"><span class="text">동물</span></li>
                            <li id="c4" class="swiper-slide btn20px"><span class="text">먹방</span></li>
                            <li id="c5" class="swiper-slide btn20px"><span class="text">뷰티</span></li>
                            <li id="c6" class="swiper-slide btn20px"><span class="text">여행</span></li>
                            <li id="c7" class="swiper-slide btn20px"><span class="text">요리</span></li>
                            <li id="c8" class="swiper-slide btn20px"><span class="text">운동</span></li>
                            <li id="c9" class="swiper-slide btn20px"><span class="text">음악</span></li>
                            <li id="c10" class="swiper-slide btn20px"><span class="text">주식</span></li>
                            <li id="c11" class="swiper-slide btn20px"><span class="text">키즈</span></li>
                            <li id="c12" class="swiper-slide btn20px"><span class="text">패션</span></li>
                        </ul>
                    </li>
                    <li class=""><img src="resources/image/ic_arrow.svg" alt="오른쪽 이동" class="swiper-button-next arrow arrow_right" /></li>
                </ul>
            </div>
        </nav>

        <div>
            <div id="top3">
                <h1 class="hidden">인기 TOP3</h1>
                <div id="rank_2" class="rank_side">
                    <span class="hidden">2위</span>
                    <div class="rank_header">
                        <img src="${tytuber.image}" alt="프로필사진">
                        <div class="rank_num">${tytuber.seq}</div>
                    </div>
                    <div class="details">
                        <span>${tytuber.name}</span>
                        <div class="mine_num">
                            <span class="hidden">찜 개수</span>
                            <img src="resources/image/ic_heart-1.svg"> 
                            <span>${tytuber.good}</span>
                        </div>
                        <div class="hashtag">
                            <span>#${tytuber.job}</span>
                            <span>#운동</span>
                            <span>#20대_인기</span>
                        </div>
                    </div>
                </div>
                <div id="rank_1" class="rank_main">
                    <span class="hidden">1위</span>
                    <div class="rank_header">
                        <img src="${oytuber.image}" alt="프로필사진">
                        <div class="rank_num first">${oytuber.seq}</div>
                    </div>
                    <div class="details">
                        <span>${oytuber.name}</span>
                        <div class="mine_num">
                            <span class="hidden">찜 개수</span>
                            <img src="resources/image/ic_heart-1.svg">
                            <span>${oytuber.good}</span>
                        </div>
                        <div class="hashtag">
                            <span>#${oytuber.job}</span>
                            <span>#운동</span>
                            <span>#20대_인기</span>
                        </div>
                    </div>
                </div>
                <div id="rank_3" class="rank_side">
                    <span class="hidden">3위</span>
                    <div class="rank_header">
                        <img src="${hytuber.image}" alt="프로필사진">
                        <div class="rank_num">${hytuber.seq}</div>
                    </div>
                    <div class="details">
                        <span>${hytuber.name}</span>
                        <div class="mine_num">
                            <span class="hidden">찜 개수</span>
                            <img src="resources/image/ic_heart-1.svg">
                            <span>${hytuber.good}</span>
                        </div>
                        <div class="hashtag">
                            <span>#${hytuber.job}</span>
                            <span>#운동</span>
                            <span>#20대_인기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="list_wrap">
            <h3 class="hidden">인기 TOP4 이하</h3>
            <!-- 반복 QueryString? // click foreach? -->
            <c:forEach var = "ranky" varStatus = "list_vs" begin ="3" items ="${allytuber}">
            <div class="list_item">
                <span>${ranky.seq}</span>
                <div id="rank_${ranky.seq}"><!-- id = rank_(숫자)-->
                    <div class="influencer_profile">
                        <img src="${ranky.image}" alt="프로필사진">
                        <div class="details">
                            <div class="desc">
                                <span>${ranky.name}</span>
                                <div class="mine_num">
                                    <span class="hidden">찜 개수</span>
                                    <img src="resources/image/ic_heart-1.svg">
                                    <span>${ranky.good }</span>
                                </div>
                            </div>
                            <div class="hashtag">
                                <span>#${ranky.job}</span>
                                <span>#태그2</span>
                                <span>#연령_인기</span>
                            </div>
                        </div>
                    </div>
                    <!-- 클릭시 mylist에 추가(수정사항)-->
                    <div class="mine">
                        <a href='#' id="cc">
                            <span class="hidden">찜 하기</span>
                            <img src="resources/image/ic_heart-0.svg">
                        </a>
                    </div>
                    <div class="more">
                        <span><a href="#">더 보기</a></span>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </main>
    <footer>

    </footer>
    <script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/ranking/ranking.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script>
        const swiper = new Swiper('.swiper', {
            slidesPerView: 6,
            // slidesPerView: auto,
            spaceBetween: 40,
            loop: false,
            
            // Navigation arrows
            navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
            },

        });
    </script>
</body>

</html>