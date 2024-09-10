
document.addEventListener('DOMContentLoaded', function(){
    const btnSearchPostal = document.querySelectorAll('.btn-search-postal');
    // const arrBtnSearchPostal = [...btnSearchPostal];
    btnSearchPostal.forEach( ( btn ) => {
        btn.addEventListener('click', function(){
            const targetLi = document.querySelector('.bdNormal-li.address');
            const btnParents = parentAll(btn, targetLi);

            // const btnParent = btnParents.filter( (el) => el.classList.contains('bdNormal-li'));
            openModalPost( btnParents );
        })
    })
    
})