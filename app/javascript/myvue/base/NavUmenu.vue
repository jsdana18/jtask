<template>
  <div><ul class="dr_menu cursor-pointer" v-for="(lst, idx) in list">

      <div class="dr_btn align-middle" :class="top(lst.color)">
            <i class="material-icons align-middle hidden">{{lst.ico}}</i> 
            {{lst.name}}<i class="material-icons align-middle">arrow_drop_down</i>
      </div>

        <li class="dr_cont right-0 mr-10 bg-white border border-gray-100 w-58 z-10" :class="drop(lst.color)">
            <div v-for="dlst in lst.lst">
                <a :href="dlst[2]" class="mx-3 my-4 px-2 py-2 hover:bg-blued-100 hover:text-gray-700"><i class="material-icons align-middle">{{dlst[0]}}</i> {{dlst[1]}}</a>
            </div>
                <a href="/users/sign_out" data-method="delete" class="mx-3 my-4 px-2 py-2 hover:bg-blued-100 hover:text-gray-700"><i class="material-icons align-middle">forward</i> 登出</a>
        </li>

  </ul></div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
const ax=require('axios')

export default {
  props: {
      list: {
          type: Array,
          default: []
      },
  },
  methods: {
    ...mapActions('info',[
            "flashChange" 
    ]),
    top: function(value) {
        return "text-" + value + "-450 hover:text-" +　value + "-450"
    },
    drop: function(value) {
      return "text-" + value + "-450"
    },
  } 
}
</script>

<style>

.dr_menu, .dr_links a{ 
  @apply relative inline-block;}

.dr_cont {
  @apply absolute z-10 hidden; }
  
.dr_menu:hover .dr_cont, .dr_cont a {
  @apply block; }
    
</style>