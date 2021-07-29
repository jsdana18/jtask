import Vue from 'vue/dist/vue.esm'
import _ from 'lodash' //第三方庫
import store from '../myvue/store/store.js'

import setupCSRFToken from '../myvue/setup/_csrfToken'
import setupBase from '../myvue/setup/_base'

Vue.use(_)
setupCSRFToken()
Vue.use(setupBase)

document.addEventListener('DOMContentLoaded', () => {

    var app1 = new Vue({
        el: '[data-behavior="app"]',
        store,
        // VueRouter,
    })

})

