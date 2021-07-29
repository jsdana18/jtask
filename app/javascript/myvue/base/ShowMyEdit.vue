<template>
    
    <transition name="fade" mode="in-out">
    <div class="mr-auto ml-auto inline-flex align-text-top" v-if="ismine">
          <div class="w-8 h-8 mr-1 text-center align-text-top border border-gray-600 text-gray-600 rounded hover:bg-redd-400 hover:text-white cursor-pointer" @click.prevent="openedf"><i class="material-icons pt-1 align-top">not_interested</i></div>
          <div class="w-8 h-8 mr-1 text-center align-text-top border border-gray-600 text-gray-600 rounded hover:bg-indigod-400 hover:text-white"><a :href="eurl" class="cursor-pointer"><i class="material-icons pt-1 align-top">edit</i></a></div>     
    </div>
    </transition>
          
</template>

<script>
import { mapState, mapActions } from 'vuex'

const ax = require('axios')

export default {
    data: function() {
        return {
            cr: 'purpled-700',
            ismine: true
        }
    },
    props: {
      cname: String,
      id: Number,
      idx: { type: Number, default: -1 }
    }, 
    computed: {
      ...mapState('info',[
            'modalSeen',
            'modalYes',
            //'isAdmin'
        ]),
        ...mapState('current',[
            'isAdmin',
        ]),
      crbg() {
        return "bg-" + this.cr   
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
      openedf: function() {
        this.modalYesToggle(false)
        this.modalChange({key: 'error', head: '刪除', msg: '確定刪除此筆資料？'})
        this.modalYesMsgChange(this.idx)
        this.modalSeenToggle(true)
      },
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