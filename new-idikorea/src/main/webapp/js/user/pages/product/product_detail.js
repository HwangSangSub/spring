
document.addEventListener('DOMContentLoaded', function(){

    // 버튼 .btn
    const btnBuy = document.querySelector('.btn-buy');
    /* 
    btnBuy.addEventListener('click', function(){
       if(isLogin) {
            window.location = ("/user/basket/order");
        }
        else {
            const isMember = confirm(`
                로그인 후 구매하시겠습니까?
                취소를 누르시면 비회원으로 상품구매가 진행됩니다.
            `);
           //window.location = (isMember ? "/user/login" : "/user/basket/order");
        }
    }
/*    if(btnBuy) {
        btnBuy.addEventListener('click', function(){
            if(isLogin) {
                window.location = ("/user/basket/order");
            }
            else {
                const isMember = confirm(`
                    로그인 후 구매하시겠습니까?
                    취소를 누르시면 비회원으로 상품구매가 진행됩니다.
                `);
                window.location = (isMember ? "/user/login" : "/user/basket/order");
            }
        })
    }
    const btnBuyR = document.querySelector('.btn-buy-regular');
    if(btnBuyR) {
        btnBuyR.addEventListener('click', function(){
            if(isLogin) {
                window.location = ("/user/basket/order");
            }
            else {
                const isMember = confirm(`
                    정기 구매는 로그인 후 이용가능한 서비스입니다.
                    로그인 페이지로 이동하시겠습니까?
                `);
                if(isMember) {
                    window.location = "/user/login";
                    
                }
            }
        })
    }*/


    const btnLike = document.querySelector('.btn-like');
    btnLike.addEventListener('click', function(){
        if(isLogin) {
            if(this.classList.contains('active')) {
                this.classList.remove('active');
                this.querySelector('.la').classList.add('la-heart-o');
                this.querySelector('.la').classList.remove('la-heart');
            }
            else {
                this.classList.add('active');
                this.querySelector('.la').classList.add('la-heart');
                this.querySelector('.la').classList.remove('la-heart-o');
            }
        }
        else {
            alert(`
                로그인이 필요합니다.
                로그인 페이지로 이동합니다.
            `);
            window.location = ("/user/login");
        }
    })


    const btnCopyUrl = document.querySelector('.btn-copy-url');
    btnCopyUrl.addEventListener("click", function(){
        const currentUrl = window.location.href;
        window.navigator.clipboard.writeText(currentUrl).then((res)=> {
            alert('복사되었습니다.');
        })
        .catch(() => {
            console.log("sorry, can't copy");
        })
    })


    
    // //버튼 .btn

    // 탭
    clickClassActive( liTabs );
    liTabs.forEach( ( li, index ) => {
        li.addEventListener('click', function(){
            // liTabs.forEach( ( liT ) => { liT.classList.remove('active'); });
            // this.classList.add('active');

            liTabviews.forEach( ( liV, idx ) => { 
                liV.classList.remove('active');
                
                if(idx == index) {
                    liV.classList.add('active');
                    
                    // 1 : 관련상품
                    idx == 1 ? swiperRelated.update() : void(0);
                    // 2 : 배송안내
                    // 3 : 교환 및 반품안내
                    // 4 : 상품후기
                    // 5 : 상품문의
                    idx != 1 ? liV.querySelector('.detail-tabview-bd-wrap').classList.add('active') : void(0);
                    
                    // 탭 움직임
                    const parentDiv = document.querySelector('.detail-tabs-list');
                    const parents = parentAll(li, parentDiv);
                    
                    if(index != 0 || index != liTabs.length - 1) {
                        $(parents[parents.length - 1].parentElement).animate({
                            scrollLeft: li.clientWidth * (index) - li.clientWidth * 0.5
                        });
                    }
                    else if(index == 0){
                        $(parents[parents.length - 1].parentElement).animate({
                            scrollLeft: 0
                        });
                    }
                    else if(index == liTabs.length - 1){
                        $(parents[parents.length - 1].parentElement).animate({
                            scrollLeft: li.clientWidth * (index)
                        });
                    }
                    scrollToEl(liV);

                    openBd(liV, 'list');
                    // //탭 움직임
                }
                
            });
            
        })
        // touchTabMoveCenter(li);
    })
    // //탭

    // 수량
    makeSumController(btnsSumControl, products, false);
    // //수량

    
})

// 선택자
const liTabs = document.querySelectorAll('.detail-tabs-li');
const liTabviews = document.querySelectorAll('.detail-tabviews-li');

const products = document.querySelectorAll('.detail-view-info-main'); // 상품 갯수
const btnsSumControl = document.querySelectorAll('.btn-sum-control'); // 수량 조절
// //선택자


// 관련상품
const swiperRelated = new Swiper('.detail-tabview-related-swiper', {
    slidesPerView: 2,
    slidesPerGroup: 2,
    spaceBetween: 30,
    navigation: {
        prevEl: ".detail-tabview-related-swiper-btn.prev",
        nextEl: ".detail-tabview-related-swiper-btn.next",
    },
    breakpoints : {
        509 : {
        },
        768 : {
            slidesPerView: 3,
            slidesPerGroup: 3,
            spaceBetween: 60,
        },
        1024 : {
            slidesPerView: 4,
            slidesPerGroup: 4,
            spaceBetween: 90,
        },
    },
})
// //관련상품


// select 변경시 반응
document.addEventListener("change" , event =>{
	if(event.target.id == 'selectOpt1'){
		let selectOpt1=event.target.querySelector('select option:checked').getAttribute('data-opt')
		
		if(document.querySelector('#selectOpt2').querySelectorAll('option[data-parent-opt="'+selectOpt1+'"]').length>0 ){
			document.querySelector('#opt2Li').style="display:block";
			document.querySelector('#selectOpt2').querySelectorAll('option').forEach( (optionTag ,index)=>{
				if(optionTag.getAttribute('data-parent-opt')==selectOpt1 || index == 0){
					optionTag.style="display:block";
				}else{
					optionTag.style="display:none";
				}
			})
		}else{
			document.querySelector('#opt2Li').style="display:none";
		}
	}
})
console.log()
document.addEventListener("click" , event =>{
	console.log(event.target.closest('button'))

	if(event.target.closest('button')!=null && event.target.closest('button').id == 'orderBtn'){

		
		
		if(document.querySelector('#selectOpt1')!=null && document.getElementById('selectOpt1').value== document.querySelector('#selectOpt1').querySelectorAll('option')[0].value){
			return alert("옵션을 선택해주세요");
		}
		if(document.querySelector('#selectOpt2')!=null && document.querySelector('#selectOpt2').closest('li').style.display!='none' && document.getElementById('selectOpt2').value== document.querySelector('#selectOpt2').querySelectorAll('option')[0].value){
			return alert("옵션을 선택해주세요");
		}
		console.log(isLogin);
		console.log(isLogin);
		console.log(memberNo);
		if(`${isLogin}`=='false' && !confirm("로그인 상태가 아닙니다 비회원 주문 하시겠습닙까?")){
			return location.href ='/user/login';
		}
		document.getElementById('orderData').value= JSON.stringify([getObj()]);
		document.getElementById('orderForm').submit();
		/*fetch('/api/v1/user/order',{
			method :"POST",
			headers :{
				'Content-Type' :'application/json',				
			},
			body : JSON.stringify([obj])
		})*/
	}else if(event.target.closest('button')!=null && event.target.closest('button').id=='saveCart'){
			
		saveCart("Y");
		
	}else if(event.target.closest('button')!=null && event.target.closest('button').id=='saveHeart'){
			
		saveCart("N");
		
	}
})

function saveCart(cartType){
	fetch('/api/v1/user/cart',{
			method : 'POST',
			headers : {
				'Content-Type' : 'application/json'
			},	
			body : JSON.stringify	(getObj(cartType))
		}).then(resp=>{
			if(resp.status==500)
				return alert("알수없는 오류가 발생했습니다. 관리자에게 문의하세요.");
			return resp.json();	
		})
		.then(data=>{
			if(data.code!=null){
				alert(data.message);
			}else{
				
				if(confirm( (cartType=="Y"? "장바구니" : "관심상품") +'에 상품이 추가되었습니다.'+ (cartType=="Y"? '장바구니':'관심상품으')+'로 이동하시겠습니까?')){
					alert("이동!")
				}
			}
		})
}

function getObj(cartType){
	return {
				'sno' : ( document.querySelector('#selectOpt2') == null || document.querySelector('#selectOpt2').closest('li').style.display=='none' )? document.querySelector('#selectOpt1') == null ?  document.getElementById('sno').value :  document.querySelector('#selectOpt1').value : document.querySelector('#selectOpt2').value ,
				'ea' : document.querySelector('#ea').value,
				'cartType' : cartType
			};
}