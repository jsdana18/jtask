<template> 
    <div class="modal-mask fade" v-if="modalSeen"> 
        <div class="inline-flex block w-full mt-24 justify-between">
            <div class="flex-shrink"> &nbsp; </div>
            <div class="flex-grow bg-white max-w-xl rounded align-middle">
                <div class="text-2xl tracking-widest pb-4 pt-4 pl-6 text-white align-middle rounded-t" :class="color | bg"> <i class="material-icons align-middle text-">{{ico}}</i> {{modalHead}}
                <button type="button" class="float-right text-4xl text-black px-4 hover:text-gray-700" data-dismiss="alert" @click.prevent="modalSeenToggle()">×</button></div>
                <div class="tracking-wider text-gray-750 text-xl pl-6 pt-4 pb-1 leading-relaxed"> {{modalMsg}} </div>
                <div class="text-center py-8"> 
                    <a href="#" class="cursor-pointer rounded-lg px-6 bg-greend-400 py-2 text-greend-800 mr-12 hover:bg-greend-500 hover:text-greend-900" @click.prevent="yesTrue()" > Yes </a> 
                    <a class="cursor-pointer rounded-lg px-6 py-2 bg-pinkd-300 text-pinkd-800 hover:bg-pinkd-400 hover:text-pinkd-900" @click.prevent="modalSeenToggle()"> No </a> 
                </div>
            </div>
            <div class="flex-shrink"> &nbsp;</div>
        </div>
    </div>
</template>


<script>
import { mapState, mapActions } from 'vuex'
export default {
    props: {
        ckey: { 
            type: String,
            default: 'notice' },
        chead: { 
            type: String,
            default: 'Notice' },
        cmsg: { 
            type: String,
            default: '' },
    },
    filters: {
        bg: function(value) {
            return "bg-" + value + "-700"
        }
    },
    computed: {
        ...mapState('info',[
            'modalSeen',
            'modalKey',
            'modalHead',
            'modalMsg',
        ]),
        ico() {
            if (this.modalKey=="notice") return 'info'
            if (this.modalKey=="success") return 'done'
            if (this.modalKey=="alert") return 'help'
            if (this.modalKey=="error") return 'error'
        },
        color() {
            if (this.modalKey=="notice") return 'indigo'
            if (this.modalKey=="success") return 'greend'
            if (this.modalKey=="alert") return 'yellowd'
            if (this.modalKey=="error") return 'red'
        },
    },
    mounted: function() {
        if (this.cmsg != '')
            {   this.modalChange({key: this.ckey, head: this.chead, msg: this.cmsg})
                // this.timer = setTimeout(this.modalSeenTrue() , 1000 * 3) 
            }
    },
    // beforeDestroy() {
    //   clearTimeout(this.timer)
    // },
    methods: {
        ...mapActions('info',[
            "modalSeenToggle",
            "modalYesToggle",
            "modalYesMsgChange",
            "modalChange",
        ]),
        yesTrue: function() {
            this.modalYesToggle(true)
            this.modalSeenToggle(false)
        }
    }
}
</script>

<style>

.modal-mask {
  @apply fixed bg-yellowd-200 w-full h-full z-50;
  top: 0;
  left: 0;
  background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
}
    
</style>