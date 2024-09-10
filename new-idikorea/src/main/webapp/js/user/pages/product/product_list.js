
document.addEventListener('DOMContentLoaded', function(){


    // 상단 카테고리
    const btnCate = document.querySelectorAll('.btn.product-cate');
    const bdProduct = document.querySelectorAll('.product-board');

    btnCate.forEach( btn => {
        if(btn.dataset['cate'] == 'total') {
            btn.classList.add('active');
            bdProduct.forEach( bd => { bd.classList.add('active') })
        }
        btn.addEventListener('click', function(){
            btnCate.forEach( b => b.classList.remove('active'))
            btn.classList.add('active');

            if(btn.dataset['cate'] == 'total') {
                bdProduct.forEach( bd => { bd.classList.add('active') })
            }
            else {
                bdProduct.forEach( bd => {
                    bd.dataset['cate'] == btn.dataset['cate'] ? bd.classList.add('active') : bd.classList.remove('active');
                })
            }
        })
    })
    // 상단 카테고리 


    // 게시판 순서
    const btnBdOrder = document.querySelectorAll('.bdProduct-controller-order');

    btnBdOrder.forEach( btn => {
        btn.addEventListener('click', function(){
            btnBdOrder.forEach( b => b.classList.remove('active'))
            btn.classList.add('active');
        })
    })
    // //게시판 순서


})
document.addEventListener('click', event => {
    if (event.target.closest('button') && event.target.closest('button').classList.contains('btn-prod-heart')) {
        event.preventDefault()
        let sno = event.target.closest('.bdProduct-link').querySelector('[name="sno"]').value;
        cartSave(JSON.stringify	({
			sno : sno,
			ea : 1,
			cartType : 'N'
		}));
    }else if (event.target.closest('button') && event.target.closest('button').classList.contains('btn-prod-cart')) {
        event.preventDefault() 
        let sno = event.target.closest('.bdProduct-link').querySelector('[name="sno"]').value;
        cartSave(JSON.stringify	({
			sno : sno,
			ea : 1,
			cartType : 'Y'
		}));
		
		         
    } 
});


function cartSave(obj){
	fetch('/api/v1/user/cart',{
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},	
		body : obj
	}).then(resp=>{
		if(resp.status==500)
			return alert("알수없는 오류가 발생했습니다. 관리자에게 문의하세요.");
		return resp.json();	
	})
	.then(data=>{
		if(data.code!=null){
			alert(data.message);
		}else{
			if(confirm( (obj.cartType=="Y"? '장바구니':'관심상품') +'에 상품이 추가되었습니다.' + (obj.cartType=="Y"? '장바구니':'관심상품으')+'로 이동하시겠습니까?')){
				alert("이동!")
			}
		}
	})
}


const cateSwiper = new Swiper('.product-cate-swiper', {
    slidesPerView: 2,
    slidesPerGroup: 2,
    navigation: {
        prevEl: ".product-cate-swiper-btn.prev",
        nextEl: ".product-cate-swiper-btn.next",
    },
    breakpoints : {
        449 : {
            slidesPerView: 3,
            slidesPerGroup: 3
        },
        509 : {
            slidesPerView: 4,
            slidesPerGroup: 4,
        },
        768 : {
            slidesPerView: 5,
            slidesPerGroup: 5
        },
        1024 : {
            slidesPerView: 7,
            slidesPerGroup: 7
        },
    }
})
