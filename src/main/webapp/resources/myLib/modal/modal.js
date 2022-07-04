$('#close').click(function () {
	$('.modal_container').css({
		display: 'none',
	});
});

$('#cancel').click(function () {
	$('.modal_container').css({
		display: 'none',
	});
});

// 회색 배경 클릭 시 모달 닫힘
$('.modal_container').click(function (e) {
	if (e.target.id === 'modal') {
		$('.modal_container').css({
			display: 'none',
		});
	}
});
