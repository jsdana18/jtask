const state = {
    vcids: [],
    vcidss: [],
    //deletedIds: [],
}
  
const mutations = {
    idsAdd(state, payload) {
        if (state.vcids.indexOf(payload) <=0) {
            state.vcids.push(payload)
        }  
    },
    idsDel(state, payload) {
        state.vcids.splice(state.vcids.indexOf(payload), 1)
    },

    idssAdd(state, id) {
        if (state.vcidss.indexOf(id) <=0) {
            state.vcidss.push(id)
        }  
    },
    idssDel(state, id) {
        state.vcidss.splice(state.vcidss.indexOf(id), 1)
    },
    idsAddAll(state) {
        state.vcids=[]
        state.vcidss.forEach(item => {
        state.vcids.push(item)
        })
    },
    idsDelAll(state) {
        state.vcids=[]
    },

    // deleteIdsAdd(state, id) {
    //     if (state.deleteIds.indexOf(id) <=0) {
    //         state.deleteIds.push(id)
    //     }  
    // },
    // deleteIdsDel(state, id) {
    //     state.deleteIds.splice(state.deleteIds.indexOf(id), 1)
    // },
}
  
const actions = {
    idsAdd({ commit }, payload) { commit('idsAdd', payload) },
    idsDel({ commit }, payload) { commit('idsDel', payload) },

    idssAdd({ commit }) { commit('idssAdd') },
    idssDel({ commit }) { commit('idssDel') },

    idsAddAll({ commit }) { commit('idsAddAll') },
    idsDelAll({ commit }) { commit('idsDelAll') },

    // deleteIdsAdd({ commit }) { commit('deleteIdsAdd') },
    // deleteIdsDel({ commit }) { commit('deleteIdsDel') },
}

const getters = {
    idsCheckAll: (state) => {
        var chkAll = true
        state.vcidss.forEach((item) => {
            if (state.vcids.indexOf(item) == -1) { chkAll = false }
        })
        return chkAll
    },
}
  
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}