
document.addEventListener('DOMContentLoaded', function(){


    // 작은 대화상자 먼저 열기
    const firstOpentarget = document.querySelector('.order-num .btn-popovers');
    const btnPopovers = document.querySelectorAll('.btn-popovers');
    btnPopovers.forEach( (btn, index) => {
        if(btn == firstOpentarget) {
            openPopovers(btn, index);
        }
    })
    // //작은 대화상자 먼저 열기
    
})