<template>
   <transition mode="out-in">
        <button @click="ppost" class="transition duration-300 px-3 py-1 rounded" :class="pclass"> 
            <slot></slot>
        </button>
   </transition>
    
</template>

<script>
import { mapState, mapActions, mapGetters } from 'vuex'
const ax= require('axios')

export default {
    data: function() {
        return {

        }
    },
    props: {
        pclass:  {
            type: String,
            default: '', },
        purl: {
            type: String,
            default: '', },
    },
    methods: {
        ...mapActions('info',[
            "flashChange" 
        ]),
        ppost: function() {
           const _this = this
           ax.post(this.purl)
             .then(function (res) {
                _this.flashChange({ckey: 'success', cmsg: res})
             })
        }
    }
}
</script>