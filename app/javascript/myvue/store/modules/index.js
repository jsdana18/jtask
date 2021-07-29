/* 
 * 透過 modules/index.js 動態 export 資料夾下所有 module 
 * Dynamic Exporter:
 * Dynamically export all json files (except self) in current folder
 */
const req = require.context('.', false, /\.js$/)

req.keys().forEach((key) => {
  const name = key.replace(/^\.\/(.*)\.js/, '$1')

  if (name !== 'index') {
    module.exports[name] = req(key).default
  }
})
