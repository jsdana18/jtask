<template>
    <div class="flex max-w-5xl ml-auto mr-auto items-center text-xl my-8 pt-3 pb-2 text-gray-700 rounded" v-if="checkSeen" >
        <div class="flex-shrink ml-8 pt-1 align-middle"><input type="checkbox" @click="sela" v-model="selected">&nbsp; 全選 </div>
        <div class="flex-grow inline-flex justify-end flex-wrap"> 
            <div class="hidden"> {{vcids}} </div>
            <div class="pb-2"><a href="#" @click.prevent="delallf" class="border-redd-400 text-redd-400 hover:bg-redd-550 hover:border-redd-550 hover:text-white border rounded mb-1 pb-1 pt-1 px-3 mr-3 align-middle"> <i class="material-icons align-middle text-">not_interested</i> 選擇全刪 </a></div>
            <div class="pb-2"><a href="#" @click.prevent="openedallf('on')" class="border-greend-550 text-greend-550 hover:bg-greend-650 hover:text-white border rounded mb-1 pb-1 pt-1 px-3 mr-3 align-middle"> <i class="material-icons align-middle text-">toggle_on</i> 選擇全開 </a></div>
            <div class="pb-2"><a href="#" @click.prevent="openedallf('off')" class="border-pinkd-550 text-pinkd-550 hover:bg-pinkd-650 hover:text-white border rounded mb-1 pb-1 pt-1 px-3 mr-3 align-middle"> <i class="material-icons align-middle text-">toggle_off</i> 選擇全關 </a></div>
            <div class="pb-2"><a :href="nurl" class="border-purpled-550 text-purpled-550 hover:bg-purpled-650 hover:text-white border rounded mb-1 pb-1 pt-1 px-3 mr-3 align-middle"> <i class="material-icons align-middle text-">add_box</i> 新增一筆 </a></div>
        </div>
    </div>
</template>

<script>
import { mapState, mapActions, mapGetters } from 'vuex'
const ax = require('axios')

export default {
    data: function() {
        return {
            selected: false,
        }
    },
    props: {
        cname: { 
            type: String,
            default: false },
    },
    computed: {
        ...mapState('list',[
            'vcidss',
            'vcids',
        ]),
        ...mapGetters('list',[
            'idsCheckAll'
        ]),
        ...mapState('info',[
            //'isAdmin',
            'modalYes',
            'modalYesMsg',
            'modalSeen',
        ]),
        ...mapState('current',[
            'isAdmin',
        ]),
        nurl() {
            return "/" + this.cname + "/new"
        },
        surl() {
            return "/" + this.cname + "/selids"
        },
        checkSeen() {
            return (this.vcidss!="" && this.isAdmin==true ) ? true : false
        }
    },
    methods: {
        ...mapActions('list',[
            "idsAddAll",
            "idsDelAll",
        ]),
        ...mapActions('info',[
          "modalChange",
          "modalSeenToggle",
          "modalYesToggle",
          "modalYesMsgChange"  
        ]),
        sela: function() {
            if (!this.selected){
                this.idsAddAll()
            } else {
                this.idsDelAll()
            }
            this.selected = !this.selected
        },
        delallf: function() {
            this.modalYesToggle(false)
            this.modalChange({key: 'error', head: '刪除', msg: '確定刪除所選資料？'})
            this.modalYesMsgChange('del')
            this.modalSeenToggle(true) 
        },
        openedallf: function(meth) {
            this.modalYesToggle(false)
            var selmsg = (meth=="on") ? "開啟" : "關閉"
            this.modalChange({key: 'error', head: selmsg, msg: '確定' + selmsg + '所選資料？'})
            this.modalYesMsgChange(meth)
            this.modalSeenToggle(true) 
        },

    },
    watch: {
        vcids(newValue, oldValue) {
            this.selected = this.idsCheckAll //判斷是否全選
        }
    }
}
</script>

<style>
input[type="checkbox"] {
    @apply inline-block align-text-top cursor-pointer rounded ;

    width:18pt;
    height:18pt;} 

</style>
