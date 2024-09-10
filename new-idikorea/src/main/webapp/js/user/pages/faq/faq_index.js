
document.addEventListener('DOMContentLoaded', function(){


    // faq list open/close`
    const liFaq = document.querySelectorAll('.boardFaq > ul > li:not(.empty)');
    liFaq.forEach( (li, index) => {
        const question = li.querySelector('.question');
        const answer = li.querySelector('.answer');

        question.addEventListener('click', function(){
            const isOpened = answer.classList.contains('active');
            
            liFaq.forEach( (liF, indexF) => {
                liF.querySelector('.question').classList.remove('active');
                liF.querySelector('.answer').classList.remove('active');
                clearTimeout(calcHTimer[indexF]);
                liF.querySelector('.answer').style.height = `0px`;
                liF.querySelector('.answer').style.paddingTop = `0px`;
                liF.querySelector('.answer').style.paddingBottom = `0px`;
            })

            if(isOpened) {
            }
            else {
                question.classList.add('active');
                answer.classList.add('active');
                answer.style.paddingTop = `28px`;
                answer.style.paddingBottom = `28px`;
                answer.style.height = `auto`;
                calcHTimer[index] = setTimeout(function(){
                    answer.style.height = `${answer.offsetHeight}px`;
                    // scrollToEl(question);
                    scrollIntoEl(question);
                }, 300);

            }
        })
    })
    // //faq list open/close` 


    // 게시판 폼, 상세, 리스트 보이게 on/off
    const elSubView = document.querySelector('.sub-view');
    openBd(elSubView, 'listQ');
    // //게시판 폼, 상세, 리스트 보이게 on/off


})



let calcHTimer = []; // height auto 변경 적용 시간 이벤트타임