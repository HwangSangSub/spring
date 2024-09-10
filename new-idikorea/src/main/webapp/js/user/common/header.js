


document.addEventListener('DOMContentLoaded', function(){
	

    // header의 메뉴버튼(모바일 시) 이벤트
    const btnAllMenu = document.querySelector('.header .btn-allmenu');
    const $popupNav = $('.modal-nav-wrap');
    btnAllMenu.addEventListener('click', function(){
        // console.log('clcik allmenu');
        $popupNav.fadeIn().addClass('active');
        openModalBase();
    })
    // //header의 메뉴버튼(모바일 시) 이벤트


    // header 의 검색

    resetHeaderSearch();
    btnOpenSearch.addEventListener('click', function(){
		setBtnOpenSearch();
    })
    
    header.addEventListener('click', function(e){
        if(e.target.classList.contains('header') && btnOpenSearch.classList.contains('open')) {
            $headerSearchContainer.slideUp().removeClass('active');
            btnOpenSearch.classList.remove('open');
            closeModalBase();
        }
    })
    // //header 의 검색

    

    $(window).on('resize', function(){
        if($headerSearchContainer.hasClass('active')) {
            resetHeaderSearch();
        }
    })
})


const header = document.querySelector('header');
const btnOpenSearch = document.querySelector('.btn-open-search');
const $headerNav = $('.header-nav');
const $headerSearchContainer = $('.header-search-container');

const setBtnOpenSearch = () => {
    if(window.matchMedia("screen and (max-width: 768px)").matches) {
        if(btnOpenSearch.classList.contains('open')) {
			// 열린 상태, 닫을 예정);
            $headerSearchContainer.slideUp().removeClass('active');
            btnOpenSearch.classList.remove('open');
            closeModalBase();
		} else {
			// 닫힌 상태, 열 예정
            $headerSearchContainer.addClass('active').slideDown();
            btnOpenSearch.classList.add('open');
            openModalBase();
		}
    }
    else if(window.matchMedia("screen and (max-width: 1289px)").matches){
        if(btnOpenSearch.classList.contains('open')) {
			// 열린 상태, 닫을 예정);
            $headerSearchContainer.slideUp().removeClass('active');
            btnOpenSearch.classList.remove('open');
		} else {
			// 닫힌 상태, 열 예정
            $headerSearchContainer.addClass('active').slideDown();
            btnOpenSearch.classList.add('open');
		}
    } 
    else {
        if(btnOpenSearch.classList.contains('open')) {
			// 열린 상태, 닫을 예정
			$headerSearchContainer.removeClass('active').slideUp(function(){}, function(){
				$headerNav.slideDown().addClass('active');
				btnOpenSearch.classList.remove('open');
			});
		} else {
            // 닫힌 상태, 열 예정
			$headerNav.removeClass('active').slideUp(function(){}, function(){
				$headerSearchContainer.slideDown().addClass('active');
				btnOpenSearch.classList.add('open');
			});
		}
    }
}


const resetHeaderSearch = () => {
    $headerSearchContainer.hide().removeClass('active');
    $headerNav.show().addClass('active');
    btnOpenSearch.classList.remove('open');
}