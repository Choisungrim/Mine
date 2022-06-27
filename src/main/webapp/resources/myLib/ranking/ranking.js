
// rank 페이지 이동 시 찜한 influencer 표시
$(document).ready(function(){
let heart = $('.mine>a>img').attr('src',(index,heart)=>{})
	$.ajax({
		url : "rankall",
		type : "get",
		success:(mylist)=>{
			let a = mylist.mylist;
			for(let i =0; i<mylist.mylist.length;i++){
			let mylistname = a[i].name;
				let text1=$('.desc > span').text(el=>{})
				for(let j =0;j<text1.length;j++){
					let name = text1[j].innerText
					if(mylistname == name){
						heart[j].src = "resources/image/ic_heart-1.svg"; 
					}
				}
			}
		},
	})
});

// 전체 or 카테고리 선택 시 서브메뉴 on off (애니메이션 미구현)
var flag = false;
$('#all').click(function () {
    $('#category_one').removeClass('on');
    $('#all').addClass('on');
	$('.list_wrap').html('')
	$.ajax({
			url:"rankf",
			type:"get",
			success:(allytuber)=>{
			$('body').html(allytuber)
			}
		})
    if (flag == true) {
        $('.category_wrap').css('display', 'none');
        return flag = false;
    }
	
});
$('#category_one').click(function () {
    $('#all').removeClass('on');
    $('#category_one').addClass('on');
    if (flag == false) {
        $('.category_wrap').css('display', 'flex');
        return flag = true;
    }
});

// 12가지 카테고리 중 1가지 선택
$('.category_scroll>ul>li').click(function () {
    let category1 = $(this).attr('id');
    if ($('#' + category1).hasClass('on')) { // 이미 선택된 카테고리 클릭
		
    } else {    // 다른 카테고리 클릭
        $('#' + category1).addClass('on');
        $('.btn20px').not('#' + category1).removeClass('on');
    }
	let value = $(".category_scroll>ul>li.on>span").text();
	$('.list_wrap').html('')
	$('#top3').html('')
	// 선택시 해당하는 인플루언서 출력
		$.ajax({
			url:"category",
			type:"get",
			data:{value : value},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : (category) =>{
				console.log(category)
					let b = `
                <div id="rank_2" class="rank_side">
                    <span class="hidden">2위</span>
                    <div class="rank_header">
                        <img src="${category.category[1].image}" alt="프로필사진">
                        <div class="rank_num">${category.category[1].seq}</div>
                    </div>
                    <div class="details">
                        <span>${category.category[1].name}</span>
                        <div class="mine_num">
                            <span class="hidden">찜 개수</span>
                            <img src="resources/image/ic_heart-1.svg"> 
                            <span>${category.category[1].good}</span>
                        </div>
                        <div class="hashtag">
                            <span>#${category.category[1].job}</span>
                            <span>#운동</span>
                            <span>#20대_인기</span>
                        </div>
                    </div>
                </div>
                <div id="rank_1" class="rank_main">
                    <span class="hidden">1위</span>
                    <div class="rank_header">
                        <img src="${category.category[0].image}" alt="프로필사진">
                        <div class="rank_num first">${category.category[0].seq}</div>
                    </div>
                    <div class="details">
                        <span>${category.category[0].name}</span>
                        <div class="mine_num">
                            <span class="hidden">찜 개수</span>
                            <img src="resources/image/ic_heart-1.svg">
                            <span>${category.category[0].good}</span>
                        </div>
                        <div class="hashtag">
                            <span>#${category.category[0].job}</span>
                            <span>#운동</span>
                            <span>#20대_인기</span>
                        </div>
                    </div>
                </div>
                <div id="rank_3" class="rank_side">
                    <span class="hidden">3위</span>
                    <div class="rank_header">
                        <img src="${category.category[2].image}" alt="프로필사진">
                        <div class="rank_num">${category.category[2].seq}</div>
                    </div>
                    <div class="details">
                        <span>${category.category[2].name}</span>
                        <div class="mine_num">
                            <span class="hidden">찜 개수</span>
                            <img src="resources/image/ic_heart-1.svg">
                            <span>${category.category[2].good}</span>
                        </div>
                        <div class="hashtag">
                            <span>#${category.category[2].job}</span>
                            <span>#운동</span>
                            <span>#20대_인기</span>
                        </div>
                    </div>
                </div>
            </div>
				`;
				$('#top3').html($('#top3').html()+b);
				
			for(let i =3; i<category.category.length;i++){
				let a =`
				<div class="list_item">
                <span>${category.category[i].seq}</span>
                <div id="rank_${category.category[i].seq}"><!-- id = rank_(숫자)-->
                    <div class="influencer_profile">
                        <img src="${category.category[i].image}" alt="프로필사진">
                        <div class="details">
                            <div class="desc">
                                <span>${category.category[i].name}</span>
                                <div class="mine_num">
                                    <span class="hidden">찜 개수</span>
                                    <img src="resources/image/ic_heart-1.svg">
                                    <span>${category.category[i].good }</span>
                                </div>
                            </div>
                            <div class="hashtag">
                                <span>${category.category[i].job}</span>
                                <span>#태그2</span>
                                <span>#연령_인기</span>
                            </div>
                        </div>
                    </div>
                    <!-- 클릭시 mylist에 추가-->
                    <div class="mine">
                        <a href="#">
                            <span class="hidden">찜 하기</span>
                            <img src="resources/image/ic_heart-0.svg">
                        </a>
                    </div>
                    <div class="more">
                        <span><a href="#">더 보기</a></span>
                    </div>
                </div>
			</div>
			`
			$('.list_wrap').html($('.list_wrap').html()+a)
			}
			
			//카테고리를 새롭게 부르기때문에 재할당.
			let heart = $('.mine>a>img').attr('src',(index,heart)=>{})
			let a = category.mylist;
			for(let i =0; i<category.mylist.length;i++){
			let mylistname = a[i].name;
				let text1=$('.desc > span').text(el=>{})
				for(let j =0;j<text1.length;j++){
					let name = text1[j].innerText
					if(mylistname == name){
						heart[j].src = "resources/image/ic_heart-1.svg"; 
					}
				}
			}
			click();
			}
		})
		
});

// $().html 에 생기는 요소
function click(){
const count = document.querySelectorAll('.mine > a > img');

count.forEach(el=>{
	el.onclick=(e)=>{
	e.preventDefault();
		let nodes = [...e.target.parentElement.children];
	    let index = nodes.indexOf(e.target);
		let insertobj = e.path[3].children[0].innerText.split('\n')
		let obj = nodes[1].getAttribute('src')
		if(obj == "resources/image/ic_heart-0.svg"){
			$.ajax({
				url:'myinsert',
				type:'post',
				data:{insertobj : insertobj[0]},
				success :(success)=>{
					alert('찜하기가 되었습니다.');		
				}
			})			
			return nodes[1].setAttribute('src',"resources/image/ic_heart-1.svg")
		}
		else{
			$.ajax({
				url:'delete',
				type:'post',
				data:{insertobj : insertobj[0]},
				success :(success)=>{
					alert('찜하기가 되었습니다.');		
				}
			})		
			alert('찜하기를 취소하였습니다.')
			return nodes[1].setAttribute('src',"resources/image/ic_heart-0.svg")
		}
		
	}
})
}

// 전체페이지에 적용되는 요소.
const count = document.querySelectorAll('.mine > a > img');

count.forEach(el=>{
	el.onclick=(e)=>{
	e.preventDefault();
		let nodes = [...e.target.parentElement.children];
	    let index = nodes.indexOf(e.target);
		let insertobj = e.path[3].children[0].innerText.split('\n')
		console.log(insertobj[0])
		let obj = nodes[1].getAttribute('src')
		if(obj == "resources/image/ic_heart-0.svg"){
			$.ajax({
				url:'myinsert',
				type:'post',
				data:{insertobj : insertobj[0]},
				success :(success)=>{
					alert('찜하기가 되었습니다.');		
				}
			})			
			return nodes[1].setAttribute('src',"resources/image/ic_heart-1.svg")
		}
		else{
			$.ajax({
				url:'mydelete',
				type:'post',
				data:{insertobj : insertobj[0]},
				success :(success)=>{
					alert('찜하기를 취소하였습니다.')		
				}
			})		
			
			return nodes[1].setAttribute('src',"resources/image/ic_heart-0.svg")
		}
		
	}
})




// 윤화씨 코드
//$('.mine').click(() => {
//    $('.mine>a>img').attr('src', function (index, heart) {
//        if (heart.match('0')) { // 빈 하트일 때
//            return heart.replace('0', '1');    // 꽉찬 하트로 변경 (mylist 담기)
//        } else {
//            return heart.replace('1', '0');    // 빈 하트로 변경
//        }
//    });
//});