<template>
    <transition name="slide" mode="out-in">
    <div v-if="id==-1">無資料</div>
    <div class="w-12 h-10 align-text-top mr-2" v-else>
        <label class="w-12 h-10 swi align-top" :class="labelbg"> 
            <input type="checkbox" class="opacity-0 h-0 w-0" v-model="opened" @click.prevent="openedf">
 
            <div class="sli" :class="btnbg">
              <div class="pt-2 text-sm" :class="textcolor">{{onoff}}</div>
            </div> 

        </label>     
    </div>
     </transition>
</template>

<script>
const ax = require('axios')

export default {
  // data: function() {
  //   return {
  //     vOpened: true,
  //   }
  // },
  props: {
    cname: String,
    id: Number,
    opened: {
      type: Boolean,
      default: true
    }
  },
  computed: {
    onoff() {
      return (this.opened==true) ? "開" : "關"
    },
    labelbg() {
      return (this.opened==true) ? "bg-greend-600 hover:bg-greend-700" : "bg-pinkd-600 hover:bg-pinkd-700"
    },
    btnbg() {
      return (this.opened==true) ? "right-0 border-greend-600 hover:border-greend-700" : "left-0 border-pinkd-600 hover:border-pinkd-700" 
    },
    textcolor() {
      return (this.opened==true) ? "right-0 text-greend-600 hover:text-greend-700" : "left-0 text-pinkd-600 hover:text-pinkd-700"
    },
    curl() {
        return '/' + this.cname + '/' + this.id + "/toggled"
    },
  },
  methods: {
    openedf: function() {
        var _this = this
        ax.post(this.curl, {id: this.id })
          .then(function (res) {
          _this.opened = !_this.opened
        })     
    },
  },
}
</script>

<style>
.swi {
  @apply relative inline-block rounded; }

.sli {
  @apply absolute rounded cursor-pointer w-6 border bg-white text-center top-0 bottom-0; }

.slide-enter-active, .slide-leave-active {
  transition: all .8s ease; }

.slide-enter {
  transform: translateX(12px); }

.slide-leave-to {
  transform: translateX(-12px);}

</style>