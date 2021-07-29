<template>
    <div class="s2 text-gray-650 my-1">
    <select name="product[cat_id]" id="product_cat_id" v-model="selected" class="w-full px-3 py-3 border tracking-wider text-gray-700">
            <option class="py-4 text-gray-550 hover:text-white hover:bg-gray-550" v-for="(lst,idx) in findlist" v-if="findlist.length!=0" :value="lst.id"> {{lst.title}}</option>
    </select>
   </div>
</template>

<script>
export default {
    data: function() {
        return {
            selected: '',
            //cr: "pinkd"
        }
    },
    props: {
        list: {
            type: Array,
            default: []
        },
        catid: {
            type: Number,
            default: 0,
        },
    },
    mounted() {
        this.selected =  this.getSel
    },
    computed: {
        findlist() {
           return this.list.filter( e => e.title.includes("祈福"))
        },
        getSel() {
            var sel = this.list.filter( e => e.title.includes("祈福免費"))
            return sel.length==0 ? 4 : sel[0].id
        }
    }
    
}
</script>


</style>
    
</style>