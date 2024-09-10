
document.addEventListener('DOMContentLoaded', function(){
    const elSubView = document.querySelector('.sub-view');
    
    openBd(elSubView, 'list');

    /* btn */
    const lisBdMypage = document.querySelectorAll('li.bdMypage-li');
    // console.log(`click ${lisBdMypage.length}`);
    lisBdMypage.forEach( li => {
        const btnsStop = li.querySelectorAll('.btn-order-stop');
        const btnsActive = li.querySelectorAll('.btn-order-active');
        // console.log(`click ${btnsStop.length}`);
        
        btnsStop.forEach( btn => {
            btn.addEventListener('click', function(){
                btnsStop.forEach( el => el.classList.remove('active'));
                btnsActive.forEach( el => el.classList.add('active'));
            })
        })
        btnsActive.forEach( btn => {
            btn.addEventListener('click', function(){
                btnsStop.forEach( el => el.classList.add('active'));
                btnsActive.forEach( el => el.classList.remove('active'));
            })
        })
    })
    /* btn */
    
})

