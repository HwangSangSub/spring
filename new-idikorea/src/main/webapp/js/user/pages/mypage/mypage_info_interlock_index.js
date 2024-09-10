

document.addEventListener('DOMContentLoaded', function(){

    const elsSubView = document.querySelectorAll('.sub-view');
    
    elsSubView.forEach( el => {
        // console.log(el.classList.contains(pageCurrent));
        el.classList.contains(pageCurrent) ? el.classList.add('active') : void(0);
        // console.log(el.classList.contains('active'));
    })


})