
document.addEventListener('DOMContentLoaded', function(){
    const elSubView = document.querySelector('.sub-view');
    
    openBd(elSubView, 'list');

    
    
    /* view */
    const btnsOpenView = document.querySelectorAll('.btn-open-view');
    // console.log(`click ${btnsOrderStop.length}`);
    
    btnsOpenView.forEach( (btn, idx) => {
        // console.log(`click ${btn} ${idx}`);
        btn.addEventListener('click', function(){
            openBd(elSubView, 'view');
        })
    })
    /* view */

    /* 주문취소 */
    const lisBdMypage = document.querySelectorAll('.bd-wrap li.bdMypage-li');
    // console.log(`click ${lisBdMypage.length}`);
    lisBdMypage.forEach( li => {
        const btnsCancel = li.querySelectorAll('.btn-cancel');
        // console.log(`click ${btnsStop.length}`);

        btnsCancel.forEach( btn => {
            btn.addEventListener('click', function(){
                openBd(elSubView, 'form');
            })
        })
    })
    /* 주문취소 */
    
})

