


document.addEventListener('DOMContentLoaded', function(){


    // 팝업 공통
    const btnsModalClose = document.querySelectorAll('.modal-wrap .btn-close');
    btnsModalClose.forEach( btnClose => {
        btnClose.addEventListener('click', function(e){
            const $parentWrap = $(this).parents('.modal-wrap');
            $parentWrap.removeClass('active').fadeOut().addClass('close');
            closeModalBase();
        })
    })
    
    const modalWraps = document.querySelectorAll('.modal-wrap');
    modalWraps.forEach( wrap => {
        wrap.addEventListener('click', function(e){
            const parents = parentAll(e.target);
            const targetParent = parents.filter( el => el === wrap.querySelector('.modal'));

            if(targetParent.length <= 0) {
                $(wrap).removeClass('active').fadeOut().addClass('close');
                closeModalBase();
            }
        })
    })
    // //팝업 공통

    // 버튼, 우편번호
    const btnSearchPostal = document.querySelectorAll('.btn-search-postal');
    // const arrBtnSearchPostal = [...btnSearchPostal];
    btnSearchPostal.forEach( ( btn ) => {
        btn.addEventListener('click', function(){
            const btnParents = parentAll(btn);
            const btnParent = btnParents.filter( (el) => el.classList.contains('bdNormal-li'));
            openModalPost( btnParent );
            openModalBase();
        })
    })
    // //버튼, 우편번호


    // 버튼, 게시판 리스트 메뉴 공통
    
    const btnMenus = document.querySelectorAll('.btn-sub-menus');
    btnMenus.forEach( btn => {
        btn.addEventListener('click', function(){
            $(btn.nextElementSibling).removeClass('close').fadeIn().addClass('active');
        })
    })
    
    // //버튼, 게시판 리스트 메뉴 공통


})


// 공통 모달 열 시 
function openModalBase() {
	$('html').addClass('seal');
	$('body').addClass('seal');
	// pauseAllYoutube();
}
// //공통 모달 열 시 

// 공통 모달 닫을 시 
function closeModalBase() {
	$('html').removeClass('seal');
	$('body').removeClass('seal');
	// pauseAllYoutube();
}
// //공통 모달 닫을 시 




// 우편번호

const modalPostWrap = document.querySelector('.modal-post-wrap');
const $modalPostWrap = $('.modal-post-wrap');
const modalPost = document.querySelector('.modal-post .modal-main');
const $modalPost = $('.modal-post .modal-main');


const themeModalPost = {
    bgColor: '#DADADA',
    pageBgColor: '#FFFFFF',
    postcodeTextColor: '#000000',
    emphTextColor: '#000000',
    outlineColor: '#DADADA'
}

const openModalPost = ( btnParent ) => {

    const currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            console.log(`user data : ${data.roadAddress}`);
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample3_extraAddress").value = extraAddr;
            
            } else {
                // document.getElementById("sample3_extraAddress").value = '';
                extraAddr = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            // console.log(btnParent[0].querySelector('.postal-num input'));
            btnParent[0].querySelector('.postal-num input').value = data.zonecode;
            btnParent[0].querySelector('.address input').value = addr + extraAddr;
            // document.getElementById("sample3_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            btnParent[0].querySelector('.address-detail input').focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            // element_wrap.style.display = 'none';
            foldModalPost();

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
            $modalPostWrap.removeClass('active').fadeOut();
            closeModalBase();
        },
        onclose: function(state) {
            if(state == 'COMPLETE_CLOSE') {
                closeModalBase();
                
            }
        },
        onresize : function(size) {
            modalPost.style.height = (size.height + 40)+'px';
        },
        height: '100%',
        useBannerLink : false,
        theme: themeModalPost
    }).embed( modalPost );

    // modalPostWrap.style.display = 'block';
    $modalPostWrap.removeClass('close').fadeIn().addClass('active');
    
}

const foldModalPost = () => {
    // modalPostWrap.style.display = 'none';
    $modalPostWrap.removeClass('active').fadeOut().addClass('close');
}

// 우편번호
