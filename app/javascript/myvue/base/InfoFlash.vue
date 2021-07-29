<template>
    <transition mode="out-in">
        <div class= "border my-2 mx-2 text-xl px-2 py-2 mb-2 rounded relative" :class="clsdiv" v-if="flashSeen">
            <button type="button" class="float-right" :class="clsbtn" @click="flashSeenToggle()">×</button>
                <i class="material-icons align-middle text-">{{ico}}</i> {{flashMsg}}
        </div>   
    </transition>
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
    data: function() {
        return {
            timer: 0,
        }
    },
    props: {
        ckey: { 
            type: String,
            default: 'alert' },
        cmsg: { 
            type: String,
            default: '' },
    },
    computed: {
        ...mapState('info',[
            'flashKey',
            'flashMsg',
            'flashSeen',
        ]),
        ico() {
            if (this.flashKey=="notice") return 'info'
            if (this.flashKey=="success") return 'done'
            if (this.flashKey=="alert") return 'help'
            if (this.flashKey=="error") return 'error'
        },
        color() {
            if (this.flashKey=="notice") return 'indigod'
            if (this.flashKey=="success") return 'greend'
            if (this.flashKey=="alert") return 'yellowd'
            if (this.flashKey=="error") return 'redd'
        },
        clsdiv() {
            return "bg-" + this.color + "-100 border-" + this.color + "-300 text-" + this.color + "-700"
        },
        clsbtn() {
            return "text-" + this.color + "-700"
        },
    },
    mounted: function() {
        // if (this.cmsg != '' || this.cmsg=="true") {
                this.flashChange({ckey: this.ckey, cmsg: this.cmsg})
                //this.timer = setTimeout(this.flashSeenToggle(true) , 1000 * 3)
        // }
    },
    // beforeDestroy() {
    //   clearTimeout(this.timer)
    // },
    methods: {
        ...mapActions('info',[
            "flashSeenToggle",
            "flashChange",
        ]),
    },
}
</script>

<style>

.v-enter { opacity: 0; }
.v-enter-active  { transition: opacity .2s }
.v-enter-to { opacity: 1; }
.v-leave { opacity: 1 ; }
.v-leave-active { transition: opacity .2s }
.v-leave-to { opacity: 0; }
    
</style>
