
document.addEventListener('DOMContentLoaded', function(){

        const wrap = document.querySelector('.wrap');
        const sectInfo = document.querySelector('.sect-inquiry');
        
        /* view */
        const btnsOpenInfo = document.querySelectorAll('.btn-open-info');
        // console.log(`click ${btnsOrderStop.length}`);
        
        btnsOpenInfo.forEach( (btn, idx) => {
            // console.log(`click ${btn} ${idx}`);
            btn.addEventListener('click', function(){
                openBd(wrap, 'view');
                sectInfo.classList.remove('active');
            })
        })
        /* view */
    
})