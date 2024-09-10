
document.addEventListener('DOMContentLoaded', function(){

    const btnNext = document.querySelectorAll('.btn-next');
    
    btnNext.forEach( btn => {
        btn.addEventListener('click', function(){
            window.location.href = '/user/join/complete';
        });
    })
    
})
