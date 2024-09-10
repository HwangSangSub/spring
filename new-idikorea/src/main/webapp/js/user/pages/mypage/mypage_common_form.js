

document.addEventListener('DOMContentLoaded', function(){
    const elSubView = document.querySelector('.sub-view');
    const elForm =  elSubView.querySelectorAll('.fm-wrap');
    elForm.forEach( el => {
        el.classList.add('active');
    })
    // elForm.classList.add('active');


})