
document.addEventListener('DOMContentLoaded', function(){

    const tabs = document.querySelectorAll('.sub-tabs-li');
    const liId = document.querySelector('.li-id');
    const btn = document.querySelector('.sect-btns .btn');
    btn.innerHTML = "아이디 확인";
    
    tabs.forEach( (tab, index) => {
        tab.addEventListener('click', function(){
            tabs.forEach( t => t.classList.remove('active'));
            tab.classList.add('active');

            index == 1 ? liId.classList.add('active') : liId.classList.remove('active');
            btn.innerHTML = "비밀번호 확인";
        });
    })
    
})
