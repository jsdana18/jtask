const state = {
    isAdmin: false,
    // isUpgrade: false,
    uid: -1,
        uiaids: [],
    // uwaids: [],
    // istateList: [],

    colorall: [ "gray", 'pinkd','purpled', 'greend', "oranged", "indigod", "blued", 'teald', 'yellowd',  'redd',  'pink', "red", "orange",  "yellow", "green", "teal", 'indigo', "blue", "purple"],
    color: ['blued', 'pinkd', 'purpled', 'greend','indigod', 'redd', 'yellowd']
}
  
const mutations = {
    isAdminToggle(state, payload) {
        if (payload != 'toggle') {
            state.isAdmin = payload
        } else {
            state.isAdmin = !state.isAdmin
        }
    },
    // isUpgradeToggle(state, payload) {
    //     if (payload != 'toggle') {
    //         state.isUpgrade = payload
    //     } else {
    //         state.isUpgrade = !state.isUpgrade
    //     }
    // },
    uidChange(state, payload) {
        state.uid = payload
    },
    uiaidsChange(state, payload) {
        state.uiaids = payload
    },
    // uwaidsChange(state, payload) {
    //     state.uwaids = payload
    // },
    // istateListChange(state, payload) {
    //     state.istateList = payload
    // },
    // istateListUstateChange(state, payload) {
    //     state.istateList[payload.index].ustate = payload.ustate
    // },
    // istateListIstateGet(state) {
    //     state.istateList.forEach(p => {
    //         var ostate = p.ostate
    //         var ustate = p.ustate
    //         var istate = ""

    //         // ==== 判斷 istate === start 
    //         if (ostate == "stoping") { istate = (ustate=="upass") ? "uunpass" : "stoping" }
    //         else {
    //             if (ustate=="upass") { istate= "uunpass" }
    //             if (ustate=="uunpass" || ustate=="" || ustate==null) {
    //                 if (ostate=="passing") { istate="upass"}
    //                 if (ostate=="awaiting") { istate="awaiting"}
    //             }
    //             if (ustate=="uwaiting") { istate="uwaiting"}
    //         }
    //         if (p.is_owner==true) { istate = "isowner" }
    //         if (p.wish_id==1) { istate = "stoping" }
    //         // ==== 判斷 istate === end 
    //         p.istate = istate
    //         // console.log("p.ostate: " + p.ostate + " p.ustate: " + p.ustate + " p.istate: " + p.istate)
    //     })
    // }
}
  
const actions = {
    isAdminToggle({ dispatch, commit, state }, payload) { commit('isAdminToggle', payload) },
    // isUpgradeToggle({ dispatch, commit, state }, payload) { commit('isUpgradeToggle', payload) },
    // isPrivacyToggle({ dispatch, commit, state }, payload) { commit('isPrivacyToggle', payload) },

    uidChange({ dispatch, commit }, payload) { commit('uidChange', payload) },
    uiaidsChange({ dispatch, commit }, payload) { commit('uiaidsChange', payload) },
    // uwaidsChange({ dispatch, commit }, payload) { commit('uwaidsChange', payload) },
    // istateListChange({ dispatch, commit }, payload) { commit('istateListChange', payload) },
    // istateListUstateChange({ dispatch, commit }, payload) { commit('istateListUstateChange', payload) },
    // istateListIstateGet({ dispatch, commit }) { commit('istateListIstateGet') }
}

const getters = {
}
  
export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations
}

