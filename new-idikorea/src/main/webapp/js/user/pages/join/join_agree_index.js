
document.addEventListener('DOMContentLoaded', function(){

    const btnNext = document.querySelectorAll('.btn-next');
    const checkbox = document.querySelectorAll('.checkbox input');
    let countChecked = 0;
    
    btnNext.forEach( btn => {
        btn.addEventListener('click', function(){
            checkbox.forEach( chk => {
                chk.checked ? countChecked++ : countChecked;
            })
            console.log(`check ${checkbox.length}`);

            checkbox.length == countChecked ? window.location.href = '/user/join/info' : window.alert('약관 동의하셔야 다음 단계로 진행됩니다.');
        });
    })
    
})
