
document.addEventListener('DOMContentLoaded', function(){
    // --vh reset
	setScreenSize();
	$(window).on('resize', function(){ 
		setScreenSize(); // --vh
	 });
	// //--vh reset

    // 위치에 따른 탑이동메뉴 표기 및 이벤트
    let $btnGoTop = $('#common_go_top');
    window.addEventListener('scroll', function(){
        const y = window.scrollY;
        const h = window.innerHeight;
        if(y > h && !$btnGoTop.hasClass('active')) {
            // console.log(`e : ${window.scrollY}, windowH : ${window.innerHeight}`);
            $btnGoTop.addClass('active');
        } else if(y < h && $btnGoTop.hasClass('active')) {
            $btnGoTop.removeClass('active');
        }
    })
    
    $btnGoTop.on('click', function(e){
        e.preventDefault();
        window.scrollTo({ top : 0, behavior : 'smooth' });
    })
    // //위치에 따른 탑이동메뉴 표기 및 이벤트


	
    // 미니 대화상자 공통    
    const btnPopovers = document.querySelectorAll('.btn-popovers');
    btnPopovers.forEach( ( btn, index ) => {
        btn.addEventListener('click', function(){
            openPopovers(btn, index);
            // const popovers = btn.parentElement.querySelector('.popovers');
            // popovers.classList.add('active');
            // clearTimeout(setTimePopovers[index]);
            // setTimePopovers[index] = setTimeout(() => {
            //     popovers.classList.remove('active');
            //     clearTimeout(setTimePopovers[index]);
            // }, 5500);
        })
    })

    const btnPopoversClose = document.querySelectorAll('.popovers-close.btn-close');
    btnPopoversClose.forEach( ( btn, index ) => {
        btn.addEventListener('click', function(){
            const parents = parentAll(btn);
            const popovers = parents.filter( parent => {
                if(parent.classList && parent.classList.length > 0 && parent.classList.contains('popovers')) {
                    return parent;
                }
            });
            popovers.forEach( el => el.classList.remove('active'));

            clearTimeout(setTimePopovers[index]);
        })
    })
    
    // //미니 대화상자 공통



    // 무통장 공통    
    $.ajax({
        url : '/json/user/common/bank.json',
        type:"get",
        success : function(data){
            accountList = data.account;
        }
    }).done(function(){

        // 무통장입금 계좌 select 버전
        const selectsAccount = document.querySelectorAll('.sub-account-select');
        selectsAccount.forEach( (selectAccount) => {
            selectAccount.innerHTML += makePayAccount( accountList, 'select');
        })
        // 무통장입금 계좌 select 버전


        // 무통장입금 계좌 box 버전
        const boxAccount = document.querySelectorAll('.sub-accounts');
        boxAccount.forEach( (boxAccound) => {
            boxAccound.innerHTML += makePayAccount( accountList, 'box');
        })
        // 무통장입금 계좌 box 버전

    });
    // //무통장 공통



    // 복사 아이콘 공통
    const btnsCopy = document.querySelectorAll(".btn-copy");
    btnsCopy.forEach( (btn) => {
        btn.addEventListener("click", function(){
            const copyTarget = btn.parentElement.querySelector('.copy-target');
            window.navigator.clipboard.writeText(copyTarget.textContent).then(()=> {
                alert('복사되었습니다.');
            })
            .catch(() => {
                console.log("sorry, can't copy");
            })
        })
    })
    // //복사 아이콘 공통




})



// 공통 js 선택자
const siblings = t => [...t.parentElement.children].filter(e => e != t);
const siblingsChildren = t => [...$(t).parent().find('*:not(t) *')];
// const parentAll = t => [...$(t).parents()];

const parentAll = (el, parentSelector) => {
    if(parentSelector === undefined) {
        parentSelector = document;
    }
    let parents = [];
    let p = el.parentNode;
    while(p !== parentSelector) {
        let o = p;
        parents.push(o);
        p = o.parentNode;
    }
    parents.push(parentSelector);
    return parents;
}

// //공통 js 선택자


// 영문 혹은 숫자 구분
const patternNum = /[0-9]/;
const patternEn = /[a-zA-Z]/;

const testStr = ( str, type ) => {
    let result = false;
    if(type == 'number' || type == 'num') {
        result = patternNum.test(str) ? true : false;
    }
    else if(type == 'english' || type == 'en') {
        result = patternEn.test(str) ? true : false;
    }
    
    return result;
}
// //영문 혹은 숫자 구분


// 숫자 콤마 세자리
const setNumComma3 = ( num ) => {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
} 
// //숫자 콤마 세자리


// --vh setting
function setScreenSize() {
	let vh = window.innerHeight * 0.01;
	document.documentElement.style.setProperty("--vh", `${vh}px`); //"--vh"라는 속성으로 정의해준다.
}
// //--vh setting




// scroll event 최적화
function optimizeAnimation(callback) {
    let ticking = false;

    return () => {
        if (!ticking) {
            ticking = true;
            requestAnimationFrame(() => {
                callback();
                ticking = false;
            });
        }
    };
}
// //scroll event 최적화


// swiper 공통
const setSwiper = ( classname, param ) => {
    return new Swiper( classname, param)
}

const destroySwiper = ( swiper ) => {
    return swiper.destroy()
}
// //swiper 공통


// 미니 대화상자 공통   
let setTimePopovers = [];
const openPopovers = ( b, i ) => {    
    const popovers = b.parentElement.querySelector('.popovers');
    popovers.classList.add('active');
    clearTimeout(setTimePopovers[i]);
    setTimePopovers[i] = setTimeout(() => {
        popovers.classList.remove('active');
        clearTimeout(setTimePopovers[i]);
    }, 5500);
}
// //미니 대화상자 공통   


// 무통장 공통 
let account;
let accountList;


const makePayAccount = ( accounts, tag ) => {
    let str = '';
    // console.log(accounts);
    accounts.forEach( ( account ) => {
        if(tag == 'select') {
            str += `<option>${account.bank} ${account.num}(${account.name})</option>`;
        } else if(tag == 'box') {
            str += `
            <li>
                <div class="sub-account">
                    <div class="sub-account-info">
                        <p class="sub-account-bank"><b>${account.bank}</b></p>
                        <span>-</span>
                        <p class="sub-account-holder">${account.name}</p>
                    </div>
                    <div class="sub-account-num">
                        <p>${account.num}</p>
                    </div>
                </div>
            </li>
            `;
        }

    })
    
    return str;
}
// //무통장 공통 



// 위치 이동 ( speed 일정, 후에 speed 변경 방법 )
const scrollToEl = (el) => {
    const rect = el.getBoundingClientRect();
    window.scrollTo({ top : rect.top + window.scrollY, behavior : 'smooth' });
}

const scrollIntoEl = (el) => {
    el.scrollIntoView( {behavior : "smooth"} )
}
// //위치 이동



// 수량 컨트롤러
const makeSumController = ( btns, elTarget, isRemove ) => {
    // btns : 수량조절 btn`
    // elTarget : 수량조절 0 시 삭제할 상품
    // 수량 0일 시 0 표기 대신 elTarget를 삭제할 것인지
    btns.forEach( btn => {
        btn.addEventListener('click', function(e){
            const target = [...elTarget].filter( p => p.contains(btn) );
            let elInput = btn.parentElement.querySelector('input.sum');
			console.log(e.target.closest('div'))
            let minEa = e.target.closest('div').querySelector('#minEa').value;
            let maxEa = e.target.closest('div').querySelector('#maxEa').value;
            let useStock = e.target.closest('div').querySelector('#useStock').value;
            let nowStock = e.target.closest('div').querySelector('#nowStock').value;
            if( maxEa!=0 && maxEa*1 <= elInput.value*1 && btn.classList.contains('btn-sum-plus') ){
				return alert("상품의 최대구매수량은 "+ maxEa + "개입니다.");
			}
			if(nowStock!='' && useStock=='Y' && nowStock <= elInput.value && btn.classList.contains('btn-sum-plus') ){
				return alert("상품의 최대구매수량은 "+ nowStock + "개입니다.");
			}
			if( minEa != 0 && minEa !='' && minEa >= elInput.value && btn.classList.contains('btn-sum-minus'))
				return alert("상품의 최소구매수량은 "+ minEa + "개입니다.");
				
            // btn.classList.contains('minus') ? btn.parentElement.querySelector('input.sum').value-- : void(0);
            if( btn.classList.contains('btn-sum-minus') ) {
                let isSum;

                if(isRemove) {
                    elInput.value <= 1 ? isSum = confirm('상품을 제외하시겠습니까?') : elInput.value--;
                    if(isSum == true){
                        console.log(target);
                        target.forEach( el => el.remove());
                    }
                } 
                else {
                    elInput.value <= 0 ? elInput.value = 0 : elInput.value--;
                }
            } 
            else if( btn.classList.contains('btn-sum-plus') ){
                elInput.value++;
            }

            target.forEach( el => {
                el.querySelector('.order-price .num').innerHTML = elInput.value * el.querySelector('.price').dataset['price'];
                el.querySelector('.order-price .num').innerHTML = setNumComma3(el.querySelector('.order-price .num').innerHTML);
                el.querySelector('.col-order-price .num').innerHTML = elInput.value * el.querySelector('.col-price').dataset['price'];
                el.querySelector('.col-order-price .num').innerHTML = setNumComma3(el.querySelector('.col-order-price .num').innerHTML);
            });
            
        })
    })
}
// //수량 컨트롤러



// click event : active 주기
const clickClassActive = ( els ) => {
    console.log('tab click');
    els.forEach( el => {
        el.addEventListener('click', function(){
            els.forEach( ele => ele.classList.remove('active'));
            this.classList.add('active');
        })
    })
}
// //click event : active 주기

// 기부금영수증
function goGive() {
    window.open("http://www.idikorea.com/yearend/form.php","","width=800,height=500,scrollbar=yes");
}
// 기부금영수증