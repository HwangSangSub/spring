

document.addEventListener('DOMContentLoaded', function(){
    const elSubView = document.querySelector('.sub-view');
    // const elForm =  elSubView.querySelector('.fm-wrap');

    
    openBd(elSubView, 'list');
    // elForm.classList.add('active');

    const btnsAddAddress = document.querySelectorAll('.btn-add-address');
    btnsAddAddress.forEach( btn => {
        btn.addEventListener('click', function(){
            openBd(elSubView, 'formM');
        })
    })


    const btnsModify = document.querySelectorAll('.btn-modify');
    btnsModify.forEach( btn => {
        btn.addEventListener('click', function(){
            openBd(elSubView, 'modifyM');
        })
    })


})

