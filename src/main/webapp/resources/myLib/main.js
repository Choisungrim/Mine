const checkedItem = $(this).children($('.category_input:checked'));
const imgItem = $(this).children($('.category_label'));
let changeblock = ""
$('.category_label').click(function () {
	$('.category_label > img').attr('src', (a, change) => {
		if (change.match('1') && $('.category_input').is(':checked')) {
			$('.category_label > p').removeClass('active_item');
			return change.replace('1', '0');
		}
	});
	if ($('.category_input').is(':checked')) {
		$(this)
			.children('img')
			.attr('src', (a, change) => {
				if (change.match('0')) {
					$(this).children('p').addClass('active_item');
					$('.now_popularity').html('')
	let value = $(this).children('p').text();
		$.ajax({
			url:"catel",
			type:"get",
			data:{value : value},
			success : result =>{
				console.log(result.result[0].subscribe.substring(0,result.result[0].subscribe.length-4))
				changeblock = `
				<div class="now_left">
					<h1>
						<span id="now_main">
							${value}
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
							<span><a href="rankf">더 보기</a></span>
						</div>
					</div>
				</div>
					<div class="now_right">
						<div class="pop_card active">
							     <img src=${result.result[0].image} alt="인플루언서" />
                                <div class="pop_text">
                                    <h3 id="card">${result.result[0].name}</h3>
                                    <span>구독자
                                      	${result.result[0].subscribe.substring(0,result.result[0].subscribe.length-4)}만명
									</span>
                                    <div class="pop_hashtag">
                                        <span>#${value}</span> <span>#패션</span> <span>#여행</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="now_right">
                            <div class="pop_card active">
                                <img src=${result.result[1].image} alt="인플루언서" />
                                <div class="pop_text">
                                    <h3 id="card">${result.result[1].name}</h3>
                                    <span>구독자
                                      	${result.result[1].subscribe.substring(0,result.result[1].subscribe.length-4)}만명
									</span>
                                    <div class="pop_hashtag">
                                        <span>#${value}</span> <span>#패션</span> <span>#여행</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="now_right">
                            <div class="pop_card active">
                                <img src=${result.result[2].image} alt="인플루언서" />
                                <div class="pop_text">
                                    <h3 id="card">${result.result[2].name}</h3>
                                    <span>구독자
                                      	${result.result[2].subscribe.substring(0,result.result[2].subscribe.length-4)}만명
									</span>
								<div class="pop_hashtag">
									<span>#${value}</span> <span>#패션</span> <span>#여행</span>
								</div>
							</div>
						</div>
					</div>
					`
			},
			dataType: 'json',
			async:false,
		})
			$('.now_popularity').html(changeblock)	
					
					return change.replace('0', '1');
				}
			})
			
	}
			
});