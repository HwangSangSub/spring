
document.addEventListener('DOMContentLoaded', function(){

    
    // ATTACH FILE
    $(document).on('click', 'button.attachFile, input[type="text"]', function() {
        $(this).siblings('input[type="file"]').click();
    });

    $(document).on('change', 'input[type="file"]', function() {
        $(this).siblings('input[type="text"]').val( $(this).val() );
    });

    $(document).on('click', 'button.attachFileReset', function() {
        $(this).siblings('input').val('');
    });
    // ATTACH FILE


    // 게시판 리스트 채우기
    pushBdMenuLi( navId );
    // //게시판 리스트 채우기


    // btn

    
    const btnsBdList = document.querySelectorAll('.btn-bd-list');
    btnsBdList.forEach( btnBdList => {
        btnBdList.addEventListener('click', function(){
            const el = document.querySelector('.detail-tabviews-li.active');
            openBd(el ? el : document.querySelector('.sub-view'), 'list');
        })
    })

    const btnsBdReview = document.querySelectorAll('.btn-bd-reply');
    btnsBdReview.forEach( btnBdReview => {
        btnBdReview.addEventListener('click', function(){
            const el = document.querySelector('.detail-tabviews-li.active');
            openBd(el ? el : document.querySelector('.sub-view'), 'reply');
            scrollIntoEl(el ? el : document.querySelector('.fm-wrap'));
        })
    })

    const btnsBdModify = document.querySelectorAll('.btn-bd-modify');
    btnsBdModify.forEach( btnBdModify => {
        btnBdModify.addEventListener('click', function(){
            const el = document.querySelector('.detail-tabviews-li.active');
            openBd(el ? el : document.querySelector('.sub-view'), 'modify');
            scrollIntoEl(el ? el : document.querySelector('.fm-wrap'));
        })
    })

    const btnsBdCancel = document.querySelectorAll('.btn-bd-cancel');
    btnsBdCancel.forEach( btnBdCancel => {
        btnBdCancel.addEventListener('click', function(){
            const el = document.querySelector('.detail-tabviews-li.active');
            openBd(el ? el : document.querySelector('.sub-view'), 'cancel');
        })
    })

    const btnsBdView = document.querySelectorAll('.btn-bd-view');
    btnsBdView.forEach( btnBdView => {
        btnBdView.addEventListener('click', function(){
            const el = document.querySelector('.detail-tabviews-li.active');
            openBd(el ? el : document.querySelector('.sub-view'), 'view');
            scrollIntoEl(el ? el : document.querySelector('.sub-view'));
        })
    })

    const btnsNewbd = document.querySelectorAll('.btn-newbd');
    btnsNewbd.forEach( btnNewbd => {
        btnNewbd.addEventListener('click', function(){
            const el = document.querySelector('.detail-tabviews-li.active');
            openBd(el ? el : document.querySelector('.sub-view'), 'form');
            scrollIntoEl(el ? el : document.querySelector('.sub-view'));
        })
    })
    
    // //btn


    // datepicker base setting
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        //monthNames: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
        //monthNamesShort: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        showOn: "both",
        buttonImage: '/images/user/jquery/calender_img.jpg',
        buttonImageOnly: true,
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeYear: true,
        changeMonth: true
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    // //datepicker base setting
    
    // 기간 datepicker
    $('input[name=sEventDate]').datepicker();
    $('input[name=eEventDate]').datepicker();
    // //기간 datepicker

})


// 게시판 새글, 상세, 답글 달기 등 동작
const openBd = ( elParent, type ) => {
    const elView =  elParent.querySelectorAll('.v-wrap');
    const elForm =  elParent.querySelectorAll('.fm-wrap');
    const elList =  elParent.querySelectorAll('.bd-wrap');
    const elListQ =  elParent.querySelectorAll('.bdQ-wrap');
    
    switch(type) {
        case 'view' :
            elView.forEach( el => {
                el.classList.add('active');
            }) 
            elForm.forEach( el => {
                el.classList.remove('active');
                el.classList.remove('reply');
            }) 
            elList.forEach( el => {
                el.classList.add('active');
            }) 
            elView.forEach( (el, index) => {
                if(index == 0) {
                    scrollToEl(el);
                }
            }) 
            break;
        case 'form' : 
            elView.forEach( el => {
                el.classList.remove('active');
            }) 
            elForm.forEach( el => {
                el.classList.add('active');
                el.classList.remove('reply');
            }) 
            elList.forEach( el => {
                el.classList.remove('active');
            }) 
            elListQ.forEach( el => {
                el.classList.remove('active');
            }) 
        break;
        case 'formM' : 
            elForm.forEach( el => {
                el.classList.add('active');
                el.classList.remove('reply');
            }) 
            elList.forEach( el => {
                el.classList.add('active');
            }) 
            elForm.forEach( (el, index) => {
                if(index == 0) {
                    scrollToEl(el);
                }
            }) 
        break;
        case 'reply' : 
            elView.forEach( el => {
                el.classList.add('active');
            }) 
            elForm.forEach( el => {
                el.classList.add('active');
                el.classList.add('reply');
            }) 
            elList.forEach( el => {
                el.classList.remove('active');
            }) 
            elForm.forEach( (el, index) => {
                if(index == 0) {
                    scrollToEl(el);
                }
            }) 
        break;
        case 'modify' : 
            elView.forEach( el => {
                el.classList.remove('active');
            }) 
            elForm.forEach( el => {
                el.classList.add('active');
                el.classList.add('reply');
            }) 
            elList.forEach( el => {
                el.classList.remove('active');
            }) 
            elForm.forEach( (el, index) => {
                if(index == 0) {
                    scrollToEl(el);
                }
            }) 
        break;
        case 'modifyM' : 
            elForm.forEach( el => {
                el.classList.add('active');
                el.classList.add('reply');
            }) 
            elList.forEach( el => {
                el.classList.add('active');
            }) 
            elForm.forEach( (el, index) => {
                if(index == 0) {
                    scrollToEl(el);
                }
            }) 
        break;
        case 'list' : 
            elView.forEach( el => {
                el.classList.remove('active');
            }) 
            elForm.forEach( el => {
                el.classList.remove('active');
                el.classList.remove('reply');
            }) 
            elList.forEach( el => {
                el.classList.add('active');
            }) 
            break;
        case 'listQ' : 
            elForm.forEach( el => {
                el.classList.remove('active');
                el.classList.remove('reply');
            }) 
            elListQ.forEach( el => {
                el.classList.add('active');
            }) 
            break;
        case 'cancel' : 
            elForm.forEach( el => {
                el.classList.remove('active');
                el.classList.remove('reply');
            }) 
            elList.forEach( el => {
                el.classList.add('active');
            }) 
            elListQ.forEach( el => {
                el.classList.add('active');
            }) 
            break;
        default : 
        break;
    }
}
// //게시판 새글, 상세, 답글 달기 등 동작


// 게시판 메뉴 리스트의 내용 넣기
const pushBdMenuLi = async ( pageId ) => {
    // const menusList = document.querySelectorAll('.sub-menus');
    const menusList = document.querySelectorAll('.sub-menus-wrap');
    
    const data = await fetch('/json/user/common/menu.json');
    const json = await data.json();

    const menus = json.menu;
    const checkMenu = checkMenuId( menus, pageId);
    // console.log(checkMenu.menu);

    menusList.forEach( li => {
        // li.innerHTML = htmlBdMenuLi(checkMenu.parent, checkMenu.menu);
        li.innerHTML = htmlBdMenuLi(menus, checkMenu.menu);
    })

    
}

const checkMenuId = ( menus, id ) => {
    let targetMenu;
    let targetParent;

    menus.forEach( menu => {
        if(!targetMenu) {
            if(menu.id == id) {
                targetMenu = menu;
                targetParent = menus;
            } 
            else if(menu.sub) {
                targetMenu = checkMenuId(menu.sub, id).menu;
                targetParent = checkMenuId(menu.sub, id).parent;
            }
        }
    })
    // console.log(`result ${result}`);

    return {
        menu: targetMenu,
        parent: targetParent
    };
}

const htmlBdMenuLi = ( menus, pagemenu ) => {
    let html = '';

    // html += htmlBdMenuNthLi(menus, pagemenu);
    menus.forEach( menu => {
        if(menu.sub) {
            html += htmlBdMenuNthLi(menu.sub, pagemenu);
        }
    })


    return html;
}

const htmlBdMenuNthLi = ( menus, pagemenu ) => {
    let html = '';
    let menuType = '';
    let ex = menus[0].id.length;
    switch(ex){
        case 4: 
            menuType="main";
        break;
        case 6:
            menuType="sub";
        break;
        case 8:
            menuType="third";
        break;
    }

    html += `
        <ul class="sub-menus menutype-${menuType}">
    `;
    

    menus.forEach( menu => {
        const isActive = menu.id == pagemenu.id ? 'active' : '';

        // console.log(`${menu.id}`);
        // console.log(`${pagemenu.id}`);
        if(menu.id.substr(0, 2) == pagemenu.id.substr(0, 2)) {

            // 마이페이지의 데시보드 링크는 숨긴다
            const isHide = menu.id == '0701' ? 'hide' : '';

            const url = checkMenuUrl(menu) != "#" ? checkMenuUrl(menu) : menu.url;
            
            html += `
            <li class="${isActive} ${isHide}">
                <a href="${url}" class="sub-menu">${menu.tit}</a>
            `;

            if(menu.sub) {
                html += htmlBdMenuNthLi( menu.sub, pagemenu);
            }

            html += `
            </li>
            `;

        }
    })

    
    
    html += `
        </ul>
    `;


    return html;
}
// //게시판 메뉴 리스트의 내용 넣기