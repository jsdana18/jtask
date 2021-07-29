import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
//import { mapGetters, mapActions } from 'vuex'
//import createLogger from '../../../src/plugins/logger'
import createLogger from 'vuex/dist/logger'

import modules from './modules'

Vue.use(Vuex)
const isDebug = process.env.NODE_ENV !== 'production'

// A Vuex instance is created by combining the state, mutations, actions,
// and getters.
export default new Vuex.Store({
  modules,
  strict: isDebug,
  plugins: isDebug ? [createLogger()] : []
})

