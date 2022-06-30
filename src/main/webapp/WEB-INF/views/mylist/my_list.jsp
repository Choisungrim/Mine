<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>My List</title>
		<link rel="stylesheet" href="resources/myLib/mylist/my_list.css" />
		<link rel="stylesheet" href="resources/myLib/reset.css" />
	</head>
	<body id="main_container" onload="init()">
		<header>header 공간</header>
		<div class="container">
			<h1 id="user">${Login_Name}<!--데이터--><span>님의 찜 목록</span></h1>
			<div class="main">
				<div class="category">
					<form action="mylistf">
						<ul>
							<div class="reset">
								<h1>카테고리</h1>
								<button type="submit">초기화</button>
							</div>
							<li>
								<input type="radio" id="codding" name="myList" />
								<label for="codding">개발</label>
							</li>
							<li>
								<input type="radio" id="game" name="myList" value="coding" />
								<label for="game">게임</label>
							</li>
							<li>
								<input type="radio" id="animal" name="myList" value="coding" />
								<label for="animal">동물</label>
							</li>
							<li>
								<input type="radio" id="food" name="myList" value="coding" />
								<label for="food">먹방</label>
							</li>
							<li>
								<input type="radio" id="beauty" name="myList" value="coding" />
								<label for="beauty">뷰티</label>
							</li>
							<li>
								<input type="radio" id="travel" name="myList" value="coding" />
								<label for="travel">여행</label>
							</li>
							<li>
								<input type="radio" id="cook" name="myList" value="coding" />
								<label for="cook">요리</label>
							</li>
							<li>
								<input type="radio" id="traning" name="myList" value="coding" />
								<label for="traning">운동</label>
							</li>
							<li>
								<input type="radio" id="music" name="myList" value="coding" />
								<label for="music">음악</label>
							</li>
							<li>
								<input type="radio" id="stock" name="myList" value="coding" />
								<label for="stock">주식</label>
							</li>
							<li>
								<input type="radio" id="kids" name="myList" value="coding" />
								<label for="kids">키즈</label>
							</li>
							<li>
								<input type="radio" id="fassion" name="myList" value="coding" />
								<label for="fassion">패션</label>
							</li>
						</ul>
					</form>
				</div>
				<div class="inf_list" id="result">
					<img src="resources/image/logo_default.svg" alt="" />
					<h1>나만의 인플루언서가 고민되나요?</h1>
					<p><span>MINE플루언서</span>에서 찾아보세요!</p>
					<div class="btn_box">
						<a href="home">
							<button class="btn main_btn">메인으로</button>
						</a>
						<a href="rankf">
							<button class="btn rank_btn">랭킹</button>
						</a>
					</div>
				</div>
			</div>
		</div>
		<footer>footer</footer>
		<script src="resources/myLib/jquery-3.2.1.min.js"></script>
		<script src="resources/myLib/mylist/my_list.js"></script>
	</body>
</html>
