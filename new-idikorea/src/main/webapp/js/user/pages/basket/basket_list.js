
document.addEventListener('DOMContentLoaded', function(){

    const tabsIsRegular = document.querySelectorAll(".basket-tabs-li");
    const products = document.querySelectorAll('.bdBasket-li.btn'); // 상품 갯수
    const productCks = document.querySelectorAll('.bdBasket-li.btn input.checkbox'); // 상품 갯수 * 2, pc형과 반응형 포함하기에
    const ckAll = document.querySelector('input.checkbox-allcheck'); // board head 에 있는 check
    const btnsSumControl = document.querySelectorAll('.btn-sum-control'); // 수량 조절

    // tab active event
    clickClassActive( tabsIsRegular );
    // //tab active event
    // 주문버튼
	document.addEventListener("click",event=>{
		console.log(event.target.closest('a'))
		if(event.target.closest('a').innerHTML =='주문하기'){
			event.preventDefault();
			let obj =[];
			document.querySelectorAll('[name="cartList"]').forEach(tag=>{
				if(tag.querySelector('[name="checkGoods"]').checked){
					obj.push({
						sno : tag.querySelector('[name="sno"]').value,
						ea : tag.querySelector('[name="ea"]').value
					})
				}
				
			})
			document.getElementsByName('orderData')[0].value = JSON.stringify(obj);
			document.getElementsByName('orderFrm')[0].submit();
		}
	})

    // 상품 선택시 체크
    products.forEach( pd => {
        pd.addEventListener('click', function(e){
            let countClickSum = 0;
            const target = pd.querySelectorAll('.checkbox');
            const clickedSums = pd.querySelectorAll('.btn-sum-control');
            clickedSums.forEach( btn => {
                const clidedSumChildren = btn.querySelectorAll('*');
                btn == e.target ? countClickSum++ : countClickSum;
                clidedSumChildren.forEach( child => {
                    child == e.target ? countClickSum++ : countClickSum;
                })
            })
            if(countClickSum == 0) {
                target.forEach( ck => {
                    ck.checked = !ck.checked;
                    // check box 값 변경 후, change event 알림
                    ck.dispatchEvent(new Event('change'));
                })
            }
            // console.log(ckChecked.length);
        })
    })
    // //상품 선택시 체크
    

    // 상품 체크에 따라 head 체크 변경
    productCks.forEach( ck => {
        ck.addEventListener('change', function(){
            // const ckChecked = [...products].filter( ckW =>ckW.querySelector(':has(.checkbox:checked)'));
            const ckChecked = [...products].filter( ckW => ckW.querySelector('.checkbox').checked == ckAll.checked);
            // console.log(`ckChecked ${ckChecked}`);
            
            // 값 변화 시 allcheck 감지
            ckChecked.length == products.length || ckChecked.length == 0 ? ckAll.checked = ck.checked : void(0);
            ckChecked.length != products.length && ckChecked.length != 0 ? ckAll.checked = false : void(0);
            // console.log( ckChecked.length == productCks.length);
        })
    })
    // //상품 체크에 따라 head 체크 변경
    
    // head 체크박스 - 모두 체크, 해제
    ckAll.addEventListener('click', function(e){
        productCks.forEach( ck => ck.checked = e.target.checked );
    });
    // //head 체크박스 - 모두 체크, 해제

    // 수량
    makeSumController(btnsSumControl, products, true);
    // //수량


    // 하단 삭제하기 btn
    const btnsRemove = document.querySelectorAll('.basket-btn.remove');
    btnsRemove.forEach( btnRemove => {
        btnRemove.addEventListener('click', function(){
            const isRemove = confirm('장바구니를 비우시겠습니까?');
            if(isRemove) {
                products.forEach( p => p.remove())
            }
        })
    })
    // //하단 삭제하기 btn


})



