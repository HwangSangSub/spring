
document.addEventListener('DOMContentLoaded', function(){

    // check 할 때 합계 보여주기
    const bdli = document.querySelectorAll('.bdBasket-li.btn');
    const total = document.querySelector('.bdBasket-li.total');
    
    
    bdli.forEach( li => {
        const ck = li.querySelector('.checkbox');
        ck.addEventListener('change', function(){
            sumTotal( bdli );
            const inputTotal = total.querySelector('.basket-result-price input');
            inputTotal.value = setNumComma3(priceTotal);
        })

        const btnsSumControl = li.querySelectorAll('.btn-sum-control');
        btnsSumControl.forEach( btn => {
            btn.addEventListener('click', function(){
                sumTotal( bdli );
                const inputTotal = total.querySelector('.basket-result-price input');
                inputTotal.value = setNumComma3(priceTotal);
            })
        })
    })
    // check 할 때 합계 보여주기
    
})


let priceTotal = 0;

// li 합(check가 있을 시)
const sumTotal = ( lis ) => {
    priceTotal = 0;
    lis.forEach( li => {
        if(li.querySelector('.checkbox').checked) {
            const num = li. querySelector('.col-order-price .num');
            // console.log(Number(num.innerHTML.replace(",", "")));
            
            priceTotal += Number(num.innerHTML.replace(",", ""));
        }
    })
}
// li 합(check가 있을 시)