const state = {
    isAdmin: false,

    isLoading: false,
    isLoadingClose: false,
    //isLoadingType: 1,

    flashKey: 'alert',
    flashMsg: '',
    flashSeen: false,
    
    modalKey: 'alert',
    modalHead: '警告',
    modalMsg: '',
    modalSeen: false,
    modalYes: false,
    modalYesMsg: '',
}
  
const mutations = {
    isAdminChange(state, payload) {
        state.isAdmin = payload
    },
    isAdminTogglee(state) {
        state.isAdmin = !state.isAdmin
    },

    isLoadingToggle(state, payload) {
        if (payload != 'toggle') {
            state.isLoading = payload
        } else {
            state.isLoading = !state.isLoading
        }
    },
    isLoadingCloseToggle(state) {
        state.isLoadingClose = !state.isLoadingClose
     },
    // isLoadingTypeChange(state, payload) {
    //    state.isLoadingType = payload
    // },

    flashChange(state, payload) {
        if (payload.cmsg == null || payload.cmsg == "null" || payload.cmsg == '' || payload.cmsg == "true" ){
            state.flashSeen = false
        } else {
            state.flashKey = payload.ckey
            state.flashMsg = payload.cmsg
            state.flashSeen = true
        }
    },
    flashSeenToggle(state, payload) {
        if (payload != 'toggle') {
            state.flashSeen = payload
        } else {
            state.flashSeen = !state.flashSeen
        }
    },

    modalChange(state, payload) {
        state.modalKey = payload.key
        state.modalHead = payload.head
        state.modalMsg = payload.msg
    },
    modalSeenToggle(state, payload) {
        if (payload != 'toggle') {
            state.modalSeen = payload
        } else {
            state.modalSeen = !state.modalSeen
        }
    },
    modalYesToggle(state, payload) {
        if (payload != 'toggle') {
            state.modalYes = payload
        } else {
            state.modalYes = !state.modalYes
        } 
    },
    modalYesMsgChange(state, payload) {
        state.modalYesMsg = payload
    },
}
  
const actions = {
    isAdminChange({ dispatch, commit, state }, payload) { commit('isAdminChange', payload) },
    isAdminToggle({ commit }) { commit('isAdminToggle') },

    isLoadingToggle({ dispatch, commit }, payload) { commit('isLoadingToggle', payload)},
    isLoadingCloseToggle({  dispatch, commit }) { commit('isLoadingCloseToggle') },
    //isLoadingTypeChange({  dispatch, commit }, payload) { commit('isLoadingTypeChange', payload) },

    flashChange({ dispatch, commit, state }, payload) { commit('flashChange', payload) },
    flashSeenToggle({ dispatch, commit }, payload) { commit('flashSeenToggle', payload) },

    modalChange({ dispatch, commit, state }, payload) { commit('modalChange', payload) },
    modalSeenToggle({ dispatch, commit }, payload) { commit('modalSeenToggle', payload) },
    modalYesToggle({ dispatch, commit }, payload) { commit('modalYesToggle', payload) },
    modalYesMsgChange({ dispatch, commit, state }, payload) { commit('modalYesMsgChange', payload) },
}

const getters = {
    isLoadingType: (state) => {
        return Math.floor(Math.random() * 12) + 1
    }
}
  
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}