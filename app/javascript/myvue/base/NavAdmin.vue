<template>
  <div class="dr_links w-full border-t border-b border-gray-500 s2 align-middle tracking-wide py-4">
    <ul class="dr_menu text-white pr-2" v-for="(lst, idx) in list">
      <button class="dr_btn" :class="top(lst.color)"><i class="material-icons align-middle">{{lst.ico}}</i> {{lst.name}}<i class="material-icons align-middle">arrow_drop_down</i></button>
        <li class="dr_cont bg-white border border-gray-100 text-left w-72 rounded z-30" :class="drop(lst.color)">
              <div v-for="dlst in lst.lst">
                  <a :href="dlst[2]" class="px-2 py-1 my-4 mx-6 hover:bg-blued-100 hover:text-gray-800"><i class="material-icons align-middle">{{dlst[0]}}</i> {{dlst[1]}}</a>
              </div>
        </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
      list: {
          type: Array,
          default: []
      },
  },
  methods: {
    top: function(value) {
        return "text-" + value + "-700 hover:text-" +　value + "-850"
    },
    drop: function(value) {
      return "text-" + value + "-700"
    }
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