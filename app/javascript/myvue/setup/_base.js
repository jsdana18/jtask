
const plugins = {

    install(Vue){

    // require.context( 組件目錄的相對路徑, 是否查詢子目錄, 組件文字的正則表示式)
    //const requireComponent = require.context('../', true, /\w+\.(vue|js)$/) 
    const requireComponent = require.context('../base', false, /\w+\.(vue)$/) 

    //console.log('base.js: requireComponent : ' + requireComponent.keys() )

    // For each matching file name...
    requireComponent.keys().forEach((fileName) => {

      const componentConfig = requireComponent(fileName)

      //Get the PascalCase version of the component name
      const componentName = fileName
        .replace(/^\.\//, '')
        .replace(/\.\w+$/, '')
        .split('-')
        .map((kebab) => kebab.charAt(0).toUpperCase() + kebab.slice(1))
        .join('')

      Vue.component(componentName, componentConfig.default || componentConfig)
    })
  }

}

export default plugins