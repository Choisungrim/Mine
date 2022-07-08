$( document ).ajaxStart(function() {
    //마우스 커서를 로딩 중 커서로 변경
			//로딩이미지 
    $('html').css("cursor", "wait"); 
});
//AJAX 통신 종료
$( document ).ajaxStop(function() {
    //마우스 커서를 원래대로 돌린다
    $('html').css("cursor", "auto"); 
			//로딩이미지 none 처리  
});

const result = document.getElementById('result');
var card ="";
const value = document.querySelectorAll('ul>li>label')
value.forEach(el=>{
	el.onclick=(e)=>{
		let val = e.path[0].innerText;
		$.ajax({
			url:"interlist",
			type:"get",
			async : "true",
			cache :"false",
			datatype:"json",
			contenttype:"json",
			data:{val : val},
			success:(list)=>{
				result.innerHTML = '';
				console.log(list)
				if(list.list.length>=1){
					for(let i = 0; i<list.list.length; i++){
					var card = `<div class="card">
					<div class="card_left">
					    <img src="${list.list[i].image}" alt="유튜버 이미지" />
					    <div class="about_youtuber">
					        <h1>${list.list[i].name}</h1>
					        <!--이름-->
					        <h3>구독자 ${list.list[i].subscribe.substring(0,list.list[i].subscribe.length-4)} 만명 </h3>

					        <!-- 구독자 -->
					        <span id="interest">#${list.list[i].job}</span>
					        <!-- 관심사 -->
					    </div>
					</div>
					<div class="card_right">
					    <img src="resources/image/ic_heart-1.svg" alt="좋아요" />
					    <a href="#">더 보기</a>
					</div>
					</div>`;
					result.innerHTML += card;
					} 
				} else{
					var card = `
					<div class="inf_list" id="result">
					<img src="resources/image/logo_default.svg" alt="" />
					<h1>나만의 인플루언서가 고민되나요?</h1>
					<p><span>MINE플루언서</span>에서 찾아보세요!</p>
					<div class="btn_box">
						<a href="home">
							<button class="btn main_btn">메인으로</button>
						</a>
						<a href="#">
							<button class="btn rank_btn">랭킹</button>
						</a>
					</div>
				</div>`;
				result.innerHTML = card;
				}
			}
		})
	}
})

function init(){
	$.ajax({
	url : "alllist",
	type : "get",
	success : (list)=>{
		if(list.list<1)
			console.log(11)
		else{
		result.innerHTML = '';
		for(let i = 0; i<list.list.length; i++){
		var card = `
		<div class="card">
			<div class="card_left">
			    <img src="${list.list[i].image}" alt="유튜버 이미지" />
			    <div class="about_youtuber">
			        <h1>${list.list[i].name}</h1>
			        <!--이름-->
			        <h3>구독자 ${list.list[i].subscribe.substring(0,list.list[i].subscribe.length-4)} 만명 </h3>
			        <!-- 구독자 -->
			        <span id="interest">#${list.list[i].job}</span>
			        <!-- 관심사 -->
			    </div>
			</div>
			<div class="card_right">
			    <img src="resources/image/ic_heart-1.svg" alt="좋아요" />
			    <a href="#">더 보기</a>
			</div>
		</div>`;
		result.innerHTML += card;
		}		
		}
	}
})
	
}


	
