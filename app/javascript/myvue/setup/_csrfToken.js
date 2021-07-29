import axios from 'axios'
/* 有時候向後端傳送資料，後端無法接收,考慮使用qs模組 */
//import qs from 'qs'
import store from '../store/store.js'

export default function() {
  const csrfToken = document.querySelector("meta[name=csrf-token]").content
  //axios.defaults.baseURL='http://localhost:3000'
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;
  axios.defaults.xsrfCookieName = "JATOKEN";
  axios.defaults.xsrfHeaderName = "X-CSRF-Token";
  axios.defaults.timeout = 5000;
}

axios.interceptors.request.use((config) => {
  store.dispatch('info/isLoadingToggle', true)
  if (config.method === 'get') {
     // config.data = qs.stringify(config.data);
     config.data = JSON.stringify(config.data)
     store.dispatch('info/isLoadingToggle', false)
   }
   //return Promise.resolve(config)
   return config;
 },(error) =>{
   store.dispatch('info/isLoadingToggle', false)
   store.commit('info/flashChange', {ckey: 'error', cmsg: '出錯了！'})
   return Promise.reject(error);
 });
 
 axios.interceptors.response.use((res) =>{

  if (res.status === 200) {
    store.dispatch('info/isLoadingToggle', false)
    var errindex = res.data.indexOf('error:')
    if (errindex == -1) {
      store.commit('info/flashChange', {ckey: 'success', cmsg: res.data})
      return Promise.resolve(res.data)
    } else {
      store.commit('info/flashChange', {ckey: 'error', cmsg: res.data.substr(6)})
      return Promise.reject(res.data)
    } 
  } else {	// 這裡根據接口返回的實際情況來寫
    // 這裡是接口異常，可統一提示錯誤訊息
    //ElementUI.Message.error(res.data.message);
    store.dispatch('info/isLoadingToggle', false)
    
    store.commit('info/flashChange', {ckey: 'error', cmsg: res.data})
    return Promise.reject(res.data.message);
  }}, (error) => {
  // 可在這裡處理 404 訊息
  store.dispatch('info/isLoadingToggle', false)
  // store.commit('info/flashChange', {ckey: 'error', cmsg: '！---' + error})
  
  return Promise.reject(error.response.data);
})


// //===========POST==========
// export function post(api, params) {
//   return new Promise((resolve, reject) => {
//     params = JSON.stringify(params); 

//       axios.post(api, params)
//         .then((response) => {
//           resolve(response.data)
//         }, (err) => {
//           reject(err.data)
//         })
//         .catch((error) => { 
//           reject(error)
//         })

//   });
// }

//============ GET  ===================
// export function get(api, data) {
//   return new Promise((resolve, reject) => {    
//     axios.get(api, { params: data })
//       .then((response) => {
//         alert('js--get: '  + response.data)
//         resolve(response.data)
//       }, (err) => {
//         reject(err);
//       })
//       .catch((error) => {
//         alert('js--get: '  + error)
//         reject(error)
//       })
//       .finally(()=> {})
//   setTimeout(() => resolve('promise1-result'), 1000)
//   });
// }
