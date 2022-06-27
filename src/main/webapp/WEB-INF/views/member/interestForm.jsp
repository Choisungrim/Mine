<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심사 선택</title>
<link rel="stylesheet" href="resources/myLib/reset.css" />
<link rel="stylesheet" href="resources/myLib/join/check.css" />
</head>
<body>
	<div class="REGI_00201_">
		<div class="container">
			<h1>
				<img src="resources/image/logo.svg" alt="로고" class="logo" />
			</h1>
			<div class="categories_wrap">
				<div class="categories_header">
					<span class="head">관심있는 주제를 선택해보세요</span> <span class="headcontent">
						관심사에 맞는 콘텐츠를 추천해드립니다. <span class="text-style-1">3개까지 선택</span>해주세요.
					</span>
				</div>
				<form action ="home">
					<div class="items_container">
						<div class="items_row">
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check1" value="운동" onClick="count(this)"><label
									for="check1">
									<div class="Vector">
											<span class=img></span>
										<span class="txt">운동</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check2" value="여행" onClick="count(this)"><label
									for="check2">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">여행</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check3" value="뷰티" onClick="count(this)"><label
									for="check3">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">뷰티</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check4" value="패션" onClick="count(this)"><label
									for="check4">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">패션</span>
									</div>
								</label>
							</div>
						</div>
						<div class="items_row">
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check5" value="먹방" onClick="count(this)"><label
									for="check5">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">먹방</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check6" value="요리" onClick="count(this)"><label
									for="check6">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">요리</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check7" value="게임" onClick="count(this)"><label
									for="check7">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">게임</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check8" value="음악" onClick="count(this)"><label
									for="check8">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">음악</span>
									</div>
								</label>
							</div>
						</div>
						<div class="items_row">
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check9" value="개발" onClick="count(this)"><label
									for="check9">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">개발</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check10" value="동물" onClick="count(this)"><label
									for="check10">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">동물</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check11" value="주식" onClick="count(this)"><label
									for="check11">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">주식</span>
									</div>
								</label>
							</div>
							<div class="item_wrap">
								<input type="checkbox" name="check" id="check12" value = "키즈" onClick="count(this)"><label
									for="check12">
									<div class="Vector">
										<span class=img></span>
										<span class="txt">키즈</span>
									</div>
								</label>
							</div>
						</div>
					</div>
					
					<div class="buttons_wrap">
						<button class="pass" type="submit">
							<span class="btntext">건너뛰기</span>
						</button>
						<button class="save" type ="submit">
							<span class="btntext2">관심사 선택 완료</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script>
	$('.save').click(function(){
        var chk_data = [];
        $("input[name=check]:checked").each(function(i) {
        	chk_data.push($(this).val());
        });
        console.log(chk_data);
         $.ajax({
        	url: 'interest',
        	type: 'post',
        	dataType: 'text',
        	data: {
        		valueArrTest: chk_data
        	}
        });
	});
	
	var maxChecked = 3;   //선택가능한 체크박스 갯수
	var totalChecked = 0; // 설정 끝

	function count(field) {
	    if (field.checked) // input check 박스가 체크되면 
	        totalChecked += 1; // totalChecked 증가
	    else // 체크가 아니면
	        totalChecked -= 1; // totalChecked 감소

	    if (totalChecked > maxChecked) { // totalchecked 수가 maxchecked수보다 크다면
	        alert ("최대 3개 까지만 가능합니다."); // 팝업창 띄움
	    field.checked = false;
	    totalChecked -= 1;
	    }
	    
	}
	</script>
</body>
</html>