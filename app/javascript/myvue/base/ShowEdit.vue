<template>
    
    <transition name="fade" mode="in-out">
    <div class="mr-auto ml-auto inline-flex align-text-top" v-if="isAdmin">
          <div class="w-10 h-10 mr-1 text-center align-text-top pt-1 border border-gray-500 text-gray-500 rounded bg-white hover:bg-redd-400 hover:text-white cursor-pointer" @click.prevent="delf"><i class="material-icons align-text-top">remove_circle</i></div>
          <div class="w-10 h-10 mr-1 text-center align-text-top pt-1 border border-gray-500 text-gray-500 rounded bg-white hover:bg-indigod-400 hover:text-white"><a :href="eurl" class="cursor-pointer"><i class="material-icons align-text-top">edit</i></a></div>
          <show-opened :cname="cname" :id="id" :opened="opened"></show-opened>
    </div>
    </transition>
          
</template>

<script>
import { mapState, mapActions } from 'vuex'

const ax = require('axios')

export default {
    props: {
      cname: String,
      id: Number,
      idx: { type: Number, default: -1 },
      opened: { type: Boolean, default: true }, 
    }, 
    computed: {
      ...mapState('info',[
            'modalSeen',
            'modalYes',
        ]),
        ...mapState('current',[
            'isAdmin',
        ]),
      durl() { 
        return '/' + this.cname + "/" + this.id    
      },
      eurl() {
        return '/' + this.cname + "/" + this.id + "/edit"
      },
      curl() {
        return '/' + this.cname + "/" + this.id + "/toggled"
      },
    },
    methods: {
      ...mapActions('info',[
          "modalChange",
          "modalSeenToggle",
          "modalYesToggle",
          "modalYesMsgChange"  
      ]),
      delf: function() {
        this.modalYesToggle(false)
        this.modalChange({key: 'error', head: '刪除', msg: '確定刪除此筆資料？'})
        this.modalYesMsgChange(this.idx)
        this.modalSeenToggle(true) 
      },
      // openedf: function() {
      //   this.modalYesToggle(false)
      //   this.modalChange({key: 'error', head: '刪除', msg: '確定刪除此筆資料？'})
      //   this.modalYesMsgChange(this.idx)
      //   this.modalSeenToggle(true) 
      // },
    },
}
</script>

<style>
.cclo{
  @apply bg-pinkd-400;
  transition: opacity .4s;
}

.cclo:hover {
  @apply bg-pinkd-700;
  transition: opacity .4s;
}

.cnclo{
  @apply bg-greend-700;
  transition: opacity .4s;
}

.cnclo{
  @apply bg-greend-800;
  transition: opacity .4s;
}

.destroy-mask {
  @apply fixed bg-yellowd-200 table w-full h-full z-50;
  top: 0;
  left: 0;
  background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
}


</style>