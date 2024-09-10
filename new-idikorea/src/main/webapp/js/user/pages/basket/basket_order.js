document.addEventListener('DOMContentLoaded', function(){
    const arrPaymentMethods = [...paymentMethods];
    arrPaymentMethods.filter( methods => methods.classList.contains('idi-pay') && methods.checked ? setBasketPaySwiper() : void(0) );
    

    const btnSearchPostal = document.querySelectorAll('.btn-search-postal');
    // const arrBtnSearchPostal = [...btnSearchPostal];
    btnSearchPostal.forEach( ( btn ) => {
        btn.addEventListener('click', function(){
            const btnParents = parentAll(btn);
            const btnParent = btnParents.filter( (el) => el.classList.contains('bdNormal-li'));
            openModalPost( btnParent );
        })
    })


    // 결제방식에 따라 idi페이 보임/안보임에 따른 swiper 생성/파괴
    paymentMethods.forEach( (method) => {
        method.addEventListener('input', function(e) {
            checkIDIPay(e.target);
        })
    })
    // //결제방식에 따라 idi페이 보임/안보임에 따른 swiper 생성/파괴



    // 배송지목록
    const btnOpenAddress = document.querySelectorAll('.btn-open-address');
    const $modalAddressWrap = $('.modal-address-wrap')
    btnOpenAddress.forEach( ( btn ) => {
        btn.addEventListener('click', function(){
            $modalAddressWrap.fadeIn().addClass('active');
            openModalBase();
        })
    })

    const btnAddress = document.querySelectorAll('.bdModalAdd-li.btn');
    btnAddress.forEach( ( btn ) => {
        btn.addEventListener('click', function(){
            const targetAddress = this.querySelectorAll('.bdModalAdd-rowli');
            let matchesAdd = "";
            filterDeliveryInfos.forEach( (deliInfo, deliIdx) => {
                targetAddress.forEach( ( addInfo ) => {
                    switch (deliIdx) {
                        case 0 : 
                            matchesAdd = ".col-name";
                            break;
                        case 1 :
                            matchesAdd = ".col-post";
                            break;
                        case 2 :
                            matchesAdd = ".col-address";
                            break;
                        case 3 :
                            break;
                        case 4 :
                            matchesAdd = ".col-tel";
                            break;
                        case 5 :
                            matchesAdd = ".col-phone";
                            break;
                    }
                    matchesAdd != "" && addInfo.matches(matchesAdd) ? deliInfo.value = addInfo.innerText : void(0);
                    matchesAdd = "";
                })
            })
            
            $modalAddressWrap.removeClass('active').fadeOut();
            closeModalBase();
        })
    })
    // 배송지목록


    // 주문자와 동일

    checkboxOrderer.addEventListener('input', function(){
        matchInfoOrderer( this.querySelector('input') );
    });

    filterDeliveryInfos.forEach( (info) => {
        info.addEventListener('input', function(){
            matchInfoTyping();
        })
    })
    // filterOrdererInfos.addEventListener('input', function(){
    //     matchInfoTyping();
    // })
    
    // //주문자와 동일



    // 쿠폰

    const coupons = document.querySelectorAll('.basket-payment-coupon .basket-orderer-selects select');
    const doubles = document.querySelectorAll('.basket-payment-double .basket-orderer-selects select');
    const lastCoupon = document.querySelector('.basket-result-ticket-li.coupon .basket-result-cate-price input');
    coupons.forEach( ( select ) => {
        select.addEventListener('change', function(){
            // priceCoupon = this.value;
            priceCoupon = Number(priceProduct) * this.value / 100;
            lastCoupon.value = Number(priceCoupon) + Number(priceDouble);
            lastCoupon.value = setNumComma3(lastCoupon.value);
            setTotalPrice();
        })
    })
    doubles.forEach( ( select ) => {
        select.addEventListener('change', function(){
            // priceDouble = this.value;
            priceDouble = Number(priceProduct) * this.value / 100;
            lastCoupon.value = Number(priceCoupon) + Number(priceDouble);
            lastCoupon.value = setNumComma3(lastCoupon.value);
            setTotalPrice();
        })
    })
    
    // //쿠폰




    // 적립금

    const hasFund = document.querySelector('.basket-result-ticket-li.fund .basket-result-cate-price .has input');
    const useFund = document.querySelector('.basket-result-ticket-li.fund .basket-result-cate-price .use input');
    useFund.addEventListener('input', function(){
        console.log(this.value);
        if( Number(this.value) > Number(hasFund.value.replace(',', '')) ) {
            this.value = hasFund.value;
        }
        priceSaved = this.value;
        setTotalPrice();
    })    
    
    // //적립금

    
    
})


// idi페이 event
let basketPaySwiper;
const paymentMethods = document.querySelectorAll('[name="payment-method"]');
const setBasketPaySwiper = () => {
    basketPaySwiper = setSwiper('.basket-payment-method-swiper', paramBasketPaySwiper);
}

const paramBasketPaySwiper = {
    slidesPerView: 1,
    navigation: {
        prevEl: ".basket-payment-method-btn.prev",
        nextEl: ".basket-payment-method-btn.next"
    }
};

const checkIDIPay = ( method ) => {
    if(method.classList.contains('idi-pay') && method.checked) {
        setBasketPaySwiper();
    } else {
        destroySwiper(basketPaySwiper);
    }
}
// //idi페이 event



// 배송지 주문자와 동일 event
const checkboxOrderer = document.querySelector('.basket-shipping-wrap .checkbox');
const ordererInfos = document.querySelectorAll('.sect-orderer input:not([type="checkbox"])');
const deliveryInfos = document.querySelectorAll('.sect-shipping input:not([type="checkbox"])');
const filterOrdererInfos = [...ordererInfos].filter( (el) => $(el).parents('.basket-orderer-email').length <= 0 );
const filterDeliveryInfos = [...deliveryInfos].filter( (el) => $(el).parents('.basket-orderer-memo').length <= 0 );

const matchInfoOrderer = ( checkbox ) => {
let checkOrdererInfos = [...ordererInfos].filter( (el) => el.value );

    
    if(!checkbox.checked) {
        filterDeliveryInfos.forEach( (deliInfo) => {
            deliInfo.value = "";
        })
    }
    else {
        if( checkOrdererInfos.length > 0) {
            filterDeliveryInfos.forEach( (deliInfo, deliIdx) => {
                filterOrdererInfos.forEach( (orderInfo, orderIdx) => {
                    if(deliIdx == orderIdx) {
                        // console.log(`deli.val : ${deliInfo.value}, order.val : ${orderInfo.value}`);
                        deliInfo.value = orderInfo.value;
                    }
                })
            })
        }
        else {
            alert('주문자의 정보를 입력해 주십시오');
            checkbox.checked = false;
        }

    }
}
// //배송지 주문자와 동일 event




// 입력시 주문자와 배송지 비교
const matchInfoTyping = () => {
    filterDeliveryInfos.forEach( (deliInfo, deliIdx) => {
        filterOrdererInfos.forEach( (orderInfo, orderIdx) => {
            console.log(`deli.val : ${deliInfo.value}, order.val : ${orderInfo.value}`);
            deliInfo.value != orderInfo.value ? checkboxOrderer.querySelector('input').checked = false : void(0) ;
        })
    })
} 
// //입력시 주문자와 배송지 비교



    // 총 결제금액
    // 결제 순서는 (순금액 - (회원할인 + 쿠폰할인 + 적립금사용)) 에서 3만원 이하일 시 배송비추가

    let priceProduct = 0; // 상품금액, 수량을 곱한 순가격
    let priceMember = 0; // 회원할인, 할인율이 아닌 금액
    let priceCoupon = 0; // 일반쿠폰, 할인율 아닌 금액
    let priceDouble = 0; // 중복쿠폰, 할인율 아닌 금액, 현재 제외
    let priceDelivery = 0; // 배송비
    let priceSaved = 0; // 적립금 사용비
    let priceTotal = 0; // 각 계산 적용 후 금액 표기

    const productPrice = document.querySelector('.basket-result-ticket-li.product .basket-result-cate-price input');
    priceProduct = productPrice.value.replace(',', '');
    const productMember = document.querySelector('.basket-result-ticket-li.membership .basket-result-cate-price input');
    priceMember = productMember.value.replace(',', '');
    const productDelivery = document.querySelector('.basket-result-ticket-li.delivery .basket-result-cate-price input');
    priceDelivery = productDelivery.value.replace(',', '');
    const totalPrice = document.querySelector('.basket-result-ticket-li.total .basket-result-cate-price input');
    
    const setTotalPrice = () => {
        priceTotal = Number(priceProduct) - Number(priceMember) - Number(priceCoupon) - Number(priceDouble)  - Number(priceSaved);
        if(priceTotal<30000) {
        	// priceTotal+=priceDelivery;
            priceDelivery = 3000;
        } 
        else {
            priceDelivery = 0;
        }
        productDelivery.value = setNumComma3(priceDelivery);
        priceTotal += Number(priceDelivery);
        totalPrice.value = setNumComma3(priceTotal);
    }
    
    // //총 결제금액
    
 //결제버튼 누를시
document.getElementById('orderBtn').addEventListener("click",event=>{
	let receiverName=document.getElementById('receiverName').value;
	let zipcode=document.getElementById('zipcode').value;
	let roadAddress=document.getElementById('roadAddress').value;
	let subAddress=document.getElementById('subAddress').value;
	let phone=document.getElementById('phone').value;
	let mobile=document.getElementById('mobile').value;
	let memo=document.getElementById('memo').value;
	
	if(receiverName =='' || zipcode == '' || roadAddress == '' || subAddress == '' || mobile == '')
		return alert('필수 배송정보를 입력하지 않았습니다.');	
	let obj = {
		memberNo : document.getElementById('memberNo').value,
		receiverName : document.getElementById('receiverName').value,
		receiverPhone :document.getElementById('phone').value ,
		receiverMobile :document.getElementById('mobile').value ,
		zipcode : document.getElementById('zipcode').value,
		address : document.getElementById('roadAddress').value,
		subAddress : document.getElementById('subAddress').value,
		memo : document.getElementById('memo').value,
		coupon : document.getElementById('coupon').value.replaceAll(',','')==''? 0 : document.getElementById('coupon').value.replaceAll(',',''),
		enuri : 0 ,
		unpaid : 0 ,
		emoney : document.getElementById('useEmoney').value==''? 0: document.getElementById('useEmoney').value.replaceAll(',',''), 
		orderPrice : document.getElementById('totalPrice').value.replaceAll(',',''),
		orderType : '쇼핑몰',
		settleKind : document.querySelector('input[name="payment-detail-method"]:checked').value ,
		orderItemList : [],
		
	}
	
	for(let goods of document.querySelectorAll('.goodsList')){
		obj.orderItemList.push ({
			ea : goods.querySelector('.sum').querySelector('.txt').innerHTML, 
			sno : goods.querySelector('[name="sno"]').value, 
			
		})
	}
	if(document.querySelectorAll('.goodsList').length==1)
		obj.orderName = document.querySelectorAll('.goodsList')[0].querySelector('[name="goodsName"]').value;
	else if(document.querySelectorAll('.goodsList').length>1)	
		obj.orderName = document.querySelectorAll('.goodsList')[0].querySelector('[name="goodsName"]').value +" "+(document.querySelectorAll('.goodsList').length-1) + "외 건";
	
	window.orderObject = obj;
	if(document.querySelector('input[name="payment-method"]:checked').value == "일반결제" && document.querySelector('[name="payment-detail-method"]:checked').value=="무통장입금"){
		let bankNo = document.getElementById('bank');
		let bankSender = document.getElementById('bankSender');
		let cashReceipt = document.querySelector('input[name="payment-cash-receipts"]:checked');
		let cashReceiptOption = document.querySelector('input[name="payment-purpose"]:checked');
		let cashReceiptIdentityNumber = '';
		
		if(bankNo.value=='' || bankSender.value =='')
			return alert("입금정보를 입력하세요");
		if(cashReceipt.value == "Y"&& cashReceiptOption.value=='0')	{
			cashReceiptIdentityNumber = document.querySelectorAll('[name="cashReceiptIdentityNumber"]')[0].value;
			if(cashReceiptIdentityNumber=='')
				return alert("현금영수증을 발급할 식별번호를 입력하세요")
		}else if(cashReceipt.value == "Y"&& cashReceiptOption.value=='1'){
			cashReceiptIdentityNumber = document.querySelectorAll('[name="cashReceiptIdentityNumber"]')[1].value;
			if(cashReceiptIdentityNumber=='')
				return alert("현금영수증을 발급할 식별번호를 입력하세요")
		}	
	}else if (document.querySelector('input[name="payment-method"]:checked').value == "일반결제" && document.querySelector('[name="payment-detail-method"]:checked').value=="신용카드"){
		
	}
	
	fetch('/api/v1/user/order',{
		method : "POST",
		headers : {
			'Content-Type' : "application/json"
		},
		body : JSON.stringify(obj)
	}).then(resp=>resp.text())
	.then(data=>{
		obj.orderNo = data;
		console.log(data);
		if(document.querySelector('input[name="payment-method"]:checked').value == "IDI페이"){
			console.log(2222)
			window.brandPay.loadIdiPay(document.getElementById('memberNo').value + document.getElementById('memberId').value);
			
		}else if(document.querySelector('input[name="payment-method"]:checked').value == "일반결제" && document.querySelector('[name="payment-detail-method"]:checked').value=="신용카드"){
			window.open("/user/tossPayments","결제하기", "width=500, height=500");
		}else if(document.querySelector('input[name="payment-method"]:checked').value == "일반결제" && document.querySelector('[name="payment-detail-method"]:checked').value=="무통장"){
			location.href="/user/basket/complete?orderNo="+data;
		}else if(document.querySelector('input[name="payment-method"]:checked').value == "정기결제"){
			
		}
		
	})
	
})   