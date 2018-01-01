'use strict';

import { cookie } from "cookie_js";

var cookieDom = document.querySelector('.cookie-consent');
var ccButton = document.querySelector('.cookie-consent .button');

ccButton.addEventListener('click', acceptCookie);

if (!cookie.get('cc')) {
    cookie.set('cc', 'deny', {expires: 30});
}

if (cookie.get('cc') === 'agree') {
    cookieDom.classList.add('hide');
} else {
    cookieDom.classList.remove('hide');
}

function acceptCookie () {
    cookie.set('cc', 'agree', {expires: 30});
    this.parentNode.classList.add('hide');
}
